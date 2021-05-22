import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/place.dart';
import 'package:mobile_guid/screens/secondScreen.dart';
import 'package:mobile_guid/widgets/chipForPlaces.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/place.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List<Place> _listPlaces = List.empty();
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
              height: size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: kDefaultPadding, bottom: 36 + kDefaultPadding),
                    height: size.height * 0.2 - 27,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36))),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Welcome to MobileGuid',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
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
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: kPrimaryColor.withOpacity(0.5)),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon:
                                      Icon(Icons.search, color: kPrimaryColor),
                                ),
                              ),
                            ),
                            //SvgPicture.asset("asset/images/search.svg"),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: HStack([
                      chipForPlace('Теплые города', kPrimaryColor).p(5),
                      chipForPlace('Город-герой', kPrimaryColor).p(5),
                      chipForPlace('Морской бриз', kPrimaryColor).p(5),
                      chipForPlace('Андеграунд', kPrimaryColor).p(5)
                    ]).box.margin(EdgeInsets.all(6.0)).make())
                .box
                .make(),
            Container(
                child: Container(
              height: 300,
              
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listPlaces.length,
                  itemBuilder: (BuildContext context, int index) {
                    Place place = _listPlaces[index];
                    var byteForImage = place.photo;
                    
                    return Container(
                      
                        margin: EdgeInsets.all(10.0),
                        width: 300.0,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              bottom: 15.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(place.name,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2)),
                                  Text(
                                    place.city + ', ' + place.country,
                                    style: TextStyle(color: Colors.grey),
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    
                                    child: Image.network(
                                      'https://kuda-kazan.ru/uploads/2e9874baa3d0cfa829eaf9464bc34fb4.jpg',
                                      height: 180.0,
                                      width: 180.0,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ));
                  }),
            )),
            'Kazan, Russia'
                .text
                .textStyle(
                    TextStyle(fontSize: 22, backgroundColor: Colors.white))
                .makeCentered()
                .p(18),
            Row(
              children: [
                '≈ 1670 ₽'
                    .text
                    .align(TextAlign.right)
                    .textStyle(
                        TextStyle(fontSize: 18, backgroundColor: Colors.white))
                    .makeCentered(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  child: 'Выбрать'.text.make(),
                  onPressed: () {
                    context.nextPage(SecondScreen());
                  },
                )
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
