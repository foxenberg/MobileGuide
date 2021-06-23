import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/local_city.dart';
import 'package:mobile_guid/models/place.dart';
import 'package:mobile_guid/screens/second_screen.dart';
import 'package:mobile_guid/screens/show_place.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/place.dart';

class StartScreen extends StatefulWidget {
  final ListCities value;
  StartScreen({Key? key, required ListCities this.value}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List<Place> _listPlaces = List.empty();
  List<Place> _filteredList = List.empty();
  _StartScreenState() {
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
      _filteredList = places;
      _filteredList = _listPlaces
          .where((u) =>
              u.city.toLowerCase().contains(widget.value.name.toLowerCase()) &&
              u.rating >= 4.0)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: VStack(
          [
            Container(
              height: size.height * 0.15,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: kDefaultPadding, bottom: 16 + kDefaultPadding),
                    height: size.height * 0.4 - 27,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36))),
                    child: Row(
                      children: <Widget>[
                        Text(
                          widget.value.name + ', ' + widget.value.country,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                child: Container(
              height: 500,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: _filteredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Place place = _filteredList[index];

                    return Container(
                        margin: EdgeInsets.all(10.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Positioned(
                              bottom: 15.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(place.name,
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold))),
                                  Text(
                                    place.city + ', ' + place.country,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 2.0),
                                      blurRadius: 6.0,
                                    )
                                  ]),
                              child: Stack(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => new ShowPlace(
                                                  value: Place(
                                                      id: _filteredList[index]
                                                          .id,
                                                      name: _filteredList[index]
                                                          .name,
                                                      address: _filteredList[index]
                                                          .address,
                                                      city: _filteredList[index]
                                                          .address,
                                                      country: _filteredList[index]
                                                          .country,
                                                      avgCost: _filteredList[index]
                                                          .avgCost,
                                                      rating: _filteredList[index]
                                                          .rating,
                                                      reviews:
                                                          _filteredList[index]
                                                              .reviews,
                                                      photo: _filteredList[index]
                                                          .photo,
                                                      latitude:
                                                          _filteredList[index]
                                                              .latitude,
                                                      longitude:
                                                          _filteredList[index]
                                                              .longitude))));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        _filteredList[index].photo,
                                        height: 340.0,
                                        width: 340.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ));
                  }),
            )),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor, // background
                      onPrimary: Colors.white, 
                      // foreground
                    ),
                    child: Text('Просмотреть еще',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold))),
                    onPressed: () {
                      context.nextPage(SecondScreen(
                          value: new ListCities(
                              widget.value.name, widget.value.country)));
                    },
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
  );
}
