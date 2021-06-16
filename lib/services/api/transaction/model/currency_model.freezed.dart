// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'currency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) {
  return _CurrencyModel.fromJson(json);
}

/// @nodoc
class _$CurrencyModelTearOff {
  const _$CurrencyModelTearOff();

  _CurrencyModel call(
      {required String status, required String message, List<Datum>? data}) {
    return _CurrencyModel(
      status: status,
      message: message,
      data: data,
    );
  }

  CurrencyModel fromJson(Map<String, Object> json) {
    return CurrencyModel.fromJson(json);
  }
}

/// @nodoc
const $CurrencyModel = _$CurrencyModelTearOff();

/// @nodoc
mixin _$CurrencyModel {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Datum>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyModelCopyWith<CurrencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyModelCopyWith<$Res> {
  factory $CurrencyModelCopyWith(
          CurrencyModel value, $Res Function(CurrencyModel) then) =
      _$CurrencyModelCopyWithImpl<$Res>;
  $Res call({String status, String message, List<Datum>? data});
}

/// @nodoc
class _$CurrencyModelCopyWithImpl<$Res>
    implements $CurrencyModelCopyWith<$Res> {
  _$CurrencyModelCopyWithImpl(this._value, this._then);

  final CurrencyModel _value;
  // ignore: unused_field
  final $Res Function(CurrencyModel) _then;

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
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
    ));
  }
}

/// @nodoc
abstract class _$CurrencyModelCopyWith<$Res>
    implements $CurrencyModelCopyWith<$Res> {
  factory _$CurrencyModelCopyWith(
          _CurrencyModel value, $Res Function(_CurrencyModel) then) =
      __$CurrencyModelCopyWithImpl<$Res>;
  @override
  $Res call({String status, String message, List<Datum>? data});
}

/// @nodoc
class __$CurrencyModelCopyWithImpl<$Res>
    extends _$CurrencyModelCopyWithImpl<$Res>
    implements _$CurrencyModelCopyWith<$Res> {
  __$CurrencyModelCopyWithImpl(
      _CurrencyModel _value, $Res Function(_CurrencyModel) _then)
      : super(_value, (v) => _then(v as _CurrencyModel));

  @override
  _CurrencyModel get _value => super._value as _CurrencyModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_CurrencyModel(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyModel implements _CurrencyModel {
  const _$_CurrencyModel(
      {required this.status, required this.message, this.data});

  factory _$_CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CurrencyModelFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final List<Datum>? data;

  @override
  String toString() {
    return 'CurrencyModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CurrencyModel &&
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
  _$CurrencyModelCopyWith<_CurrencyModel> get copyWith =>
      __$CurrencyModelCopyWithImpl<_CurrencyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CurrencyModelToJson(this);
  }
}

abstract class _CurrencyModel implements CurrencyModel {
  const factory _CurrencyModel(
      {required String status,
      required String message,
      List<Datum>? data}) = _$_CurrencyModel;

  factory _CurrencyModel.fromJson(Map<String, dynamic> json) =
      _$_CurrencyModel.fromJson;

  @override
  String get status => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  List<Datum>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CurrencyModelCopyWith<_CurrencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
class _$DatumTearOff {
  const _$DatumTearOff();

  _Datum call(
      {required String country,
      required String callingCode,
      required String alpha3Code,
      required String alpha2Code,
      required String currency,
      required String flag}) {
    return _Datum(
      country: country,
      callingCode: callingCode,
      alpha3Code: alpha3Code,
      alpha2Code: alpha2Code,
      currency: currency,
      flag: flag,
    );
  }

  Datum fromJson(Map<String, Object> json) {
    return Datum.fromJson(json);
  }
}

/// @nodoc
const $Datum = _$DatumTearOff();

/// @nodoc
mixin _$Datum {
  String get country => throw _privateConstructorUsedError;
  String get callingCode => throw _privateConstructorUsedError;
  String get alpha3Code => throw _privateConstructorUsedError;
  String get alpha2Code => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get flag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res>;
  $Res call(
      {String country,
      String callingCode,
      String alpha3Code,
      String alpha2Code,
      String currency,
      String flag});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res> implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  final Datum _value;
  // ignore: unused_field
  final $Res Function(Datum) _then;

  @override
  $Res call({
    Object? country = freezed,
    Object? callingCode = freezed,
    Object? alpha3Code = freezed,
    Object? alpha2Code = freezed,
    Object? currency = freezed,
    Object? flag = freezed,
  }) {
    return _then(_value.copyWith(
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      callingCode: callingCode == freezed
          ? _value.callingCode
          : callingCode // ignore: cast_nullable_to_non_nullable
              as String,
      alpha3Code: alpha3Code == freezed
          ? _value.alpha3Code
          : alpha3Code // ignore: cast_nullable_to_non_nullable
              as String,
      alpha2Code: alpha2Code == freezed
          ? _value.alpha2Code
          : alpha2Code // ignore: cast_nullable_to_non_nullable
              as String,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$DatumCopyWith(_Datum value, $Res Function(_Datum) then) =
      __$DatumCopyWithImpl<$Res>;
  @override
  $Res call(
      {String country,
      String callingCode,
      String alpha3Code,
      String alpha2Code,
      String currency,
      String flag});
}

/// @nodoc
class __$DatumCopyWithImpl<$Res> extends _$DatumCopyWithImpl<$Res>
    implements _$DatumCopyWith<$Res> {
  __$DatumCopyWithImpl(_Datum _value, $Res Function(_Datum) _then)
      : super(_value, (v) => _then(v as _Datum));

  @override
  _Datum get _value => super._value as _Datum;

  @override
  $Res call({
    Object? country = freezed,
    Object? callingCode = freezed,
    Object? alpha3Code = freezed,
    Object? alpha2Code = freezed,
    Object? currency = freezed,
    Object? flag = freezed,
  }) {
    return _then(_Datum(
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      callingCode: callingCode == freezed
          ? _value.callingCode
          : callingCode // ignore: cast_nullable_to_non_nullable
              as String,
      alpha3Code: alpha3Code == freezed
          ? _value.alpha3Code
          : alpha3Code // ignore: cast_nullable_to_non_nullable
              as String,
      alpha2Code: alpha2Code == freezed
          ? _value.alpha2Code
          : alpha2Code // ignore: cast_nullable_to_non_nullable
              as String,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Datum implements _Datum {
  const _$_Datum(
      {required this.country,
      required this.callingCode,
      required this.alpha3Code,
      required this.alpha2Code,
      required this.currency,
      required this.flag});

  factory _$_Datum.fromJson(Map<String, dynamic> json) =>
      _$_$_DatumFromJson(json);

  @override
  final String country;
  @override
  final String callingCode;
  @override
  final String alpha3Code;
  @override
  final String alpha2Code;
  @override
  final String currency;
  @override
  final String flag;

  @override
  String toString() {
    return 'Datum(country: $country, callingCode: $callingCode, alpha3Code: $alpha3Code, alpha2Code: $alpha2Code, currency: $currency, flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Datum &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.callingCode, callingCode) ||
                const DeepCollectionEquality()
                    .equals(other.callingCode, callingCode)) &&
            (identical(other.alpha3Code, alpha3Code) ||
                const DeepCollectionEquality()
                    .equals(other.alpha3Code, alpha3Code)) &&
            (identical(other.alpha2Code, alpha2Code) ||
                const DeepCollectionEquality()
                    .equals(other.alpha2Code, alpha2Code)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.flag, flag) ||
                const DeepCollectionEquality().equals(other.flag, flag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(callingCode) ^
      const DeepCollectionEquality().hash(alpha3Code) ^
      const DeepCollectionEquality().hash(alpha2Code) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(flag);

  @JsonKey(ignore: true)
  @override
  _$DatumCopyWith<_Datum> get copyWith =>
      __$DatumCopyWithImpl<_Datum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DatumToJson(this);
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {required String country,
      required String callingCode,
      required String alpha3Code,
      required String alpha2Code,
      required String currency,
      required String flag}) = _$_Datum;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$_Datum.fromJson;

  @override
  String get country => throw _privateConstructorUsedError;
  @override
  String get callingCode => throw _privateConstructorUsedError;
  @override
  String get alpha3Code => throw _privateConstructorUsedError;
  @override
  String get alpha2Code => throw _privateConstructorUsedError;
  @override
  String get currency => throw _privateConstructorUsedError;
  @override
  String get flag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DatumCopyWith<_Datum> get copyWith => throw _privateConstructorUsedError;
}
