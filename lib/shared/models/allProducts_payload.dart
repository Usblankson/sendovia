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
    this.success,
    this.message,
    this.data,
  });

  bool success;
  dynamic message;
  List<PayloadFromProducts> data;

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
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PayloadFromProducts {
  PayloadFromProducts({
    this.id,
    this.category,
    this.vendor,
    this.name,
    this.price,
    this.description,
    this.image,
    this.stock,
    this.spec,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  Category category;
  Vendor vendor;
  String name;
  int price;
  String description;
  String image;
  int stock;
  List<dynamic> spec;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory PayloadFromProducts.fromJson(Map<String, dynamic> json) =>
      PayloadFromProducts(
        id: json["_id"] == null ? null : json["_id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        stock: json["stock"] == null ? null : json["stock"],
        spec: json["spec"] == null
            ? null
            : List<dynamic>.from(json["spec"].map((x) => x)),
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
        "category": category == null ? null : category.toJson(),
        "vendor": vendor == null ? null : vendor.toJson(),
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "stock": stock == null ? null : stock,
        "spec": spec == null ? null : List<dynamic>.from(spec.map((x) => x)),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Category {
  Category({
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

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class Vendor {
  Vendor({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePhoto,
    this.address,
    this.city,
    this.state,
    this.email,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String firstName;
  String lastName;
  dynamic profilePhoto;
  dynamic address;
  dynamic city;
  dynamic state;
  String email;
  bool isActive;
  bool isVerified;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["_id"] == null ? null : json["_id"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        profilePhoto: json["profilePhoto"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        email: json["email"] == null ? null : json["email"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        isVerified: json["isVerified"] == null ? null : json["isVerified"],
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
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "profilePhoto": profilePhoto,
        "address": address,
        "city": city,
        "state": state,
        "email": email == null ? null : email,
        "isActive": isActive == null ? null : isActive,
        "isVerified": isVerified == null ? null : isVerified,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
