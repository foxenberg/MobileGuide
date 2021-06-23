import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/local_city.dart';
import 'package:mobile_guid/models/place.dart';
import 'package:mobile_guid/screens/show_place.dart';

class PlacesScreen extends StatefulWidget {
  final ListCities value;
  PlacesScreen({Key? key, required this.value}) : super(key: key);

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  bool valueForSwitch = false;
  List<Place> _listPlaces = List.empty();
  List<Place> _filteredList = List.empty();
  final TextEditingController _controller = TextEditingController();

  _PlacesScreenState() {
    _getPlaces3();
  }

  static Future<Response<String>> getPlaces() async {
    return await Dio().get<String>("http://185.246.67.169:5002/api/places");
  }

  static List<Place> filterByCityName(List<Place> _list, String nameCity) {
    return _list
        .where((u) => u.city.toLowerCase().contains(nameCity.toLowerCase()))
        .toList();
  }

  static List<Place> filterByNamePlace(List<Place> _list, String namePlace) {
    return _list
        .where((u) => u.name.toLowerCase().contains(namePlace.toLowerCase()))
        .toList();
  }

  List<Place> filterPlaces() {
    return filterByNamePlace(
        filterByCityName(_listPlaces, widget.value.name), _controller.text);
  }

  _getPlaces3() async {
    var places = await getPlaces().then((value) =>
        (jsonDecode(value.data!) as List)
            .map((e) => Place.fromMap(e))
            .toList());
    print(places);

    setState(() {
      _listPlaces = places;
      _filteredList = filterPlaces();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: [
          Positioned(
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                  top: 30.0, left: 20.0, right: 20.0, bottom: 10.0),
              height: 54,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23))
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Введите место",
                        hintStyle:
                            TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: kPrimaryColor),
                      ),
                      onChanged: (string) {
                        setState(() {
                          _filteredList = filterPlaces();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              buildSwitch(),
            ],
          ),
          FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: (c, s) => valueForSwitch == true
                ? GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _filteredList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        child: Image.network(
                          _filteredList[index].photo,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
                : ListView.builder(
                    itemCount: _filteredList.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new ShowPlace(
                                      value: Place(
                                          id: _filteredList[index].id,
                                          name: _filteredList[index].name,
                                          address: _filteredList[index].address,
                                          city: _filteredList[index].address,
                                          country: _filteredList[index].country,
                                          avgCost: _filteredList[index].avgCost,
                                          rating: _filteredList[index].rating,
                                          reviews: _filteredList[index].reviews,
                                          photo: _filteredList[index].photo,
                                          latitude:
                                              _filteredList[index].latitude,
                                          longitude: _filteredList[index]
                                              .longitude))));
                        },
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
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
                                        backgroundImage: NetworkImage(
                                            _filteredList[index].photo),
                                      )),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    
                                    children: <Widget>[
                                      Text(
                                        _filteredList[index].name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined),
                                          Text(
                                            _filteredList[index].address,
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                        ' ' +
                                            _filteredList[index]
                                                .rating
                                                .toString(),
                                        style: TextStyle(fontSize: 14.0)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitch() => Transform.scale(
        scale: 1,
        child: Switch.adaptive(
          value: valueForSwitch,
          onChanged: (valueForSwitch) =>
              setState(() => this.valueForSwitch = valueForSwitch),
        ),
      );
}
