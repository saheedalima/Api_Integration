// To parse this JSON data, do
//
//     final techwareapi = techwareapiFromJson(jsonString);

import 'dart:convert';

List<Techwareapi> techwareapiFromJson(String str) => List<Techwareapi>.from(json.decode(str).map((x) => Techwareapi.fromJson(x)));

String techwareapiToJson(List<Techwareapi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Techwareapi {
  int? id;
  String? name;
  String? username;
  String? email;
  String? profileImage;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  Techwareapi({
     this.id,
     this.name,
     this.username,
     this.email,
    this.profileImage,
     this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory Techwareapi.fromJson(Map<String, dynamic> json) => Techwareapi(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    profileImage: json["profile_image"],
    address: Address.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "profile_image": profileImage,
    "address": address?.toJson(),
    "phone": phone,
    "website": website,
    "company": company?.toJson(),
  };
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: Geo.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo.toJson(),
  };
}

class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}
