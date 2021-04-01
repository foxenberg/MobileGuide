import 'package:mobile_guid/models/place.dart';
import 'package:http/http.dart' as http;

class APIServices{

  static String placesUrl="https://localhost:5001/api/places";
  static Uri url = Uri.parse(placesUrl);

  static Future<List<Places>> fetchPlaces() async{
     return await http.get(url).then((value) => placesFromJson(value.body));
  }
  
  }