import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/place.dart';
import 'package:mobile_guid/screens/secondScreen.dart';
import 'package:mobile_guid/widgets/chipForPlaces.dart';
import 'package:velocity_x/velocity_x.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  _StartScreenState() {
    _getPlaces3();
  }

  
  List<Places> _listPlaces = [];
  // getPlaces2() async{
  //    setState(() async{
  //     _listPlaces = await getPlaces();

  //   });
  // }

  static Future<List<Places>>getPlaces() async {


    // var options = BaseOptions(
    //   baseUrl: "http://185.246.67.169:5002/api/places",
    // );
    // var dio = Dio(options);
    var _str = await Dio().get("http://185.246.67.169:5002/api/places").then((value) => placesFromJson(value.data));
    print(_str);
    return _str;
    
  }

  _getPlaces3() async {

    var hh = getPlaces();
    
      
      setState(() async{
        _listPlaces = await getPlaces();
            
      });
      //print(productsData.length);
    
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
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                  height: 100,
                  width: 100,
              child: ListView.builder(
                
                  itemCount: _listPlaces.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: Row(
                        children: <Widget>[Text(_listPlaces[index].name)],
                      ),
                    );
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
