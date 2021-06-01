import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/place.dart';
import 'package:mobile_guid/screens/showPlace.dart';

class PlacesScreen extends StatefulWidget {
  PlacesScreen({Key? key}) : super(key: key);

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  List<Place> _listPlaces = List.empty();
  _PlacesScreenState() {
    _getPlaces3();
  }

  static Future<Response<String>> getPlaces() async {
    return await Dio().get<String>("http://185.246.67.169:5002/api/places");
  }

  _getPlaces3() async {
    var places = await getPlaces().then((value) =>
        (jsonDecode(value.data!) as List)
            .map((e) => Place.fromMap(e))
            .toList());
    print(places);

    setState(() {
      _listPlaces = places;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
        itemCount: _listPlaces.length,
        shrinkWrap: true,
          physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new ShowPlace(
                          value: Place(
                              id: _listPlaces[index].id,
                              name: _listPlaces[index].name,
                              address: _listPlaces[index].address,
                              city: _listPlaces[index].address,
                              country: _listPlaces[index].country,
                              avgCost: _listPlaces[index].avgCost,
                              rating: _listPlaces[index].rating,
                              reviews: _listPlaces[index].reviews,
                              photo: _listPlaces[index].photo))));
            },
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Container(
                        width: 55.0,
                        height: 85.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.green,
                          backgroundImage:
                              NetworkImage(_listPlaces[index].photo),
                        )
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _listPlaces[index].name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text(
                                _listPlaces[index].address,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                    Row(
                      
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.amber,),
                          Text( ' '+_listPlaces[index].rating,style:  TextStyle(fontSize: 22.0)),
                          
                        ],
                        )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
