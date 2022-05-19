// To parse this JSON data, do
//
//     final cartPayload = cartPayloadFromJson(jsonString);

import 'dart:convert';

CartPayload cartPayloadFromJson(String str) =>
    CartPayload.fromJson(json.decode(str));

String cartPayloadToJson(CartPayload data) => json.encode(data.toJson());

class CartPayload {
  CartPayload({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  dynamic message;
  List<PayloadFromCart>? data;

  factory CartPayload.fromJson(Map<String, dynamic> json) => CartPayload(
        success: json["success"] == null ? null : json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<PayloadFromCart>.from(
                json["data"].map((x) => PayloadFromCart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PayloadFromCart {
  PayloadFromCart({
    this.id,
    this.product,
    this.user,
    this.quantity,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  Product? product;
  User? user;
  int? quantity;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory PayloadFromCart.fromJson(Map<String, dynamic> json) =>
      PayloadFromCart(
        id: json["_id"] == null ? null : json["_id"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        quantity: json["quantity"] == null ? null : json["quantity"],
        price: json["price"] == null ? null : json["price"],
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
        "product": product == null ? null : product!.toJson(),
        "user": user == null ? null : user!.toJson(),
        "quantity": quantity == null ? null : quantity,
        "price": price == null ? null : price,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Product {
  Product({
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

  String? id;
  String? category;
  String? vendor;
  String? name;
  int? price;
  String? description;
  String? image;
  int? stock;
  List<dynamic>? spec;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"] == null ? null : json["_id"],
        category: json["category"] == null ? null : json["category"],
        vendor: json["vendor"] == null ? null : json["vendor"],
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
        "category": category == null ? null : category,
        "vendor": vendor == null ? null : vendor,
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "stock": stock == null ? null : stock,
        "spec": spec == null ? null : List<dynamic>.from(spec!.map((x) => x)),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePhoto,
    this.email,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? firstName;
  String? lastName;
  dynamic? profilePhoto;
  String? email;
  bool? isActive;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        profilePhoto: json["profilePhoto"],
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
        "email": email == null ? null : email,
        "isActive": isActive == null ? null : isActive,
        "isVerified": isVerified == null ? null : isVerified,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
