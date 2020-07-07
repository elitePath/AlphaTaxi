import 'package:alpha_taxi/animations/fade-animations.dart';
import 'package:alpha_taxi/animations/route_animations/slide_from_left_page_route.dart';
import 'package:alpha_taxi/components/custom-circular-button-main.dart';
import 'package:alpha_taxi/screens/auth/pin-validation-screen.dart';
import 'package:alpha_taxi/theme/style.dart';
import 'package:alpha_taxi/utils/color.dart';
import 'package:alpha_taxi/utils/network-utils.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Stack(children: <Widget>[
              Container(
                height: 302,
                width: double.infinity,
                decoration: new BoxDecoration(
                  color: HexColor("#1FCD6C"),
                  boxShadow: [new BoxShadow(blurRadius: 10.0)],
                  borderRadius: new BorderRadius.vertical(
                      bottom: new Radius.elliptical(
                          MediaQuery.of(context).size.width, 100.0)),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 85),
                  child: FadeAnimation(
                    0.8,
                    new Image.asset(
                      "assets/green_car.png",
                      width: 189,
                      height: 408,
                    ),
                  ),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'OpenSans',
                    color: HexColor("#0D1724"),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Alpha Taxi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'OpenSans',
                    color: HexColor("#0D1724"),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 2, bottom: 2),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: HexColor("#CFD1D3"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              margin: EdgeInsets.all(30),
              child: Row(
                children: <Widget>[
                  Text(
                    "+234",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      color: HexColor("#0D1724"),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: new TextField(
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      cursorColor: HexColor("#0D1724"),
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'OpenSans',
                            color: HexColor("#CFD1D3"),
                            fontWeight: FontWeight.w300,
                          ),
                          hintText: "808 383 8946"),
                    ),
                  ),
                ],
              ),
            ),

            CustomCircularButtonMain(
              onPressed: (){
                if(textEditingController.text.length != 10){
                  NetworkUtils.showToast("Please input a valid phone number");
                } else{
                  Navigator.pushReplacement(
                      context, SlideFromLeftPageRoute(widget:
                  PinValidationScreen(phoneNumber: "+234"+textEditingController.text,)));
                }
              },
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              backgroundColor: primaryColor,
              text: "Get Started",
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
