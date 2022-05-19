// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'register_payload.freezed.dart';
part 'register_payload.g.dart';

RegisterPayload registerPayloadFromJson(String str) =>
    RegisterPayload.fromJson(json.decode(str));

String registerPayloadToJson(RegisterPayload data) =>
    json.encode(data.toJson());

@freezed
class RegisterPayload with _$RegisterPayload {
  const factory RegisterPayload({
    required bool success,
    required String message,
    required Data data,
  }) = _RegisterPayload;

  factory RegisterPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterPayloadFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required String firstName,
    required String lastName,
    required dynamic profilePhoto,
    required String email,
    required String password,
    required bool isActive,
    required bool isVerified,
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int v,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
