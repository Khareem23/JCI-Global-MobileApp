// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'beneficiary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BeneficiaryModel _$BeneficiaryModelFromJson(Map<String, dynamic> json) {
  return _BeneficiaryModel.fromJson(json);
}

/// @nodoc
class _$BeneficiaryModelTearOff {
  const _$BeneficiaryModelTearOff();

  _BeneficiaryModel call(
      {String? status, String? message, List<BeneficiaryData>? data}) {
    return _BeneficiaryModel(
      status: status,
      message: message,
      data: data,
    );
  }

  BeneficiaryModel fromJson(Map<String, Object> json) {
    return BeneficiaryModel.fromJson(json);
  }
}

/// @nodoc
const $BeneficiaryModel = _$BeneficiaryModelTearOff();

/// @nodoc
mixin _$BeneficiaryModel {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<BeneficiaryData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeneficiaryModelCopyWith<BeneficiaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeneficiaryModelCopyWith<$Res> {
  factory $BeneficiaryModelCopyWith(
          BeneficiaryModel value, $Res Function(BeneficiaryModel) then) =
      _$BeneficiaryModelCopyWithImpl<$Res>;
  $Res call({String? status, String? message, List<BeneficiaryData>? data});
}

/// @nodoc
class _$BeneficiaryModelCopyWithImpl<$Res>
    implements $BeneficiaryModelCopyWith<$Res> {
  _$BeneficiaryModelCopyWithImpl(this._value, this._then);

  final BeneficiaryModel _value;
  // ignore: unused_field
  final $Res Function(BeneficiaryModel) _then;

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
              as List<BeneficiaryData>?,
    ));
  }
}

/// @nodoc
abstract class _$BeneficiaryModelCopyWith<$Res>
    implements $BeneficiaryModelCopyWith<$Res> {
  factory _$BeneficiaryModelCopyWith(
          _BeneficiaryModel value, $Res Function(_BeneficiaryModel) then) =
      __$BeneficiaryModelCopyWithImpl<$Res>;
  @override
  $Res call({String? status, String? message, List<BeneficiaryData>? data});
}

/// @nodoc
class __$BeneficiaryModelCopyWithImpl<$Res>
    extends _$BeneficiaryModelCopyWithImpl<$Res>
    implements _$BeneficiaryModelCopyWith<$Res> {
  __$BeneficiaryModelCopyWithImpl(
      _BeneficiaryModel _value, $Res Function(_BeneficiaryModel) _then)
      : super(_value, (v) => _then(v as _BeneficiaryModel));

  @override
  _BeneficiaryModel get _value => super._value as _BeneficiaryModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_BeneficiaryModel(
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
              as List<BeneficiaryData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BeneficiaryModel implements _BeneficiaryModel {
  const _$_BeneficiaryModel({this.status, this.message, this.data});

  factory _$_BeneficiaryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_BeneficiaryModelFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final List<BeneficiaryData>? data;

  @override
  String toString() {
    return 'BeneficiaryModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BeneficiaryModel &&
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
  _$BeneficiaryModelCopyWith<_BeneficiaryModel> get copyWith =>
      __$BeneficiaryModelCopyWithImpl<_BeneficiaryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BeneficiaryModelToJson(this);
  }
}

abstract class _BeneficiaryModel implements BeneficiaryModel {
  const factory _BeneficiaryModel(
      {String? status,
      String? message,
      List<BeneficiaryData>? data}) = _$_BeneficiaryModel;

  factory _BeneficiaryModel.fromJson(Map<String, dynamic> json) =
      _$_BeneficiaryModel.fromJson;

  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  List<BeneficiaryData>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BeneficiaryModelCopyWith<_BeneficiaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

BeneficiaryData _$BeneficiaryDataFromJson(Map<String, dynamic> json) {
  return _BeneficiaryData.fromJson(json);
}

/// @nodoc
class _$BeneficiaryDataTearOff {
  const _$BeneficiaryDataTearOff();

  _BeneficiaryData call(
      {
        required int customerId,
      String? country,
      String? bankName,
      String? bankState,
      String? bankPostalCode,
      String? bankCity,
      String? bankAddress,
      String? accountCurrency,
      String? accountNumber,
      String? accountName,
      String? accountSWiftCode,
      String? accountBsbCode,
      String? corresBankCountry,
      String? corresBankName,
      String? corresBankIban}) {
    return _BeneficiaryData(
      customerId: customerId,
      country: country,
      bankName: bankName,
      bankState: bankState,
      bankPostalCode: bankPostalCode,
      bankCity: bankCity,
      bankAddress: bankAddress,
      accountCurrency: accountCurrency,
      accountNumber: accountNumber,
      accountName: accountName,
      accountSWiftCode: accountSWiftCode,
      accountBsbCode: accountBsbCode,
      corresBankCountry: corresBankCountry,
      corresBankName: corresBankName,
      corresBankIban: corresBankIban,
    );
  }

  BeneficiaryData fromJson(Map<String, Object> json) {
    return BeneficiaryData.fromJson(json);
  }
}

/// @nodoc
const $BeneficiaryData = _$BeneficiaryDataTearOff();

/// @nodoc
mixin _$BeneficiaryData {
  int get customerId => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get bankName => throw _privateConstructorUsedError;
  String? get bankState => throw _privateConstructorUsedError;
  String? get bankPostalCode => throw _privateConstructorUsedError;
  String? get bankCity => throw _privateConstructorUsedError;
  String? get bankAddress => throw _privateConstructorUsedError;
  String? get accountCurrency => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;
  String? get accountName => throw _privateConstructorUsedError;
  String? get accountSWiftCode => throw _privateConstructorUsedError;
  String? get accountBsbCode => throw _privateConstructorUsedError;
  String? get corresBankCountry => throw _privateConstructorUsedError;
  String? get corresBankName => throw _privateConstructorUsedError;
  String? get corresBankIban => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeneficiaryDataCopyWith<BeneficiaryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeneficiaryDataCopyWith<$Res> {
  factory $BeneficiaryDataCopyWith(
          BeneficiaryData value, $Res Function(BeneficiaryData) then) =
      _$BeneficiaryDataCopyWithImpl<$Res>;
  $Res call(
      {
       int customerId,
      String? country,
      String? bankName,
      String? bankState,
      String? bankPostalCode,
      String? bankCity,
      String? bankAddress,
      String? accountCurrency,
      String? accountNumber,
      String? accountName,
      String? accountSWiftCode,
      String? accountBsbCode,
      String? corresBankCountry,
      String? corresBankName,
      String? corresBankIban});
}

/// @nodoc
class _$BeneficiaryDataCopyWithImpl<$Res>
    implements $BeneficiaryDataCopyWith<$Res> {
  _$BeneficiaryDataCopyWithImpl(this._value, this._then);

  final BeneficiaryData _value;
  // ignore: unused_field
  final $Res Function(BeneficiaryData) _then;

  @override
  $Res call({
    Object? customerId = freezed,
    Object? country = freezed,
    Object? bankName = freezed,
    Object? bankState = freezed,
    Object? bankPostalCode = freezed,
    Object? bankCity = freezed,
    Object? bankAddress = freezed,
    Object? accountCurrency = freezed,
    Object? accountNumber = freezed,
    Object? accountName = freezed,
    Object? accountSWiftCode = freezed,
    Object? accountBsbCode = freezed,
    Object? corresBankCountry = freezed,
    Object? corresBankName = freezed,
    Object? corresBankIban = freezed,
  }) {
    return _then(_value.copyWith(

      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankState: bankState == freezed
          ? _value.bankState
          : bankState // ignore: cast_nullable_to_non_nullable
              as String?,
      bankPostalCode: bankPostalCode == freezed
          ? _value.bankPostalCode
          : bankPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bankCity: bankCity == freezed
          ? _value.bankCity
          : bankCity // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAddress: bankAddress == freezed
          ? _value.bankAddress
          : bankAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      accountCurrency: accountCurrency == freezed
          ? _value.accountCurrency
          : accountCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountSWiftCode: accountSWiftCode == freezed
          ? _value.accountSWiftCode
          : accountSWiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountBsbCode: accountBsbCode == freezed
          ? _value.accountBsbCode
          : accountBsbCode // ignore: cast_nullable_to_non_nullable
              as String?,
      corresBankCountry: corresBankCountry == freezed
          ? _value.corresBankCountry
          : corresBankCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      corresBankName: corresBankName == freezed
          ? _value.corresBankName
          : corresBankName // ignore: cast_nullable_to_non_nullable
              as String?,
      corresBankIban: corresBankIban == freezed
          ? _value.corresBankIban
          : corresBankIban // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BeneficiaryDataCopyWith<$Res>
    implements $BeneficiaryDataCopyWith<$Res> {
  factory _$BeneficiaryDataCopyWith(
          _BeneficiaryData value, $Res Function(_BeneficiaryData) then) =
      __$BeneficiaryDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {
        int customerId,
      String? country,
      String? bankName,
      String? bankState,
      String? bankPostalCode,
      String? bankCity,
      String? bankAddress,
      String? accountCurrency,
      String? accountNumber,
      String? accountName,
      String? accountSWiftCode,
      String? accountBsbCode,
      String? corresBankCountry,
      String? corresBankName,
      String? corresBankIban});
}

/// @nodoc
class __$BeneficiaryDataCopyWithImpl<$Res>
    extends _$BeneficiaryDataCopyWithImpl<$Res>
    implements _$BeneficiaryDataCopyWith<$Res> {
  __$BeneficiaryDataCopyWithImpl(
      _BeneficiaryData _value, $Res Function(_BeneficiaryData) _then)
      : super(_value, (v) => _then(v as _BeneficiaryData));

  @override
  _BeneficiaryData get _value => super._value as _BeneficiaryData;

  @override
  $Res call({
    Object? customerId = freezed,
    Object? country = freezed,
    Object? bankName = freezed,
    Object? bankState = freezed,
    Object? bankPostalCode = freezed,
    Object? bankCity = freezed,
    Object? bankAddress = freezed,
    Object? accountCurrency = freezed,
    Object? accountNumber = freezed,
    Object? accountName = freezed,
    Object? accountSWiftCode = freezed,
    Object? accountBsbCode = freezed,
    Object? corresBankCountry = freezed,
    Object? corresBankName = freezed,
    Object? corresBankIban = freezed,
  }) {
    return _then(_BeneficiaryData(

      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankState: bankState == freezed
          ? _value.bankState
          : bankState // ignore: cast_nullable_to_non_nullable
              as String?,
      bankPostalCode: bankPostalCode == freezed
          ? _value.bankPostalCode
          : bankPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bankCity: bankCity == freezed
          ? _value.bankCity
          : bankCity // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAddress: bankAddress == freezed
          ? _value.bankAddress
          : bankAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      accountCurrency: accountCurrency == freezed
          ? _value.accountCurrency
          : accountCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountSWiftCode: accountSWiftCode == freezed
          ? _value.accountSWiftCode
          : accountSWiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountBsbCode: accountBsbCode == freezed
          ? _value.accountBsbCode
          : accountBsbCode // ignore: cast_nullable_to_non_nullable
              as String?,
      corresBankCountry: corresBankCountry == freezed
          ? _value.corresBankCountry
          : corresBankCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      corresBankName: corresBankName == freezed
          ? _value.corresBankName
          : corresBankName // ignore: cast_nullable_to_non_nullable
              as String?,
      corresBankIban: corresBankIban == freezed
          ? _value.corresBankIban
          : corresBankIban // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BeneficiaryData implements _BeneficiaryData {
  const _$_BeneficiaryData(
      {  required this.customerId,
      this.country,
      this.bankName,
      this.bankState,
      this.bankPostalCode,
      this.bankCity,
      this.bankAddress,
      this.accountCurrency,
      this.accountNumber,
      this.accountName,
      this.accountSWiftCode,
      this.accountBsbCode,
      this.corresBankCountry,
      this.corresBankName,
      this.corresBankIban});

  factory _$_BeneficiaryData.fromJson(Map<String, dynamic> json) =>
      _$_$_BeneficiaryDataFromJson(json);

  @override
  final int customerId;
  @override
  final String? country;
  @override
  final String? bankName;
  @override
  final String? bankState;
  @override
  final String? bankPostalCode;
  @override
  final String? bankCity;
  @override
  final String? bankAddress;
  @override
  final String? accountCurrency;
  @override
  final String? accountNumber;
  @override
  final String? accountName;
  @override
  final String? accountSWiftCode;
  @override
  final String? accountBsbCode;
  @override
  final String? corresBankCountry;
  @override
  final String? corresBankName;
  @override
  final String? corresBankIban;

  @override
  String toString() {
    return 'BeneficiaryData(customerId: $customerId, country: $country, bankName: $bankName, bankState: $bankState, bankPostalCode: $bankPostalCode, bankCity: $bankCity, bankAddress: $bankAddress, accountCurrency: $accountCurrency, accountNumber: $accountNumber, accountName: $accountName, accountSWiftCode: $accountSWiftCode, accountBsbCode: $accountBsbCode, corresBankCountry: $corresBankCountry, corresBankName: $corresBankName, corresBankIban: $corresBankIban)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||

            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.bankName, bankName) ||
                const DeepCollectionEquality()
                    .equals(other.bankName, bankName)) &&
            (identical(other.bankState, bankState) ||
                const DeepCollectionEquality()
                    .equals(other.bankState, bankState)) &&
            (identical(other.bankPostalCode, bankPostalCode) ||
                const DeepCollectionEquality()
                    .equals(other.bankPostalCode, bankPostalCode)) &&
            (identical(other.bankCity, bankCity) ||
                const DeepCollectionEquality()
                    .equals(other.bankCity, bankCity)) &&
            (identical(other.bankAddress, bankAddress) ||
                const DeepCollectionEquality()
                    .equals(other.bankAddress, bankAddress)) &&
            (identical(other.accountCurrency, accountCurrency) ||
                const DeepCollectionEquality()
                    .equals(other.accountCurrency, accountCurrency)) &&
            (identical(other.accountNumber, accountNumber) ||
                const DeepCollectionEquality()
                    .equals(other.accountNumber, accountNumber)) &&
            (identical(other.accountName, accountName) ||
                const DeepCollectionEquality()
                    .equals(other.accountName, accountName)) &&
            (identical(other.accountSWiftCode, accountSWiftCode) ||
                const DeepCollectionEquality()
                    .equals(other.accountSWiftCode, accountSWiftCode)) &&
            (identical(other.accountBsbCode, accountBsbCode) ||
                const DeepCollectionEquality()
                    .equals(other.accountBsbCode, accountBsbCode)) &&
            (identical(other.corresBankCountry, corresBankCountry) ||
                const DeepCollectionEquality()
                    .equals(other.corresBankCountry, corresBankCountry)) &&
            (identical(other.corresBankName, corresBankName) ||
                const DeepCollectionEquality()
                    .equals(other.corresBankName, corresBankName)) &&
            (identical(other.corresBankIban, corresBankIban) ||
                const DeepCollectionEquality()
                    .equals(other.corresBankIban, corresBankIban));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(bankName) ^
      const DeepCollectionEquality().hash(bankState) ^
      const DeepCollectionEquality().hash(bankPostalCode) ^
      const DeepCollectionEquality().hash(bankCity) ^
      const DeepCollectionEquality().hash(bankAddress) ^
      const DeepCollectionEquality().hash(accountCurrency) ^
      const DeepCollectionEquality().hash(accountNumber) ^
      const DeepCollectionEquality().hash(accountName) ^
      const DeepCollectionEquality().hash(accountSWiftCode) ^
      const DeepCollectionEquality().hash(accountBsbCode) ^
      const DeepCollectionEquality().hash(corresBankCountry) ^
      const DeepCollectionEquality().hash(corresBankName) ^
      const DeepCollectionEquality().hash(corresBankIban);

  @JsonKey(ignore: true)
  @override
  _$BeneficiaryDataCopyWith<_BeneficiaryData> get copyWith =>
      __$BeneficiaryDataCopyWithImpl<_BeneficiaryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BeneficiaryDataToJson(this);
  }
}

abstract class _BeneficiaryData implements BeneficiaryData {
  const factory _BeneficiaryData(
      { required int customerId,
      String? country,
      String? bankName,
      String? bankState,
      String? bankPostalCode,
      String? bankCity,
      String? bankAddress,
      String? accountCurrency,
      String? accountNumber,
      String? accountName,
      String? accountSWiftCode,
      String? accountBsbCode,
      String? corresBankCountry,
      String? corresBankName,
      String? corresBankIban}) = _$_BeneficiaryData;

  factory _BeneficiaryData.fromJson(Map<String, dynamic> json) =
      _$_BeneficiaryData.fromJson;

  @override
  int get customerId => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  String? get bankName => throw _privateConstructorUsedError;
  @override
  String? get bankState => throw _privateConstructorUsedError;
  @override
  String? get bankPostalCode => throw _privateConstructorUsedError;
  @override
  String? get bankCity => throw _privateConstructorUsedError;
  @override
  String? get bankAddress => throw _privateConstructorUsedError;
  @override
  String? get accountCurrency => throw _privateConstructorUsedError;
  @override
  String? get accountNumber => throw _privateConstructorUsedError;
  @override
  String? get accountName => throw _privateConstructorUsedError;
  @override
  String? get accountSWiftCode => throw _privateConstructorUsedError;
  @override
  String? get accountBsbCode => throw _privateConstructorUsedError;
  @override
  String? get corresBankCountry => throw _privateConstructorUsedError;
  @override
  String? get corresBankName => throw _privateConstructorUsedError;
  @override
  String? get corresBankIban => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BeneficiaryDataCopyWith<_BeneficiaryData> get copyWith =>
      throw _privateConstructorUsedError;
}
