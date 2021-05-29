import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/place.dart';
import 'package:mobile_guid/screens/test_map.dart';

class ShowPlace extends StatefulWidget {
  final Place value;
  ShowPlace({Key? key, required this.value}) : super(key: key);

  @override
  _ShowPlaceState createState() => _ShowPlaceState();
}

class _ShowPlaceState extends State<ShowPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
                  height: 520.0,
                  color: kPrimaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back,
                                size: 30.0, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        widget.value.name.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      SizedBox(height: 40.0),
                      Text(
                        'АДРЕС',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        widget.value.address,
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Positioned(
                          child: Image.network(
                            widget.value.photo,
                            height: 210.0,
                          )),
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 400.0,
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                                text: TextSpan(
                                    text: '\Рейтинг: ${widget.value.rating}',
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold))),
                            Text(
                              '\≈ ₽ ${widget.value.avgCost}',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Описание',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.value.reviews,
                          style:
                              TextStyle(color: Colors.black87, fontSize: 16.0),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => new TestMap()));
                            },
                            child: Text('Открыть на карте'))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
      // backgroundColor: kPrimaryColor,
      // body: Column(
      //   children: <Widget>[
      //     Expanded(
      //       flex: 4,
      //       child: Container(
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           borderRadius:
      //               BorderRadius.only(bottomLeft: Radius.circular(120.0)),
      //           color: Colors.white,
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.all(18.0),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               SizedBox(
      //                 height: 4.0,
      //               ),
      //               IconButton(
      //                 icon: new Icon(Icons.arrow_back),
      //                 onPressed: () {
      //                   Navigator.pop(context);
      //                 },
      //               ),
      //               SizedBox(
      //                 height: 8.0,
      //               ),
      //               Container(
      //                 width: 300,
      //                 child: Text(
      //                   widget.value.name,
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, fontSize: 32.0),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 16.0,
      //               ),
      //               Text(
      //                 widget.value.address,
      //                 style: TextStyle(color: Colors.black45),
      //               ),
      //               Row(
      //                 crossAxisAlignment: CrossAxisAlignment.end,
      //                 children: <Widget>[
      //                   Padding(
      //                     padding: const EdgeInsets.only(bottom: 10.0),
      //                     child: Text(
      //                       '\₽',
      //                       style: TextStyle(
      //                           color: kPrimaryColor,
      //                           fontSize: 24.0,
      //                           fontWeight: FontWeight.bold),
      //                     ),
      //                   ),
      //                   SizedBox(width: 4.0),
      //                   Text(
      //                     widget.value.avgCost,
      //                     style: TextStyle(
      //                         color: kPrimaryColor,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 52.0),
      //                   ),
      //                 ],
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.end,
      //                 children: <Widget>[
      //                   Container(
      //                     height: 250,
      //                     width: 250.0,

      //                     child: Image.network(widget.value.photo, fit: BoxFit.cover,))
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //         flex: 1,
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 38.0),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: <Widget>[
      //               SizedBox(height: 16.0),
      //               Text('Decription',
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                   )),
      //               Spacer(),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   Container(
      //                     height: 70.0,
      //                     width: 280.0,
      //                     decoration: BoxDecoration(
      //                         color: darkGreenColor,
      //                         borderRadius: BorderRadius.only(
      //                             topLeft: Radius.circular(32.0),
      //                             topRight: Radius.circular(32.0))),
      //                   )
      //                 ],
      //               )
      //             ],
      //           ),
      //         ))
      //   ],
      // ),
    );
  }
}
