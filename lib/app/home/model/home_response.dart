import 'dart:convert';

import 'package:carstore_car/app/brand/model/brand.dart';
import 'package:carstore_car/app/cars/model/car.dart';

HomeResponse homeResponseFromJson(String str) => HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  final bool status;
  final String message;
  final Data data;

  HomeResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  HomeResponse copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      HomeResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final List<SliderModel> sliders;
  final List<Brand> brands;
  final List<Car> cars;

  Data({
    required this.sliders,
    required this.brands,
    required this.cars,
  });

  Data copyWith({
    List<SliderModel>? sliders,
    List<Brand>? brands,
    List<Car>? cars,
  }) =>
      Data(
        sliders: sliders ?? this.sliders,
        brands: brands ?? this.brands,
        cars: cars ?? this.cars,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    sliders: List<SliderModel>.from(json["sliders"].map((x) => SliderModel.fromJson(x))),
    brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
    cars: List<Car>.from(json["cars"].map((x) => Car.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sliders": List<dynamic>.from(sliders.map((x) => x.toJson())),
    "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
    "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
  };
}
class SliderModel {
  final int id;
  final String image;
  final String title;

  SliderModel({
    required this.id,
    required this.image,
    required this.title,
  });

  SliderModel copyWith({
    int? id,
    String? image,
    String? title,
  }) =>
      SliderModel(
        id: id ?? this.id,
        image: image ?? this.image,
        title: title ?? this.title,
      );

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    id: json["id"],
    image: json["image"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
  };
}