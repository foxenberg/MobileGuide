import 'dart:convert';

class Place {
  final String id;
  final String name;
  final String address;
  final String reviews;
  final String photo;
  final String rating;
  final String avgCost;
  final String country;
  final String city;
  Place({
    required this.id,
    required this.name,
    required this.address,
    required this.reviews,
    required this.photo,
    required this.rating,
    required this.avgCost,
    required this.country,
    required this.city,
  });

  Place copyWith({
    String? id,
    String? name,
    String? address,
    String? reviews,
    String? photo,
    String? rating,
    String? avgCost,
    String? country,
    String? city,
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
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      reviews: map['reviews'],
      photo: map ['photo'],
      rating: map['rating'],
      avgCost: map['avgCost'],
      country: map['country'],
      city: map['city'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) => Place.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Place(id: $id, name: $name, address: $address, reviews: $reviews, photo: $photo, rating: $rating, avgCost: $avgCost, country: $country, city: $city)';
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
        other.city == city;
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
        city.hashCode;
  }
}
