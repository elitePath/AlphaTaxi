import 'package:alpha_taxi/animations/fade-animations.dart';
import 'package:alpha_taxi/bloc/default.dart';
import 'package:alpha_taxi/screens/auth/index.dart';
import 'package:alpha_taxi/screens/home/index.dart';
import 'package:alpha_taxi/utils/pref-manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  PrefManager prefManager = PrefManager();
  Animation<double> animation;
  AnimationController _controller;
  Animation<double> _animation;
  MainBloc mainBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 100),
              child: Text(
                "ALPHA\nTAXI",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42.0,
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            FadeAnimation(
              2,
              Container(
                margin: EdgeInsets.only(top: 100),
                  child:
              new Image.asset("assets/splash_image.png")),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainBloc = Provider.of<MainBloc>(context, listen: false);
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
    //Splash screen delay before passing moving to next screen
    Future.delayed(Duration(seconds: 5), () {
      checkLoginState();
    });
  }

  void checkLoginState() async {
    Future<String> authToken = prefManager.getAuthToken();
    authToken.then((data) {
      print("authToken " + data.toString());
      if(data!=null){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()
          ),
        );
      } else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => AuthScreen()
          ),
        );
      }

    },onError: (e) {
      print(e.toString());
    });
  }
}
