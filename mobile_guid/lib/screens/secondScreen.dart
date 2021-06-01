import 'package:flutter/material.dart';
import 'package:mobile_guid/screens/placesScreen.dart';
import 'package:mobile_guid/screens/routes_screen.dart';
import 'package:mobile_guid/widgets/customClipper.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
                color: Colors.green.shade500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 180, bottom: 10),
                      alignment: Alignment.bottomLeft,
                      child: Image.asset("assets/images/routes.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        'Маршруты',
                        style: TextStyle(fontSize: 26.0, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
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
                  color: Colors.green.shade400,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 100, right: 10, top: 10),
                        alignment: Alignment.topRight,
                        child: Image.asset("assets/images/placesTwo.png"),
                      ),
                      Text(
                        'Места',
                        style: TextStyle(fontSize: 26.0, color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
