// To parse this JSON data, do
//
//     final fetchCategoryModel = fetchCategoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FetchCategoryModel> fetchCategoryModelFromJson(String str) => List<FetchCategoryModel>.from(json.decode(str).map((x) => FetchCategoryModel.fromJson(x)));

String fetchCategoryModelToJson(List<FetchCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchCategoryModel {
  int id;
  String name;
  String image;
  String creationAt;
  String updatedAt;

  FetchCategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory FetchCategoryModel.fromJson(Map<String, dynamic> json) => FetchCategoryModel(
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
