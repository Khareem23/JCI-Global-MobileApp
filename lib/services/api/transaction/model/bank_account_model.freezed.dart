// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bank_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankAccountModel _$BankAccountModelFromJson(Map<String, dynamic> json) {
  return _BankAccountModel.fromJson(json);
}

/// @nodoc
class _$BankAccountModelTearOff {
  const _$BankAccountModelTearOff();

  _BankAccountModel call(
      {String? status, String? message, List<BankAccountData>? data}) {
    return _BankAccountModel(
      status: status,
      message: message,
      data: data,
    );
  }

  BankAccountModel fromJson(Map<String, Object> json) {
    return BankAccountModel.fromJson(json);
  }
}

/// @nodoc
const $BankAccountModel = _$BankAccountModelTearOff();

/// @nodoc
mixin _$BankAccountModel {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<BankAccountData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountModelCopyWith<BankAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountModelCopyWith<$Res> {
  factory $BankAccountModelCopyWith(
          BankAccountModel value, $Res Function(BankAccountModel) then) =
      _$BankAccountModelCopyWithImpl<$Res>;
  $Res call({String? status, String? message, List<BankAccountData>? data});
}

/// @nodoc
class _$BankAccountModelCopyWithImpl<$Res>
    implements $BankAccountModelCopyWith<$Res> {
  _$BankAccountModelCopyWithImpl(this._value, this._then);

  final BankAccountModel _value;
  // ignore: unused_field
  final $Res Function(BankAccountModel) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BankAccountData>?,
    ));
  }
}

/// @nodoc
abstract class _$BankAccountModelCopyWith<$Res>
    implements $BankAccountModelCopyWith<$Res> {
  factory _$BankAccountModelCopyWith(
          _BankAccountModel value, $Res Function(_BankAccountModel) then) =
      __$BankAccountModelCopyWithImpl<$Res>;
  @override
  $Res call({String? status, String? message, List<BankAccountData>? data});
}

/// @nodoc
class __$BankAccountModelCopyWithImpl<$Res>
    extends _$BankAccountModelCopyWithImpl<$Res>
    implements _$BankAccountModelCopyWith<$Res> {
  __$BankAccountModelCopyWithImpl(
      _BankAccountModel _value, $Res Function(_BankAccountModel) _then)
      : super(_value, (v) => _then(v as _BankAccountModel));

  @override
  _BankAccountModel get _value => super._value as _BankAccountModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_BankAccountModel(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BankAccountData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankAccountModel implements _BankAccountModel {
  const _$_BankAccountModel({this.status, this.message, this.data});

  factory _$_BankAccountModel.fromJson(Map<String, dynamic> json) =>
      _$_$_BankAccountModelFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final List<BankAccountData>? data;

  @override
  String toString() {
    return 'BankAccountModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BankAccountModel &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$BankAccountModelCopyWith<_BankAccountModel> get copyWith =>
      __$BankAccountModelCopyWithImpl<_BankAccountModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BankAccountModelToJson(this);
  }
}

abstract class _BankAccountModel implements BankAccountModel {
  const factory _BankAccountModel(
      {String? status,
      String? message,
      List<BankAccountData>? data}) = _$_BankAccountModel;

  factory _BankAccountModel.fromJson(Map<String, dynamic> json) =
      _$_BankAccountModel.fromJson;

  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  List<BankAccountData>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BankAccountModelCopyWith<_BankAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

BankAccountData _$BankAccountDataFromJson(Map<String, dynamic> json) {
  return _BankAccountData.fromJson(json);
}

/// @nodoc
class _$BankAccountDataTearOff {
  const _$BankAccountDataTearOff();

  _BankAccountData call(
      {required int id,
      String? countryCode,
      String? country,
      String? bankName,
      String? bankSwiftCode,
      String? bankAccountNumber,
      String? accountName}) {
    return _BankAccountData(
      id: id,
      countryCode: countryCode,
      country: country,
      bankName: bankName,
      bankSwiftCode: bankSwiftCode,
      bankAccountNumber: bankAccountNumber,
      accountName: accountName,
    );
  }

  BankAccountData fromJson(Map<String, Object> json) {
    return BankAccountData.fromJson(json);
  }
}

/// @nodoc
const $BankAccountData = _$BankAccountDataTearOff();

/// @nodoc
mixin _$BankAccountData {
  int get id => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get bankName => throw _privateConstructorUsedError;
  String? get bankSwiftCode => throw _privateConstructorUsedError;
  String? get bankAccountNumber => throw _privateConstructorUsedError;
  String? get accountName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountDataCopyWith<BankAccountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountDataCopyWith<$Res> {
  factory $BankAccountDataCopyWith(
          BankAccountData value, $Res Function(BankAccountData) then) =
      _$BankAccountDataCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? countryCode,
      String? country,
      String? bankName,
      String? bankSwiftCode,
      String? bankAccountNumber,
      String? accountName});
}

/// @nodoc
class _$BankAccountDataCopyWithImpl<$Res>
    implements $BankAccountDataCopyWith<$Res> {
  _$BankAccountDataCopyWithImpl(this._value, this._then);

  final BankAccountData _value;
  // ignore: unused_field
  final $Res Function(BankAccountData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? countryCode = freezed,
    Object? country = freezed,
    Object? bankName = freezed,
    Object? bankSwiftCode = freezed,
    Object? bankAccountNumber = freezed,
    Object? accountName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankSwiftCode: bankSwiftCode == freezed
          ? _value.bankSwiftCode
          : bankSwiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: bankAccountNumber == freezed
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BankAccountDataCopyWith<$Res>
    implements $BankAccountDataCopyWith<$Res> {
  factory _$BankAccountDataCopyWith(
          _BankAccountData value, $Res Function(_BankAccountData) then) =
      __$BankAccountDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? countryCode,
      String? country,
      String? bankName,
      String? bankSwiftCode,
      String? bankAccountNumber,
      String? accountName});
}

/// @nodoc
class __$BankAccountDataCopyWithImpl<$Res>
    extends _$BankAccountDataCopyWithImpl<$Res>
    implements _$BankAccountDataCopyWith<$Res> {
  __$BankAccountDataCopyWithImpl(
      _BankAccountData _value, $Res Function(_BankAccountData) _then)
      : super(_value, (v) => _then(v as _BankAccountData));

  @override
  _BankAccountData get _value => super._value as _BankAccountData;

  @override
  $Res call({
    Object? id = freezed,
    Object? countryCode = freezed,
    Object? country = freezed,
    Object? bankName = freezed,
    Object? bankSwiftCode = freezed,
    Object? bankAccountNumber = freezed,
    Object? accountName = freezed,
  }) {
    return _then(_BankAccountData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankSwiftCode: bankSwiftCode == freezed
          ? _value.bankSwiftCode
          : bankSwiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: bankAccountNumber == freezed
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankAccountData implements _BankAccountData {
  const _$_BankAccountData(
      {required this.id,
      this.countryCode,
      this.country,
      this.bankName,
      this.bankSwiftCode,
      this.bankAccountNumber,
      this.accountName});

  factory _$_BankAccountData.fromJson(Map<String, dynamic> json) =>
      _$_$_BankAccountDataFromJson(json);

  @override
  final int id;
  @override
  final String? countryCode;
  @override
  final String? country;
  @override
  final String? bankName;
  @override
  final String? bankSwiftCode;
  @override
  final String? bankAccountNumber;
  @override
  final String? accountName;

  @override
  String toString() {
    return 'BankAccountData(id: $id, countryCode: $countryCode, country: $country, bankName: $bankName, bankSwiftCode: $bankSwiftCode, bankAccountNumber: $bankAccountNumber, accountName: $accountName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BankAccountData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.bankName, bankName) ||
                const DeepCollectionEquality()
                    .equals(other.bankName, bankName)) &&
            (identical(other.bankSwiftCode, bankSwiftCode) ||
                const DeepCollectionEquality()
                    .equals(other.bankSwiftCode, bankSwiftCode)) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountNumber, bankAccountNumber)) &&
            (identical(other.accountName, accountName) ||
                const DeepCollectionEquality()
                    .equals(other.accountName, accountName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(bankName) ^
      const DeepCollectionEquality().hash(bankSwiftCode) ^
      const DeepCollectionEquality().hash(bankAccountNumber) ^
      const DeepCollectionEquality().hash(accountName);

  @JsonKey(ignore: true)
  @override
  _$BankAccountDataCopyWith<_BankAccountData> get copyWith =>
      __$BankAccountDataCopyWithImpl<_BankAccountData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BankAccountDataToJson(this);
  }
}

abstract class _BankAccountData implements BankAccountData {
  const factory _BankAccountData(
      {required int id,
      String? countryCode,
      String? country,
      String? bankName,
      String? bankSwiftCode,
      String? bankAccountNumber,
      String? accountName}) = _$_BankAccountData;

  factory _BankAccountData.fromJson(Map<String, dynamic> json) =
      _$_BankAccountData.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get countryCode => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  String? get bankName => throw _privateConstructorUsedError;
  @override
  String? get bankSwiftCode => throw _privateConstructorUsedError;
  @override
  String? get bankAccountNumber => throw _privateConstructorUsedError;
  @override
  String? get accountName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BankAccountDataCopyWith<_BankAccountData> get copyWith =>
      throw _privateConstructorUsedError;
}
