import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_guid/screens/secondScreen.dart';
import 'package:mobile_guid/widgets/chipForPlaces.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.all(6.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          chipForPlace('Теплые города', Colors.deepPurple[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          chipForPlace('Город-герой', Colors.deepPurple[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          chipForPlace('Морской бриз', Colors.deepPurple[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: chipForPlace('Андеграунд', Colors.deepPurple[400]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(height: 400.0, reverse: false),
            items: [],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Kazan, Russia',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 22, backgroundColor: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  '≈ 1670 ₽',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, backgroundColor: Colors.white),
                ),
              ),
              Align(
                child: ElevatedButton(
                  child: Text('Выбрать'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
