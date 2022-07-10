// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthPayload _$AuthPayloadFromJson(Map<String, dynamic> json) {
  return _AuthPayload.fromJson(json);
}

/// @nodoc
mixin _$AuthPayload {
  bool get success => throw _privateConstructorUsedError;
  dynamic get message => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthPayloadCopyWith<AuthPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthPayloadCopyWith<$Res> {
  factory $AuthPayloadCopyWith(
          AuthPayload value, $Res Function(AuthPayload) then) =
      _$AuthPayloadCopyWithImpl<$Res>;
  $Res call({bool success, dynamic message, String data});
}

/// @nodoc
class _$AuthPayloadCopyWithImpl<$Res> implements $AuthPayloadCopyWith<$Res> {
  _$AuthPayloadCopyWithImpl(this._value, this._then);

  final AuthPayload _value;
  // ignore: unused_field
  final $Res Function(AuthPayload) _then;

  @override
  $Res call({
    Object success = freezed,
    Object message = freezed,
    Object data = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthPayloadCopyWith<$Res>
    implements $AuthPayloadCopyWith<$Res> {
  factory _$$_AuthPayloadCopyWith(
          _$_AuthPayload value, $Res Function(_$_AuthPayload) then) =
      __$$_AuthPayloadCopyWithImpl<$Res>;
  @override
  $Res call({bool success, dynamic message, String data});
}

/// @nodoc
class __$$_AuthPayloadCopyWithImpl<$Res> extends _$AuthPayloadCopyWithImpl<$Res>
    implements _$$_AuthPayloadCopyWith<$Res> {
  __$$_AuthPayloadCopyWithImpl(
      _$_AuthPayload _value, $Res Function(_$_AuthPayload) _then)
      : super(_value, (v) => _then(v as _$_AuthPayload));

  @override
  _$_AuthPayload get _value => super._value as _$_AuthPayload;

  @override
  $Res call({
    Object success = freezed,
    Object message = freezed,
    Object data = freezed,
  }) {
    return _then(_$_AuthPayload(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthPayload implements _AuthPayload {
  const _$_AuthPayload(
      {@required this.success, @required this.message, @required this.data});

  factory _$_AuthPayload.fromJson(Map<String, dynamic> json) =>
      _$$_AuthPayloadFromJson(json);

  @override
  final bool success;
  @override
  final dynamic message;
  @override
  final String data;

  @override
  String toString() {
    return 'AuthPayload(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthPayload &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_AuthPayloadCopyWith<_$_AuthPayload> get copyWith =>
      __$$_AuthPayloadCopyWithImpl<_$_AuthPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthPayloadToJson(this);
  }
}

abstract class _AuthPayload implements AuthPayload {
  const factory _AuthPayload(
      {@required final bool success,
      @required final dynamic message,
      @required final String data}) = _$_AuthPayload;

  factory _AuthPayload.fromJson(Map<String, dynamic> json) =
      _$_AuthPayload.fromJson;

  @override
  bool get success => throw _privateConstructorUsedError;
  @override
  dynamic get message => throw _privateConstructorUsedError;
  @override
  String get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthPayloadCopyWith<_$_AuthPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
