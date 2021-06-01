import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/route.dart';
import 'package:mobile_guid/widgets/chipForPlaces.dart';
import 'package:velocity_x/velocity_x.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  _RoutesScreenState createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  List<Route> _filteredList = List.empty();


  static Future<Response<String>> getRoutes() async {
    return await Dio().get<String>("http://185.246.67.169:5002/api/routes");
  }

  Future<List<Routes>> _getRoutes3() async {
    var routes = await getRoutes().then((value) =>
        (jsonDecode(value.data!) as List)
            .map((e) => Routes.fromJson(e))
            .toList());
    print(routes);

    

    return routes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: HStack([
                    chipForRoute('Популярные места', kPrimaryColor).p(5),
                    chipForRoute('Музеи', kPrimaryColor).p(5),
                  ]).box.margin(EdgeInsets.all(6.0)).make())
              .box
              .make(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 80.0),
              child: FutureBuilder<List<Routes>>(
                builder: (ctx, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    final routes = snapshot.data!;

                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 260.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(routes[index].image),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Text(
                                routes[index].name,
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              ExpansionTile(
                                title: Text('Подробнее',
                                    style: TextStyle(
                                        fontSize: 14.0, color: kPrimaryColor)),
                                trailing: Icon(
                                  Icons.more_horiz_rounded,
                                  color: kPrimaryColor,
                                ),
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10.0),
                                    child: Center(
                                      child: Text(
                                        routes[index].description,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                        // Text(route.name).box.make().onTap(() {
                        //   // TODO: Передать список плейсов в новую страницу и отобразить
                        //    // ignore: unnecessary_statements
                        //    route.placesForRoute;
                        // });
                      },
                      itemCount: routes.length,
                    );
                  } else
                    return Center(child: CircularProgressIndicator());
                },
                future: _getRoutes3(),
              ),
            ),
          ),
        ],
      ),
    );

    // Padding(
    //   padding: EdgeInsets.all(12),
    //   child: Card(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20),
    //         side: BorderSide(color: Colors.black, width: 2),
    //       ),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: <Widget>[
    //             Container(
    //               height: 200.0,
    //             ),
    //             ExpansionTile(title: Text('Подробнее о маршруте'),
    //             children: <Widget>[
    //               Text('Тут большое крссивое описание',)
    //             ],
    //             )
    //           ],
    //         ),
    //       )),
    // ));
  }
}


Widget chipForRoute(String label, Color color){
    return ActionChip(labelPadding: EdgeInsets.all(8.0),
    
    
    label: Text(label, style: TextStyle(
      color: Colors.white
        
      
    )
    ),
    onPressed: () {
      if(label == 'Популярные места'){
        
      }
    },
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey,
    padding: EdgeInsets.all(10.0),
    
    );
  }