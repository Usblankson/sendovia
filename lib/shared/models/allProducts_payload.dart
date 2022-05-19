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

  bool? success;
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
  Category? category;
  Vendor? vendor;
  String? name;
  int? price;
  Description? description;
  String? image;
  int? stock;
  List<dynamic>? spec;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory PayloadFromProducts.fromJson(Map<String, dynamic> json) =>
      PayloadFromProducts(
        id: json["_id"] == null ? null : json["_id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        description: json["description"] == null
            ? null
            : descriptionValues.map[json["description"]],
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
        "category": category == null ? null : category!.toJson(),
        "vendor": vendor == null ? null : vendor!.toJson(),
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "description":
            description == null ? null : descriptionValues.reverse[description],
        "image": image == null ? null : image,
        "stock": stock == null ? null : stock,
        "spec": spec == null ? null : List<dynamic>.from(spec!.map((x) => x)),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
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

  CategoryId? id;
  Name? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"] == null ? null : categoryIdValues.map[json["_id"]],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
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
        "_id": id == null ? null : categoryIdValues.reverse[id],
        "name": name == null ? null : nameValues.reverse[name],
        "image": image == null ? null : image,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

enum CategoryId {
  THE_6283_C5_FF8_CFA7_FBF148_C275_D,
  THE_6283_C6438_CFA7_FBF148_C275_F,
  THE_6283_C86495_E4849_DC72_FC81_D,
  THE_6283_C99_E95_E4849_DC72_FC831
}

final categoryIdValues = EnumValues({
  "6283c5ff8cfa7fbf148c275d": CategoryId.THE_6283_C5_FF8_CFA7_FBF148_C275_D,
  "6283c6438cfa7fbf148c275f": CategoryId.THE_6283_C6438_CFA7_FBF148_C275_F,
  "6283c86495e4849dc72fc81d": CategoryId.THE_6283_C86495_E4849_DC72_FC81_D,
  "6283c99e95e4849dc72fc831": CategoryId.THE_6283_C99_E95_E4849_DC72_FC831
});

enum Name { ELECTRONICS, DRINKS, WATCHES, GROCERIES }

final nameValues = EnumValues({
  "Drinks": Name.DRINKS,
  "Electronics": Name.ELECTRONICS,
  "Groceries": Name.GROCERIES,
  "Watches": Name.WATCHES
});

enum Description { LOREM_IPSUM_GRACIAS_DOMINO_CHRISTO }

final descriptionValues = EnumValues({
  "Lorem ipsum gracias domino christo":
      Description.LOREM_IPSUM_GRACIAS_DOMINO_CHRISTO
});

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

  VendorId? id;
  FirstName? firstName;
  LastName? lastName;
  dynamic profilePhoto;
  dynamic address;
  dynamic city;
  dynamic state;
  Email? email;
  bool? isActive;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["_id"] == null ? null : vendorIdValues.map[json["_id"]],
        firstName: json["firstName"] == null
            ? null
            : firstNameValues.map[json["firstName"]],
        lastName: json["lastName"] == null
            ? null
            : lastNameValues.map[json["lastName"]],
        profilePhoto: json["profilePhoto"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        email: json["email"] == null ? null : emailValues.map[json["email"]],
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
        "_id": id == null ? null : vendorIdValues.reverse[id],
        "firstName":
            firstName == null ? null : firstNameValues.reverse[firstName],
        "lastName": lastName == null ? null : lastNameValues.reverse[lastName],
        "profilePhoto": profilePhoto,
        "address": address,
        "city": city,
        "state": state,
        "email": email == null ? null : emailValues.reverse[email],
        "isActive": isActive == null ? null : isActive,
        "isVerified": isVerified == null ? null : isVerified,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

enum Email { VENDORTWO_YOPMAIL_COM, VENDORONE_YOPMAIL_COM }

final emailValues = EnumValues({
  "vendorone@yopmail.com": Email.VENDORONE_YOPMAIL_COM,
  "vendortwo@yopmail.com": Email.VENDORTWO_YOPMAIL_COM
});

enum FirstName { KENDRICK, PAPA }

final firstNameValues =
    EnumValues({"kendrick": FirstName.KENDRICK, "Papa": FirstName.PAPA});

enum VendorId {
  THE_6283_C2228_CFA7_FBF148_C2745,
  THE_6283_CB6_C95_E4849_DC72_FC842
}

final vendorIdValues = EnumValues({
  "6283c2228cfa7fbf148c2745": VendorId.THE_6283_C2228_CFA7_FBF148_C2745,
  "6283cb6c95e4849dc72fc842": VendorId.THE_6283_CB6_C95_E4849_DC72_FC842
});

enum LastName { OLAMIDE, BENJI }

final lastNameValues =
    EnumValues({"Benji": LastName.BENJI, "olamide": LastName.OLAMIDE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
