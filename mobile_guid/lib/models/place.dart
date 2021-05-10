import 'dart:convert';

List<Places> placesFromJson(String str) => List<Places>.from(json.decode(str).map((x) => Places.fromJson(x)));

String placesToJson(List<Places> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Places {
    Places({
        this.id,
        this.name,
        this.address,
        this.reviews,
        this.photo,
        this.rating,
        this.avgCost,
        this.country,
        this.city,
    });

   

    Id id;
    String name;
    String address;
    String reviews;
    String photo;
    String rating;
    String avgCost;
    String country;
    String city;

    factory Places.fromJson(Map<String, dynamic> json) => Places(
        id: Id.fromJson(json["_id"]),
        name: json["name"],
        address: json["address"],
        reviews: json["reviews"],
        photo: json["photo"],
        rating: json["rating"],
        avgCost: json["avgCost"],
        country: json["country"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "name": name,
        "address": address,
        "reviews": reviews,
        "photo": photo,
        "rating": rating,
        "avgCost": avgCost,
        "country": country,
        "city": city,
    };
}

class Id {
    Id({
        this.oid,
    });

    String oid;

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
    };
}
