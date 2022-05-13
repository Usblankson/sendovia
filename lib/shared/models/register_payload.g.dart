// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterPayload _$$_RegisterPayloadFromJson(Map<String, dynamic> json) =>
    _$_RegisterPayload(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RegisterPayloadToJson(_$_RegisterPayload instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profilePhoto: json['profilePhoto'],
      email: json['email'] as String,
      password: json['password'] as String,
      isActive: json['isActive'] as bool,
      isVerified: json['isVerified'] as bool,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['v'] as int,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePhoto': instance.profilePhoto,
      'email': instance.email,
      'password': instance.password,
      'isActive': instance.isActive,
      'isVerified': instance.isVerified,
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'v': instance.v,
    };
