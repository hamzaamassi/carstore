// To parse this JSON data, do
//
//     final brandsResponse = brandsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:carstore_car/app/brand/model/brand.dart';

BrandsResponse brandsResponseFromJson(String str) => BrandsResponse.fromJson(json.decode(str));

String brandsResponseToJson(BrandsResponse data) => json.encode(data.toJson());

class BrandsResponse {
  final bool status;
  final String message;
  final List<Brand> brands;

  BrandsResponse({
    required this.status,
    required this.message,
    required this.brands,
  });

  BrandsResponse copyWith({
    bool? status,
    String? message,
    List<Brand>? brands,
  }) =>
      BrandsResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        brands: brands ?? this.brands,
      );

  factory BrandsResponse.fromJson(Map<String, dynamic> json) => BrandsResponse(
    status: json["status"],
    message: json["message"],
    brands: List<Brand>.from(json["data"].map((x) => Brand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(brands.map((x) => x.toJson())),
  };
}

