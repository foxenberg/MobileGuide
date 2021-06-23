import 'dart:convert';

class Place {
  final String id;
  final String name;
  final String address;
  final String reviews;
  final String photo;
  final double rating;
  final String avgCost;
  final String country;
  final String city;
  double latitude;
  double longitude;
  Place(
      {required this.id,
      required this.name,
      required this.address,
      required this.reviews,
      required this.photo,
      required this.rating,
      required this.avgCost,
      required this.country,
      required this.city,
      required this.latitude,
      required this.longitude});

  Place copyWith({
    String? id,
    String? name,
    String? address,
    String? reviews,
    String? photo,
    double? rating,
    String? avgCost,
    String? country,
    String? city,
    double? latitude,
    double? longitude,
  }) {
    return Place(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      reviews: reviews ?? this.reviews,
      photo: photo ?? this.photo,
      rating: rating ?? this.rating,
      avgCost: avgCost ?? this.avgCost,
      country: country ?? this.country,
      city: city ?? this.city,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'reviews': reviews,
      'photo': photo,
      'rating': rating,
      'avgCost': avgCost,
      'country': country,
      'city': city,
      'latitude' : latitude,
      'longitude': longitude
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      reviews: map['reviews'],
      photo: map['photo'],
      rating: map['rating'].toDouble(),
      avgCost: map['avgCost'],
      country: map['country'],
      city: map['city'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) => Place.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Place(id: $id, name: $name, address: $address, reviews: $reviews, photo: $photo, rating: $rating, avgCost: $avgCost, country: $country, city: $city, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Place &&
        other.id == id &&
        other.name == name &&
        other.address == address &&
        other.reviews == reviews &&
        other.photo == photo &&
        other.rating == rating &&
        other.avgCost == avgCost &&
        other.country == country &&
        other.city == city &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        reviews.hashCode ^
        photo.hashCode ^
        rating.hashCode ^
        avgCost.hashCode ^
        country.hashCode ^
        city.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
