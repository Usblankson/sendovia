// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordModel changePasswordModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

class ChangePasswordModel {
  ChangePasswordModel({
    this.oldPassword,
    this.newPassword,
  });

  String oldPassword;
  String newPassword;

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
    oldPassword: json["oldPassword"] == null ? null : json["oldPassword"],
    newPassword: json["newPassword"] == null ? null : json["newPassword"],
  );

  Map<String, dynamic> toJson() => {
    "oldPassword": oldPassword == null ? null : oldPassword,
    "newPassword": newPassword == null ? null : newPassword,
  };
}
