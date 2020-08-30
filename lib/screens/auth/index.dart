import 'package:alpha_taxi/animations/fade-animations.dart';
import 'package:alpha_taxi/animations/route_animations/slide_from_left_page_route.dart';
import 'package:alpha_taxi/components/custom-circular-button-main.dart';
import 'package:alpha_taxi/screens/home/index.dart';
import 'package:alpha_taxi/theme/style.dart';
import 'package:alpha_taxi/utils/color.dart';
import 'package:alpha_taxi/utils/network-utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../add-card-screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController textEditingController = new TextEditingController();
  bool isCodeSent = false;
  bool isLoading = false;
  bool isLoadingWelcome = false;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BoxDecoration pinPutDecoration = BoxDecoration(
      border: Border.all(color: HexColor("#1FCD6C")),
      borderRadius: BorderRadius.circular(15));
  @override
  Widget build(BuildContext context) {
    final _pinInputLayout =
    Center(
      child: FadeAnimation(
        0.6,
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Verification ',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'OpenSans',
                          color: HexColor("#0D1724"),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'Code',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'OpenSans',
                          color: HexColor("#0D1724"),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
                      TextSpan(
                        text: 'Please type the verification code sent to ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'OpenSans',
                          color: HexColor("#0D1724"),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: '+234${textEditingController.text}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'OpenSans',
                          color: HexColor("#0D1724"),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
                fieldsAlignment: MainAxisAlignment.center,
                eachFieldHeight: 45,
                eachFieldWidth: 45,
                onSubmit: (String pin) =>{
                  Navigator.pushReplacement(
                      context, SlideFromLeftPageRoute(widget: HomeScreen()))
                  //  verifyOTP(),
                },
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(20)),
                pinAnimationType: PinAnimationType.slide,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: HexColor("#CFD1D3")),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CustomCircularButtonMain(
                isLoading: isLoading,
                onPressed: () {
                  Navigator.pushReplacement(
                      context, SlideFromLeftPageRoute(widget: AddCardScreen()));
                },
                backgroundColor: primaryColor,
                textColor: Colors.white,
                text: "Add Card",
                fontWeight: FontWeight.w700,
              ),
              CustomCircularButtonMain(
                isLoading: isLoadingWelcome,
                onPressed: () {
                setState(() {
                  isCodeSent = false;
                });
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
    final _phoneInputLayout = SingleChildScrollView(
      child: FadeAnimation(
        0.6,
       Column(
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
                  _requestSMSCodeUsingPhoneNumber();
                }
              },
              isLoading: isLoadingWelcome,
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: !isCodeSent ?
      _phoneInputLayout: _pinInputLayout
    );

  }
// ------------ Function for Sending Token to Phone Number------------
  void _requestSMSCodeUsingPhoneNumber() async{
    setState(() {
      isLoadingWelcome = true;
    });
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+234${textEditingController.text}',
        timeout: Duration(seconds:120),
        verificationCompleted: (AuthCredential phoneAuthCredential) =>{
          Navigator.pushReplacement(
              context, SlideFromLeftPageRoute(widget: HomeScreen()))
        },
        verificationFailed: (AuthException error) => {
        setState(() {
        isCodeSent = false;
        isLoadingWelcome = false;
        }),
          NetworkUtils.showToast("Verification failed. Please try again"),
          print('error message is ${error.message}'
          )
        },
        codeSent:(String verificationId, [int forceResendingToken]) {
          setState(() {
            isCodeSent = true;
            isLoadingWelcome = false;
          });
          print('verificationId is $verificationId');
          NetworkUtils.showToast("Code sent!");
        },
        codeAutoRetrievalTimeout: null);
  }
}
