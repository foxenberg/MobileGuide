import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_guid/screens/placesScreen.dart';
import 'package:mobile_guid/widgets/customClipper.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlacesScreen()));
              },
              child: Container(
                color: Colors.lightGreen,
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 80, bottom: 10),
                  alignment: Alignment.bottomLeft,
                  child: Image.asset("assets/images/routes.png"),
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: MyClipper(),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlacesScreen()));
              },
              child: Container(
                  color: Colors.green,
                  child: Container(
                    margin: EdgeInsets.only(left: 60, right: 10, top: 10),
                    alignment: Alignment.topRight,
                    child: Image.asset("assets/images/placesTwo.png"),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
