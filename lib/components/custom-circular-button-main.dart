import 'package:alpha_taxi/utils/color.dart';
import 'package:flutter/material.dart';

class CustomCircularButtonMain extends StatefulWidget {
  final Function onPressed;
  Color backgroundColor;
  String text;
  FontWeight fontWeight;
  Color textColor;
  CustomCircularButtonMain({
    this.text,
    this.fontWeight,
    this.textColor,
    this.backgroundColor,
    this.onPressed});
  @override
  _CustomCircularButtonMainState createState() => _CustomCircularButtonMainState();
}

class _CustomCircularButtonMainState extends State<CustomCircularButtonMain> {
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:widget.backgroundColor,
        ),
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontWeight: widget.fontWeight,
              fontFamily: "OpenSans",
              color: widget.textColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
