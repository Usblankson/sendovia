// To parse this JSON data, do
//
//     final authPayload = authPayloadFromJson(jsonString);

import 'dart:convert';

AuthPayload authPayloadFromJson(String str) => AuthPayload.fromJson(json.decode(str));

String authPayloadToJson(AuthPayload data) => json.encode(data.toJson());

class AuthPayload {
  AuthPayload({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  Data data;

  factory AuthPayload.fromJson(Map<String, dynamic> json) => AuthPayload(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.user,
    this.token,
  });

  User user;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user == null ? null : user.toJson(),
    "token": token == null ? null : token,
  };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profilePhoto,
    this.email,
    this.password,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  dynamic profilePhoto;
  String email;
  String password;
  bool isActive;
  bool isVerified;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"] == null ? null : json["_id"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    profilePhoto: json["profilePhoto"],
    email: json["email"] == null ? null : json["email"],
    // password: json["password"] == null ? null : json["password"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    isVerified: json["isVerified"] == null ? null : json["isVerified"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "profilePhoto": profilePhoto,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "isActive": isActive == null ? null : isActive,
    "isVerified": isVerified == null ? null : isVerified,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "__v": v == null ? null : v,
  };
}
