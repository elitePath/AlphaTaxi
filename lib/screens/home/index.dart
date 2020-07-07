import 'package:alpha_taxi/theme/style.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "Main Page\n(coming soon)",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'OpenSans',
            color:Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
