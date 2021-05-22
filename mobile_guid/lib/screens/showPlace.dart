import 'package:flutter/material.dart';
import 'package:mobile_guid/models/constants.dart';
import 'package:mobile_guid/models/place.dart';

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
       backgroundColor: kPrimaryColor,
       body: Column(
         children: <Widget>[
           Expanded(
             flex: 4,
             child: Container(
               width: double.infinity,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(120.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 4.0,),
                      IconButton( icon: new Icon(Icons.arrow_back),
                      onPressed: (){
                        Navigator.pop(context);
                      }, ),
                      SizedBox(height: 8.0,),
                      Container(
                        width: 300,
                        child: Text(widget.value.name, style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0
                        ),),
                      ),
                      SizedBox( height: 16.0,),
                      Text(
                        widget.value.address, style: TextStyle(color: Colors.black45),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text('\₽', style: TextStyle(color: kPrimaryColor, fontSize: 24.0,
                            fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            widget.value.avgCost,
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 52.0
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            child: Image.network('https://topgid.net/uploads/posts/2019-09/1568213750_parizh-francija.jpg', 
                            fit: BoxFit.cover),
                          )
                        ],



                      )
                    ],
                  ),
                ),
             ), 
           ),
           Expanded(
             flex: 1,
             child: 
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 38.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 SizedBox(height: 16.0),
                 Text('Decription', style: TextStyle(color:  Colors.white, )),
                 Spacer(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Container(
                       
                       height: 70.0,
                       width: 280.0,
                       decoration: BoxDecoration(
                         color: darkGreenColor,
                         borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(32.0),
                           topRight: Radius.circular(32.0)
                         )
                       ),
                     )
                   ],
                 )

               ],
             ),
           ))
         ],
       ),
    );
  }
}