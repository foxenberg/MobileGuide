import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_guid/models/local_city.dart';
import 'package:mobile_guid/screens/start_screen.dart';

class FilterCityScreen extends StatefulWidget {
  FilterCityScreen({Key? key}) : super(key: key);

  @override
  _FilterCityScreenState createState() => _FilterCityScreenState();
}

class _FilterCityScreenState extends State<FilterCityScreen> {
  List<ListCities> _listCities = [
    ListCities('Москва', 'Россия'),
    ListCities('Казань', 'Россия'),
    ListCities('Екатеринбург', 'Россия'),
    ListCities('Париж', 'Франция'),
    ListCities('Волгоград', 'Россия'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выбор города'),
        
      ),
      body: Stack(
        children: [
          Center(
            child: ConnectionStatusBar(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.red,
              lookUpAddress: 'google.com',
              
              title: const Text(
                'Please check your internet connection',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: _listCities.length,
              itemBuilder: (BuildContext context, int index) {
                final city = _listCities[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => new StartScreen(
                            value: ListCities(city.name, city.country)),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text(city.name),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
