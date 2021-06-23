import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/route.dart';
import 'package:mobile_guid/screens/show_route_screen.dart';

import 'package:velocity_x/velocity_x.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  _RoutesScreenState createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
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
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      appBar: AppBar(
        title: Text('Маршруты'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: FutureBuilder<List<Routes>>(
                builder: (ctx, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    final routes = snapshot.data!;

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: routes.length,
                      itemBuilder: (BuildContext context, int index) {
                        final route = routes[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new ShowRouteScreen(
                                        route.placesForRoute)));
                          },
                          child: Card(
                            elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top:20.0, left: 10.0, bottom: 10.0),
                                      child: Text(
                                        "Тема маршрута: " + routes[index].topic,
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                fontSize: 18.0,
                                                color: kPrimaryColor,
                                                decoration: TextDecoration.underline,)),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 260.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                routes[index].image),
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
                                Theme(
                                  data: theme,
                                  child: ExpansionTile(
                                    title: Text('Подробнее',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black)),
                                    trailing: Icon(
                                      Icons.more_horiz_rounded,
                                      color: Colors.black,
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
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
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
  }
}

Widget chipForRoute(String label, Color color) {
  return ActionChip(
    labelPadding: EdgeInsets.all(8.0),
    label: Text(label, style: TextStyle(color: Colors.white)),
    onPressed: () {
      if (label == 'Популярные места') {}
    },
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey,
    padding: EdgeInsets.all(10.0),
  );
}
