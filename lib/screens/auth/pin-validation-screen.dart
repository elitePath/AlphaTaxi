import 'package:alpha_taxi/animations/route_animations/slide_from_left_page_route.dart';
import 'package:alpha_taxi/components/custom-circular-button-main.dart';
import 'package:alpha_taxi/screens/auth/index.dart';
import 'package:alpha_taxi/screens/home/index.dart';
import 'package:alpha_taxi/theme/style.dart';
import 'package:alpha_taxi/utils/color.dart';
import 'package:alpha_taxi/utils/network-utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
class PinValidationScreen extends StatefulWidget {
 final String phoneNumber;
  PinValidationScreen({Key key, this.phoneNumber}) : super(key: key);
  @override
  _PinValidationScreenState createState() => _PinValidationScreenState();
}

class _PinValidationScreenState extends State<PinValidationScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BoxDecoration pinPutDecoration = BoxDecoration(
      border: Border.all(color: HexColor("#1FCD6C")),
      borderRadius: BorderRadius.circular(15));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Verification ', style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'OpenSans',
                        color: HexColor("#0D1724"),
                        fontWeight: FontWeight.w300,
                      ),),
                      TextSpan(text: 'Code',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontFamily: 'OpenSans',
                            color: HexColor("#0D1724"),
                            fontWeight: FontWeight.w700,
                          ),),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Please type the verification code sent to ', style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'OpenSans',
                        color: HexColor("#0D1724"),
                        fontWeight: FontWeight.w300,
                      ),),
                      TextSpan(text: ' ' + widget.phoneNumber,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'OpenSans',
                          color: HexColor("#0D1724"),
                          fontWeight: FontWeight.w700,
                        ),),
                    ],
                  ),
                ),
              ),
          SizedBox(
            height: 40,
          ),
          PinPut(
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: "OpenSans",
              color: HexColor("#0D1724"),
              fontSize: 16,
            ),
            eachFieldMargin: EdgeInsets.all(12),
            fieldsCount: 4,
            fieldsAlignment:MainAxisAlignment.center,
            eachFieldHeight: 45,
            eachFieldWidth: 45,
            onSubmit: (String pin) =>  Navigator.pushReplacement(
                context, SlideFromLeftPageRoute(widget:
           HomeScreen())),
            focusNode: _pinPutFocusNode,
            controller: _pinPutController,
            submittedFieldDecoration:
            pinPutDecoration.copyWith(borderRadius: BorderRadius.circular(20)),
            pinAnimationType: PinAnimationType.slide,
            selectedFieldDecoration: pinPutDecoration,
            followingFieldDecoration: pinPutDecoration.copyWith(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: HexColor("#CFD1D3")
              ),
            ),
          ),
              SizedBox(
                height: 50,
              ),
              CustomCircularButtonMain(
                onPressed: (){

                },
                backgroundColor: primaryColor,
                textColor: Colors.white,
                text: "Add Card",
                fontWeight: FontWeight.w700,
              ),
              CustomCircularButtonMain(
                onPressed: (){
                  Navigator.pushReplacement(
                      context, SlideFromLeftPageRoute(widget:
                  AuthScreen()));
                },
                textColor: primaryColor,
                backgroundColor: Colors.white,
                text: "Change Number",
                fontWeight: FontWeight.w300,
              ),

        ],
          ),
        ),
      ),
    );
  }
}
