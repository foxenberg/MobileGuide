import 'package:flutter/material.dart';
import 'package:mobile_guid/models/place.dart';

class CarouselSlider extends StatefulWidget {
  CarouselSlider({Key key}) : super(key: key);

  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  List<Places> places;
  // getPlaces() {
  //   APIServices.fetchPlaces().then((response) {});
  // }

    @override
    Widget build(BuildContext context) {
      return Container(
        child: FutureBuilder<List<Places>>(
            //future: APIServices.fetchPlaces(),
            builder: (BuildContext context, AsyncSnapshot<List<Places>> snapshot) {
              if (snapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(snapshot.data[index].name);
                  },
                );
              }
              else {
                return Text('fdfsd');
              }
              
            }
        ),
      );
    }
}
