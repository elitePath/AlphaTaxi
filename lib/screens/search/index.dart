import 'dart:async';
import 'package:alpha_taxi/bloc/default.dart';
import 'package:alpha_taxi/components/default-text-form-screen.dart';
import 'package:alpha_taxi/model/place.dart';
import 'package:alpha_taxi/utils/color.dart';
import 'package:alpha_taxi/utils/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = new TextEditingController();
  String _heading;
  List<Place> _placesList;
  final List<Place> _suggestedList = [];
  MainBloc _bloc;
  Timer _throttle;
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _bloc = Provider.of<MainBloc>(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placesList = _suggestedList;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#1DC167"),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: HexColor("#FFFFFF"),
              boxShadow: [new BoxShadow(blurRadius: 10.0)],
              borderRadius: new BorderRadius.vertical(
                  bottom: new Radius.elliptical(
                      MediaQuery.of(context).size.width, 20.0)),
            ),
            width: double.infinity,
            height: 180,
          ),
          Column(
            children: <Widget>[
              DefaultTextFormField(
                disabled: true,
                hintText: "From: " + _bloc.userLocation.address,
              ),
              DefaultTextFormField(
                hintText: 'Search Anywhere',
                controller: _searchController,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _placesList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      resultsCard(context, index),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onSearchChanged() {
    if (_throttle?.isActive ?? false) _throttle.cancel();
    _throttle = Timer(const Duration(milliseconds: 500), () {
      getLocationResults(_searchController.text);
    });
  }

  void getLocationResults(String input) async {
    String request = Constants.baseURLPlaceApi +
        "?input=" +
        input +
        "&location=" +
        _bloc.userLocation.latitude.toString()+ ","
            +  _bloc.userLocation.longitude.toString() +
        "&radius=500" +
          "&key=" +
        Constants.apiKey;
    Response response = await Dio().get(request);
    var predictions = response.data['predictions'];
    print(response);
    List<Place> _displayResults = [];
    for (var i = 0; i < predictions.length; i++) {
      String name = predictions[i]['description'];
      // TODO figure out the budget
      _displayResults.add(Place(name));
      print(predictions);
    }
    setState(() {
      _heading = "Results";
      _placesList = _displayResults;
    });
    if (input.isEmpty) {
      setState(() {
        _heading = "Suggestions";
      });
      return;
    }
  }

  resultsCard(BuildContext context, int index) {
    return Hero(
      tag: "SelectedTrip-${_placesList[index].name}",
      transitionOnUserGestures: true,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left:.0,
            right: 8.0,
          ),
          child: Card(
            child: InkWell(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: AutoSizeText(_placesList[index].name,
                                    maxLines: 3,
                                    style: TextStyle(fontSize: 14.5,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Mdi.timerOutline,
                        color: HexColor("#817889"),),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              onTap: () {}
            ),
          ),
        ),
      ),
    );
  }
}
