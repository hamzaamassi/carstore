import 'package:e_commerce_car/app/cars/model/car.dart';

import 'dart:convert';

CarResponse carResponseFromJson(String str) => CarResponse.fromJson(json.decode(str));

String carResponseToJson(CarResponse data) => json.encode(data.toJson());

class CarResponse {
  final bool status;
  final String message;
  final Car car;

  CarResponse({
    required this.status,
    required this.message,
    required this.car,
  });

  CarResponse copyWith({
    bool? status,
    String? message,
    Car? car,
  }) =>
      CarResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        car: car ?? this.car,
      );

  factory CarResponse.fromJson(Map<String, dynamic> json) => CarResponse(
    status: json["status"],
    message: json["message"],
    car: Car.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": car.toJson(),
  };
}