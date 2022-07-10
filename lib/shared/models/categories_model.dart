// To parse this JSON data, do
//
//     final categoriesPayload = categoriesPayloadFromJson(jsonString);

import 'dart:convert';

CategoriesPayload categoriesPayloadFromJson(String str) =>
    CategoriesPayload.fromJson(json.decode(str));

String categoriesPayloadToJson(CategoriesPayload data) =>
    json.encode(data.toJson());

class CategoriesPayload {
  CategoriesPayload({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  dynamic message;
  List<PayloadFromCategories> data;

  factory CategoriesPayload.fromJson(Map<String, dynamic> json) =>
      CategoriesPayload(
        success: json["success"] == null ? null : json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<PayloadFromCategories>.from(
                json["data"].map((x) => PayloadFromCategories.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PayloadFromCategories {
  PayloadFromCategories({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String name;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory PayloadFromCategories.fromJson(Map<String, dynamic> json) =>
      PayloadFromCategories(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
