import 'dart:convert';

import 'package:mobile_guid/models/place.dart';
import 'package:http/http.dart' as http;

class APIServices{

  static var placesUrl= 'http://185.246.67.169:5002/api/places';
  static Uri url = Uri.parse(placesUrl);

  static Future<List<Places>> fetchPlaces() async{
     return await http.get(url).then((value) => placesFromJson(value.body));
  }
  
  
  // static Future<List<Places>> fetchPlaces() async {
  
  // var placesUrl= 'https://localhost:5001/api/places';
  // Uri url = Uri.parse(placesUrl);
  // final response = await http.get(url);

  // if(response.statusCode == 200)
  // {
  //   return (json.decode(response.body) as List).map((data) => new Places.fromJson(data)).toList();
  // }
  // else
  // throw Exception('Error');
  
  // }

  }