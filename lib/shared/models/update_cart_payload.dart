// To parse this JSON data, do
//
//     final updateCartPayload = updateCartPayloadFromJson(jsonString);

import 'dart:convert';

UpdateCartPayload updateCartPayloadFromJson(String str) =>
    UpdateCartPayload.fromJson(json.decode(str));

String updateCartPayloadToJson(UpdateCartPayload data) =>
    json.encode(data.toJson());

class UpdateCartPayload {
  UpdateCartPayload({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  dynamic data;

  factory UpdateCartPayload.fromJson(Map<String, dynamic> json) =>
      UpdateCartPayload(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data,
      };
}
