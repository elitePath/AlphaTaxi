import 'package:alpha_taxi/components/side-list-tile.dart';
import 'package:alpha_taxi/theme/style.dart';
import 'package:alpha_taxi/utils/color.dart';
import 'package:alpha_taxi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mdi/mdi.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 40),
          decoration: BoxDecoration(
            color: primaryColor,
              borderRadius: BorderRadius.only(bottomLeft:
              Radius.circular(80),
                topRight: Radius.circular(80),),
              border: Border.all(width: 3,color: primaryColor,style:
              BorderStyle.solid)
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 41,
                  child: ClipOval(
                      child: Image.network(
                        Constants.defaultProfileImg,
                        fit: BoxFit.cover,
                        width: 80.0,
                        height: 80.0,
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Laura Silver",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.5,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),

            ],
          ),
        ),
    SizedBox(
      height: 40,
    ),
        SideListTile(
          title: "Home",
          leadingIcon: Icon(Mdi.bankOutline,
            color: HexColor("#817889"),),
          onPressed: null,

        ),
        SideListTile(
            title: "Meetups",
            leadingIcon: Icon(Mdi.carConnected,
              color: HexColor("#817889"),),
            onPressed: null,

        ),
        SideListTile(
          title: "Payments",
          leadingIcon: Icon(Mdi.contactlessPaymentCircleOutline,
            color: HexColor("#817889"),),
          onPressed: null,

        ),
        SideListTile(
          title: "History",
          leadingIcon: Icon(Mdi.history,
            color: HexColor("#817889"),),
          onPressed: null,

        ),
        SideListTile(
          title: "About Us",
          leadingIcon: Icon(Mdi.informationOutline,
            color: HexColor("#817889"),),
          onPressed: null,

        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 1,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                    leading: Icon(Mdi.logout,
                      color: primaryColor,),
                    title: Text(
                      "Log out",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: primaryColor,
                      ),
                    ),
                    onTap: () {


                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
