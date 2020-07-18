import 'package:alpha_taxi/theme/style.dart';
import 'package:alpha_taxi/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
class AddCardScreen extends StatefulWidget {
  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3),
              decoration: new BoxDecoration(
                color: HexColor("#1FCD6C"),
                boxShadow: [new BoxShadow(blurRadius: 4.0,
                    color: Colors.black.withOpacity(0.4))],
                borderRadius: BorderRadius.circular(30)
              ),
              child: Icon(Mdi.chevronLeft,
                size: 40,
                color: Colors.white,),
            ),
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Add ', style: TextStyle(
                      fontSize: 36.0,
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),),
                    TextSpan(text: 'Card',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
