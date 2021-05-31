

import 'package:mobile_guid/models/localPlace.dart';

class LocalRoutes {
  final String id;
  final String img;
  final String name;
  final String description;
  final String address;
  final String rating;
  final String avgCost;
  final String country;
  final String city;
  final List<LocalPlace> places;

  LocalRoutes(this.description,this.places,this.id,this.img, this.name, this.address, this.rating,
  this.avgCost, this.city, this.country);
}