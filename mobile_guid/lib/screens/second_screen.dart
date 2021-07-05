import 'package:flutter/material.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/local_city.dart';
import 'package:mobile_guid/screens/places_screen.dart';
import 'package:mobile_guid/screens/routes_screen.dart';
import 'package:mobile_guid/widgets/customClipper.dart';

class SecondScreen extends StatelessWidget {
  final ListCities value;
  const SecondScreen({Key? key, required ListCities this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Выберите для просмотра')),),
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
                color: kPrimaryColor,
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
                        'Дороги',
                        style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
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
                    MaterialPageRoute(builder: (context) => PlacesScreen(value:  new ListCities(value.name, value.country))));
              },
              child: Container(
                
                  color: kPrimaryColor,
                  child: Column(
                    children: [
                      Container(
                        
                        margin: EdgeInsets.only(left: 100, right: 10, top: 10),
                        alignment: Alignment.topRight,
                        child: Image.asset("assets/images/placesTwo.png"),
                      ),
                      Text(
                        'Места',
                        style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
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
