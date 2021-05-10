import 'package:flutter/material.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/localPlace.dart';
import 'package:mobile_guid/screens/showPlace.dart';

class PlacesScreen extends StatefulWidget {
  PlacesScreen({Key? key}) : super(key: key);

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  List names = [
    "Places1",
    "Places2",
    "Places3",
    "Places4",
    "Places5",
    "Places6",
    "Places6",
    "Places6",
    "Places6",
    "Places6"
  ];

  List names2 = [
    "DFSDF",
    "fsdf",
    "fsdfsd",
    "fdsfsdf",
    "fsdf",
    "sdfsdf",
    "fsdf",
    "sdfsdf",
    "fsdf",
    "sdfsdf"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
        itemCount: names.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShowPlace()));
            },
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 55.0,
                          height: 75.0,
                          color: Colors.green,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.green,
                            backgroundImage: NetworkImage(
                                "https://cdn.getyourguide.com/img/location/5ffeb392eb81e.jpeg/92.jpg"),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              names[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              names2[index],
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(),
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
