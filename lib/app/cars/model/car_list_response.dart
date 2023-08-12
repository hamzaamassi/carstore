import 'dart:convert';

import 'package:e_commerce_car/app/cars/model/car.dart';


CarsResponse carsResponseFromJson(String str) => CarsResponse.fromJson(json.decode(str));

String carsResponseToJson(CarsResponse data) => json.encode(data.toJson());

class CarsResponse {
  final bool status;
  final String message;
  final List<Car> cars;

  CarsResponse({
    required this.status,
    required this.message,
    required this.cars,
  });

  CarsResponse copyWith({
    bool? status,
    String? message,
    List<Car>? cars,
  }) =>
      CarsResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        cars: cars ?? this.cars,
      );

  factory CarsResponse.fromJson(Map<String, dynamic> json) => CarsResponse(
    status: json["status"],
    message: json["message"],
    cars: List<Car>.from(json["data"].map((x) => Car.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
  };
}
