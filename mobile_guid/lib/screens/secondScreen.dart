import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_guid/screens/placesScreen.dart';
import 'package:mobile_guid/screens/routes_screen.dart';
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
                    MaterialPageRoute(builder: (context) => RoutesScreen()));
              },
              child: Container(
                color: Colors.lightGreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      
                      margin: EdgeInsets.only(left: 10, right: 180, bottom: 10),
                      alignment: Alignment.bottomLeft,
                      child: Image.asset("assets/images/routes.png"),
                    ),
                    Text('Маршруты', 
                    style: TextStyle(fontSize: 22.0),),
                  ],
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
                  child: Column(
                    children: [
                     
                      Container(
                        margin: EdgeInsets.only(left: 100, right: 10, top: 10),
                        alignment: Alignment.topRight,
                        child: Image.asset("assets/images/placesTwo.png"),
                      ),
                       Text('Места'
                       , style:TextStyle(fontSize: 22.0),)
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
