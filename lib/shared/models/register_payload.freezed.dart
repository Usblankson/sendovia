// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterPayload _$RegisterPayloadFromJson(Map<String, dynamic> json) {
  return _RegisterPayload.fromJson(json);
}

/// @nodoc
mixin _$RegisterPayload {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterPayloadCopyWith<RegisterPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPayloadCopyWith<$Res> {
  factory $RegisterPayloadCopyWith(
          RegisterPayload value, $Res Function(RegisterPayload) then) =
      _$RegisterPayloadCopyWithImpl<$Res>;
  $Res call({bool success, String message, Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$RegisterPayloadCopyWithImpl<$Res>
    implements $RegisterPayloadCopyWith<$Res> {
  _$RegisterPayloadCopyWithImpl(this._value, this._then);

  final RegisterPayload _value;
  // ignore: unused_field
  final $Res Function(RegisterPayload) _then;

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
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }

  @override
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$RegisterPayloadCopyWith<$Res>
    implements $RegisterPayloadCopyWith<$Res> {
  factory _$RegisterPayloadCopyWith(
          _RegisterPayload value, $Res Function(_RegisterPayload) then) =
      __$RegisterPayloadCopyWithImpl<$Res>;
  @override
  $Res call({bool success, String message, Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$RegisterPayloadCopyWithImpl<$Res>
    extends _$RegisterPayloadCopyWithImpl<$Res>
    implements _$RegisterPayloadCopyWith<$Res> {
  __$RegisterPayloadCopyWithImpl(
      _RegisterPayload _value, $Res Function(_RegisterPayload) _then)
      : super(_value, (v) => _then(v as _RegisterPayload));

  @override
  _RegisterPayload get _value => super._value as _RegisterPayload;

  @override
  $Res call({
    Object success = freezed,
    Object message = freezed,
    Object data = freezed,
  }) {
    return _then(_RegisterPayload(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterPayload implements _RegisterPayload {
  const _$_RegisterPayload(
      {@required this.success, @required this.message, @required this.data});

  factory _$_RegisterPayload.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterPayloadFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final Data data;

  @override
  String toString() {
    return 'RegisterPayload(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterPayload &&
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
  _$RegisterPayloadCopyWith<_RegisterPayload> get copyWith =>
      __$RegisterPayloadCopyWithImpl<_RegisterPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterPayloadToJson(this);
  }
}

abstract class _RegisterPayload implements RegisterPayload {
  const factory _RegisterPayload(
      {@required final bool success,
      @required final String message,
      @required final Data data}) = _$_RegisterPayload;

  factory _RegisterPayload.fromJson(Map<String, dynamic> json) =
      _$_RegisterPayload.fromJson;

  @override
  bool get success => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  Data get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RegisterPayloadCopyWith<_RegisterPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  dynamic get profilePhoto => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call(
      {String firstName,
      String lastName,
      dynamic profilePhoto,
      String email,
      String password,
      bool isActive,
      bool isVerified,
      String id,
      DateTime createdAt,
      DateTime updatedAt,
      int v});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  final Data _value;
  // ignore: unused_field
  final $Res Function(Data) _then;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object profilePhoto = freezed,
    Object email = freezed,
    Object password = freezed,
    Object isActive = freezed,
    Object isVerified = freezed,
    Object id = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object v = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: profilePhoto == freezed
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      v: v == freezed
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstName,
      String lastName,
      dynamic profilePhoto,
      String email,
      String password,
      bool isActive,
      bool isVerified,
      String id,
      DateTime createdAt,
      DateTime updatedAt,
      int v});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object profilePhoto = freezed,
    Object email = freezed,
    Object password = freezed,
    Object isActive = freezed,
    Object isVerified = freezed,
    Object id = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object v = freezed,
  }) {
    return _then(_Data(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: profilePhoto == freezed
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      v: v == freezed
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(
      {@required this.firstName,
      @required this.lastName,
      @required this.profilePhoto,
      @required this.email,
      @required this.password,
      @required this.isActive,
      @required this.isVerified,
      @required this.id,
      @required this.createdAt,
      @required this.updatedAt,
      @required this.v});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final dynamic profilePhoto;
  @override
  final String email;
  @override
  final String password;
  @override
  final bool isActive;
  @override
  final bool isVerified;
  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int v;

  @override
  String toString() {
    return 'Data(firstName: $firstName, lastName: $lastName, profilePhoto: $profilePhoto, email: $email, password: $password, isActive: $isActive, isVerified: $isVerified, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.profilePhoto, profilePhoto) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality()
                .equals(other.isVerified, isVerified) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.v, v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(profilePhoto),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(isVerified),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(v));

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(this);
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@required final String firstName,
      @required final String lastName,
      @required final dynamic profilePhoto,
      @required final String email,
      @required final String password,
      @required final bool isActive,
      @required final bool isVerified,
      @required final String id,
      @required final DateTime createdAt,
      @required final DateTime updatedAt,
      @required final int v}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  dynamic get profilePhoto => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  bool get isActive => throw _privateConstructorUsedError;
  @override
  bool get isVerified => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  int get v => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DataCopyWith<_Data> get copyWith => throw _privateConstructorUsedError;
}
