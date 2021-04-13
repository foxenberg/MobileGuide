import 'package:flutter/material.dart';
import 'package:mobile_guid/models/localPlace.dart';
import 'package:mobile_guid/screens/showPlace.dart';

class PlacesScreen extends StatefulWidget {
  PlacesScreen({Key key}) : super(key: key);

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}


class _PlacesScreenState extends State<PlacesScreen> {

  List<LocalPlace> items = [];
  _PlacesScreenState()
{
  items.add(new LocalPlace("assets/images/sharif.jpg", "Кол Шариф", "Кремлевская 2", "4.2", "700", "Казань", "Россия"));
  items.add(new LocalPlace("assets/images/tower.jpg", "Башня Сююмбике", "Кремлевская 3", "4.1", "500", "Казань", "Россия"));
  items.add(new LocalPlace("assets/images/Kremlin.jpg", "Белый Кремль", "Кремлевская 4", "4.5", "650", "Казань", "Россия"));
  items.add(new LocalPlace("assets/images/CenterKazan.jpg", "Центр Казан", "Сибгата Хакима 1", "3.4", "1220", "Казань", "Россия"));
}

Widget customCell(BuildContext context, int index)
{
  return GestureDetector(
      onTap: () {
      
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowPlace(items[index]))
                );
      },
      child: Card(
      margin: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Image.asset(items[index].img, width: 150,),
            SizedBox(width: 16,),
            Text(items[index].name),
          ],
        ),),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text(
         "Places"
       )
       ),
       body: Center(child: 
       ListView.builder(
         itemCount: items.length,
         itemBuilder: (context, index) => customCell(context, index))
       ,),
    );
  }
}