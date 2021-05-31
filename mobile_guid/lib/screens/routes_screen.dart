import 'dart:convert';
import 'package:kt_dart/kt.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/route.dart';

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
    return Scaffold(
      body: FutureBuilder<List<Routes>>(
        builder: (ctx, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final routes = snapshot.data!.kt.toList().fold<KtList<PlacesForRoute>>(KtList.empty(), (t, e) => t.plusElement(e.placesForRoute));

            return ListView.builder(itemBuilder: 
              (BuildContext context, int index) {
                return Text(routes[index].);
              },
              itemCount: routes!.length,
            );
          }
          else
          return CircularProgressIndicator();
        },

        future: _getRoutes3(),
        
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
