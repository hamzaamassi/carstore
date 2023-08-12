// To parse this JSON data, do
//
//     final brandResponse = brandResponseFromJson(jsonString);

import 'dart:convert';

import 'package:e_commerce_car/app/brand/model/brand.dart';

BrandResponse brandResponseFromJson(String str) => BrandResponse.fromJson(json.decode(str));

String brandResponseToJson(BrandResponse data) => json.encode(data.toJson());

class BrandResponse {
  final bool status;
  final String message;
  final List<BrandCar> brandCar;

  BrandResponse({
    required this.status,
    required this.message,
    required this.brandCar,
  });

  BrandResponse copyWith({
    bool? status,
    String? message,
    List<BrandCar>? brandCar,
  }) =>
      BrandResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        brandCar: brandCar ?? this.brandCar,
      );

  factory BrandResponse.fromJson(Map<String, dynamic> json) => BrandResponse(
    status: json["status"],
    message: json["message"],
    brandCar: List<BrandCar>.from(json["brandCar"].map((x) => BrandCar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(brandCar.map((x) => x.toJson())),
  };
}

class BrandCar {
  final int id;
  final String name;
  final String image;
  final int price;
  final int stars;
  final int ratingsCount;
  final String enginePower;
  final String maxTorque;
  final String acceleration;
  final Brand brand;

  BrandCar({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.stars,
    required this.ratingsCount,
    required this.enginePower,
    required this.maxTorque,
    required this.acceleration,
    required this.brand,
  });

  BrandCar copyWith({
    int? id,
    String? name,
    String? image,
    int? price,
    int? stars,
    int? ratingsCount,
    String? enginePower,
    String? maxTorque,
    String? acceleration,
    Brand? brand,
  }) =>
      BrandCar(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
        stars: stars ?? this.stars,
        ratingsCount: ratingsCount ?? this.ratingsCount,
        enginePower: enginePower ?? this.enginePower,
        maxTorque: maxTorque ?? this.maxTorque,
        acceleration: acceleration ?? this.acceleration,
        brand: brand ?? this.brand,
      );

  factory BrandCar.fromJson(Map<String, dynamic> json) => BrandCar(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    stars: json["stars"],
    ratingsCount: json["ratings_count"],
    enginePower: json["engine_power"],
    maxTorque: json["max_torque"],
    acceleration: json["acceleration"],
    brand: Brand.fromJson(json["brand"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "stars": stars,
    "ratings_count": ratingsCount,
    "engine_power": enginePower,
    "max_torque": maxTorque,
    "acceleration": acceleration,
    "brand": brand.toJson(),
  };
}

