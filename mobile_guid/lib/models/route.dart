// To parse this JSON data, do
//
//     final routes = routesFromJson(jsonString);

import 'dart:convert';

List<Routes> routesFromJson(String str) => List<Routes>.from(json.decode(str).map((x) => Routes.fromJson(x)));

String routesToJson(List<Routes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Routes {
    Routes({
        required this.id,
        required this.name,
        required this.city,
        required this.country,
        required this.description,
        required this.image,
        required this.rating,
        required this.topic,
        required this.placesForRoute,
    });

    String id;
    String name;
    String city;
    String country;
    String description;
    String image;
    String rating;
    String topic;
    List<PlacesForRoute> placesForRoute;

    factory Routes.fromJson(Map<String, dynamic> json) => Routes(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        country: json["country"],
        description: json["description"],
        image: json["image"],
        rating: json["rating"],
        topic: json["topic"],
        placesForRoute: List<PlacesForRoute>.from(json["placesForRoute"].map((x) => PlacesForRoute.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "country": country,
        "description": description,
        "image": image,
        "rating": rating,
        "topic": topic,
        "placesForRoute": List<dynamic>.from(placesForRoute.map((x) => x.toJson())),
    };
}

class PlacesForRoute {
    PlacesForRoute({
        this.id,
        required this.name,
        required this.address,
        required this.reviews,
        required this.photo,
        required this.rating,
        required this.avgCost,
        required this.country,
        required this.city,
        required this.latitude,
        required this.longitude,
    });

    dynamic id;
    String name;
    String address;
    String reviews;
    String photo;
    String rating;
    String avgCost;
    dynamic country;
    dynamic city;
    double latitude;
    double longitude;

    factory PlacesForRoute.fromJson(Map<String, dynamic> json) => PlacesForRoute(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        reviews: json["reviews"],
        photo: json["photo"],
        rating: json["rating"],
        avgCost: json["avgCost"],
        country: json["country"],
        city: json["city"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "reviews": reviews,
        "photo": photo,
        "rating": rating,
        "avgCost": avgCost,
        "country": country,
        "city": city,
        "latitude": latitude,
        "longitude": longitude,
    };
}
