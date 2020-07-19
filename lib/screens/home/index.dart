import 'dart:async';

import 'package:alpha_taxi/components/side-nav.dart';
import 'package:alpha_taxi/theme/style.dart';
import 'package:alpha_taxi/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mdi/mdi.dart';
class HomeScreen extends StatefulWidget {
  final FirebaseUser user;
  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664,
        -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          child: NavDrawer(

          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          new Center(
              child: new Column(
                children: <Widget>[],
              )),
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            left: 10,
            top: 20,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [new BoxShadow(blurRadius: 2.0)],
                  shape: BoxShape.circle,
                  color: Colors.white),
              child: IconButton(
                  icon: Icon(Mdi.menu,
                    color: Colors.grey,),
                  onPressed: () =>{
                    _scaffoldKey.currentState.openDrawer()
                  }
              ),
            ),
          ),
        ],

      ),
    );
  }
}
