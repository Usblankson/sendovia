// To parse this JSON data, do
//
//     final allProductsPayload = allProductsPayloadFromJson(jsonString);

import 'dart:convert';

AllProductsPayload allProductsPayloadFromJson(String str) =>
    AllProductsPayload.fromJson(json.decode(str));

String allProductsPayloadToJson(AllProductsPayload data) =>
    json.encode(data.toJson());

class AllProductsPayload {
  AllProductsPayload({
    required this.success,
    this.message,
    required this.data,
  });

  bool success;
  dynamic message;
  List<PayloadFromProducts>? data;

  factory AllProductsPayload.fromJson(Map<String, dynamic> json) =>
      AllProductsPayload(
        success: json["success"] == null ? null : json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<PayloadFromProducts>.from(
                json["data"].map((x) => PayloadFromProducts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PayloadFromProducts {
  PayloadFromProducts({
    required this.id,
    required this.category,
    required this.vendor,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String? id;
  String? category;
  String? vendor;
  String? name;
  int? price;
  String? description;
  String? image;
  int? stock;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory PayloadFromProducts.fromJson(Map<String, dynamic> json) =>
      PayloadFromProducts(
        id: json["_id"] == null ? null : json["_id"],
        category: json["category"] == null ? null : json["category"],
        vendor: json["vendor"] == null ? null : json["vendor"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        stock: json["stock"] == null ? null : json["stock"],
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
        "category": category == null ? null : category,
        "vendor": vendor == null ? null : vendor,
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "stock": stock == null ? null : stock,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
