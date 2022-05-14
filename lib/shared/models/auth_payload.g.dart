// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthPayload _$$_AuthPayloadFromJson(Map<String, dynamic> json) =>
    _$_AuthPayload(
      success: json['success'] as bool,
      message: json['message'],
      data: json['data'] as String,
    );

Map<String, dynamic> _$$_AuthPayloadToJson(_$_AuthPayload instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
