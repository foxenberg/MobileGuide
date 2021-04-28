import 'package:flutter/material.dart';
import 'package:mobile_guid/models/api.services.dart';
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

  Future<Places> _placesModel;

  @override
  void initState(){
    _placesModel = APIServices.getPlaces();
    super.initState();
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
                    padding: EdgeInsets.only(left: kDefaultPadding, bottom: 36+kDefaultPadding),
                    height: size.height * 0.2 - 27,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36)
                            )
                            ),
                            child: Row(children: <Widget>[
                              Text('Welcome to MobileGuid', style: Theme.of(context).textTheme.headline5.copyWith(color:Colors.white, fontWeight: FontWeight.bold),)
                            ],),
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
                  child: FutureBuilder<Places>(
                    future: _placesModel,
                    builder: (context, snapshot){
                      
                      if(snapshot.hasData){
                        
                        return ListView.builder(
                          itemCount: snapshot.data.name.length,
                          itemBuilder: (context, index){
                            
                        return Container(
                          height: 100,
                          child: Row(
                            children: <Widget>[
                              Text(snapshot.data.name[index])
                            ],
                          ),
                        );
                      });
                      }
                      else
                        return Center(child: CircularProgressIndicator());
                      
                    },
                  ),
                ),
            // FutureBuilder(
            //   initialData: [],
            //   builder:
            //       (BuildContext context, AsyncSnapshot<List<Places>> snapshot) {
            //     if (snapshot.hasData) {
            //       return VxSwiper(
            //         items: snapshot.data
            //             .map((place) => VStack([
            //                   place.name.text.white.make(),
            //                 ])
            //                     .cornerRadius(30)
            //                     .box
            //                     .rounded
            //                     .alignCenter
            //                     .color(Vx.randomOpaqueColor)
            //                     .make()
            //                     .p4())
            //             .toList(),
            //       );
            //     } else if (snapshot.connectionState == ConnectionState.active) {
            //       return VxAnimator<double>(
            //           duration: Duration(seconds: 1, milliseconds: 500),
            //           tween: Tween<double>(begin: 30, end: 80),
            //           cycles: 0,
            //           builder: (context, animatorState, child) => Center(
            //               child: Icon(Icons.card_travel_outlined)
            //                   .iconColor(Colors.indigoAccent)
            //                   .iconSize(animatorState.value)
            //                   .card
            //                   .elevation(8)
            //                   .circular
            //                   .white
            //                   .make()
            //                   .box
            //                   .size(context.percentWidth * animatorState.value,
            //                       context.percentWidth * animatorState.value)
            //                   .make())).make();
            //     } else
            //       return "fuck go back".text.make();
            //   },
            //   future: APIServices.fetchPlaces(),
            // ),
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
