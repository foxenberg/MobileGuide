import 'package:flutter/material.dart';
import 'package:mobile_guid/models/localPlace.dart';

class ShowPlace extends StatefulWidget {
  LocalPlace _localPlace;

  ShowPlace(LocalPlace localPlace) {
    _localPlace = localPlace;
  }

  @override
  _ShowPlaceState createState() => _ShowPlaceState(_localPlace);
}

class _ShowPlaceState extends State<ShowPlace> {
  LocalPlace localPlace;

  _ShowPlaceState(LocalPlace localPlace) {
    this.localPlace = localPlace;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(appBar: AppBar(title: Text(localPlace.name),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Hero(
            transitionOnUserGestures: true,
            tag: localPlace,
          child: Transform.scale(scale: 1.0,
          child: Image.asset(localPlace.img, width:300),
          ),
          ),
          Card(
            elevation: 8,
            margin: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Text(localPlace.name),
            )
          )
      ],)
    ),
    );
  }
}
      