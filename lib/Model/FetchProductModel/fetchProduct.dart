
// To parse this JSON data, do
//
//     final fetchProductModel = fetchProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FetchProductModel> fetchProductModelFromJson(String str) => List<FetchProductModel>.from(json.decode(str).map((x) => FetchProductModel.fromJson(x)));

String fetchProductModelToJson(List<FetchProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchProductModel {
  int id;
  String title;
  int price;
  String description;
  List<String> images;
  String creationAt;
  String updatedAt;
  Category category;

  FetchProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  factory FetchProductModel.fromJson(Map<String, dynamic> json) => FetchProductModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    creationAt: json["creationAt"],
    updatedAt: json["updatedAt"],
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "creationAt": creationAt,
    "updatedAt": updatedAt,
    "category": category.toJson(),
  };
}

class Category {
  int id;
  String name;
  String image;
  String creationAt;
  String updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    creationAt: json["creationAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "creationAt": creationAt,
    "updatedAt": updatedAt,
  };
}
