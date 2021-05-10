import 'dart:convert';

import 'package:mobile_guid/models/place.dart';
import 'package:http/http.dart' as http;

import 'place.dart';

class APIServices {
  // static var placesUrl= 'http://185.246.67.169:5002/api/places';
  // static Uri url = Uri.parse(placesUrl);

  // static Future<List<Places>> fetchPlaces() async{
  //    return await http.get(url).then((value) => placesFromJson(value.body));
  // }
  static String placesUrl = 'http://185.246.67.169:5002/api/places';
  static Uri placesUri = Uri.parse(placesUrl);

  static Future<Place?> getPlaces() async {
    var client = http.Client();
    ;

    try {
      var response = await client.get(placesUri);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        //placesModel = Places.fromJson(jsonMap);
      }
    } catch (Exception) {
      //return placesModel;
    }

    //return placesModel;
  }
}
