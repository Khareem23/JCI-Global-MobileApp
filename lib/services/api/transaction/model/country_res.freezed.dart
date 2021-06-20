// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'country_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryRes _$CountryResFromJson(Map<String, dynamic> json) {
  return _CountryRes.fromJson(json);
}

/// @nodoc
class _$CountryResTearOff {
  const _$CountryResTearOff();

  _CountryRes call({String? status, String? message, List<CountryData>? data}) {
    return _CountryRes(
      status: status,
      message: message,
      data: data,
    );
  }

  CountryRes fromJson(Map<String, Object> json) {
    return CountryRes.fromJson(json);
  }
}

/// @nodoc
const $CountryRes = _$CountryResTearOff();

/// @nodoc
mixin _$CountryRes {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<CountryData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryResCopyWith<CountryRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryResCopyWith<$Res> {
  factory $CountryResCopyWith(
          CountryRes value, $Res Function(CountryRes) then) =
      _$CountryResCopyWithImpl<$Res>;
  $Res call({String? status, String? message, List<CountryData>? data});
}

/// @nodoc
class _$CountryResCopyWithImpl<$Res> implements $CountryResCopyWith<$Res> {
  _$CountryResCopyWithImpl(this._value, this._then);

  final CountryRes _value;
  // ignore: unused_field
  final $Res Function(CountryRes) _then;

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
              as List<CountryData>?,
    ));
  }
}

/// @nodoc
abstract class _$CountryResCopyWith<$Res> implements $CountryResCopyWith<$Res> {
  factory _$CountryResCopyWith(
          _CountryRes value, $Res Function(_CountryRes) then) =
      __$CountryResCopyWithImpl<$Res>;
  @override
  $Res call({String? status, String? message, List<CountryData>? data});
}

/// @nodoc
class __$CountryResCopyWithImpl<$Res> extends _$CountryResCopyWithImpl<$Res>
    implements _$CountryResCopyWith<$Res> {
  __$CountryResCopyWithImpl(
      _CountryRes _value, $Res Function(_CountryRes) _then)
      : super(_value, (v) => _then(v as _CountryRes));

  @override
  _CountryRes get _value => super._value as _CountryRes;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_CountryRes(
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
              as List<CountryData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryRes implements _CountryRes {
  const _$_CountryRes({this.status, this.message, this.data});

  factory _$_CountryRes.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryResFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final List<CountryData>? data;

  @override
  String toString() {
    return 'CountryRes(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryRes &&
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
  _$CountryResCopyWith<_CountryRes> get copyWith =>
      __$CountryResCopyWithImpl<_CountryRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryResToJson(this);
  }
}

abstract class _CountryRes implements CountryRes {
  const factory _CountryRes(
      {String? status,
      String? message,
      List<CountryData>? data}) = _$_CountryRes;

  factory _CountryRes.fromJson(Map<String, dynamic> json) =
      _$_CountryRes.fromJson;

  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  List<CountryData>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryResCopyWith<_CountryRes> get copyWith =>
      throw _privateConstructorUsedError;
}

CountryData _$CountryDataFromJson(Map<String, dynamic> json) {
  return _CountryData.fromJson(json);
}

/// @nodoc
class _$CountryDataTearOff {
  const _$CountryDataTearOff();

  _CountryData call(
      {String? country,
      String? callingCode,
      String? alpha3Code,
      String? alpha2Code,
      String? currency,
      String? flag}) {
    return _CountryData(
      country: country,
      callingCode: callingCode,
      alpha3Code: alpha3Code,
      alpha2Code: alpha2Code,
      currency: currency,
      flag: flag,
    );
  }

  CountryData fromJson(Map<String, Object> json) {
    return CountryData.fromJson(json);
  }
}

/// @nodoc
const $CountryData = _$CountryDataTearOff();

/// @nodoc
mixin _$CountryData {
  String? get country => throw _privateConstructorUsedError;
  String? get callingCode => throw _privateConstructorUsedError;
  String? get alpha3Code => throw _privateConstructorUsedError;
  String? get alpha2Code => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get flag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryDataCopyWith<CountryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryDataCopyWith<$Res> {
  factory $CountryDataCopyWith(
          CountryData value, $Res Function(CountryData) then) =
      _$CountryDataCopyWithImpl<$Res>;
  $Res call(
      {String? country,
      String? callingCode,
      String? alpha3Code,
      String? alpha2Code,
      String? currency,
      String? flag});
}

/// @nodoc
class _$CountryDataCopyWithImpl<$Res> implements $CountryDataCopyWith<$Res> {
  _$CountryDataCopyWithImpl(this._value, this._then);

  final CountryData _value;
  // ignore: unused_field
  final $Res Function(CountryData) _then;

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
              as String?,
      callingCode: callingCode == freezed
          ? _value.callingCode
          : callingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      alpha3Code: alpha3Code == freezed
          ? _value.alpha3Code
          : alpha3Code // ignore: cast_nullable_to_non_nullable
              as String?,
      alpha2Code: alpha2Code == freezed
          ? _value.alpha2Code
          : alpha2Code // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CountryDataCopyWith<$Res>
    implements $CountryDataCopyWith<$Res> {
  factory _$CountryDataCopyWith(
          _CountryData value, $Res Function(_CountryData) then) =
      __$CountryDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? country,
      String? callingCode,
      String? alpha3Code,
      String? alpha2Code,
      String? currency,
      String? flag});
}

/// @nodoc
class __$CountryDataCopyWithImpl<$Res> extends _$CountryDataCopyWithImpl<$Res>
    implements _$CountryDataCopyWith<$Res> {
  __$CountryDataCopyWithImpl(
      _CountryData _value, $Res Function(_CountryData) _then)
      : super(_value, (v) => _then(v as _CountryData));

  @override
  _CountryData get _value => super._value as _CountryData;

  @override
  $Res call({
    Object? country = freezed,
    Object? callingCode = freezed,
    Object? alpha3Code = freezed,
    Object? alpha2Code = freezed,
    Object? currency = freezed,
    Object? flag = freezed,
  }) {
    return _then(_CountryData(
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      callingCode: callingCode == freezed
          ? _value.callingCode
          : callingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      alpha3Code: alpha3Code == freezed
          ? _value.alpha3Code
          : alpha3Code // ignore: cast_nullable_to_non_nullable
              as String?,
      alpha2Code: alpha2Code == freezed
          ? _value.alpha2Code
          : alpha2Code // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryData implements _CountryData {
  const _$_CountryData(
      {this.country,
      this.callingCode,
      this.alpha3Code,
      this.alpha2Code,
      this.currency,
      this.flag});

  factory _$_CountryData.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryDataFromJson(json);

  @override
  final String? country;
  @override
  final String? callingCode;
  @override
  final String? alpha3Code;
  @override
  final String? alpha2Code;
  @override
  final String? currency;
  @override
  final String? flag;

  @override
  String toString() {
    return 'CountryData(country: $country, callingCode: $callingCode, alpha3Code: $alpha3Code, alpha2Code: $alpha2Code, currency: $currency, flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryData &&
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
  _$CountryDataCopyWith<_CountryData> get copyWith =>
      __$CountryDataCopyWithImpl<_CountryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryDataToJson(this);
  }
}

abstract class _CountryData implements CountryData {
  const factory _CountryData(
      {String? country,
      String? callingCode,
      String? alpha3Code,
      String? alpha2Code,
      String? currency,
      String? flag}) = _$_CountryData;

  factory _CountryData.fromJson(Map<String, dynamic> json) =
      _$_CountryData.fromJson;

  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  String? get callingCode => throw _privateConstructorUsedError;
  @override
  String? get alpha3Code => throw _privateConstructorUsedError;
  @override
  String? get alpha2Code => throw _privateConstructorUsedError;
  @override
  String? get currency => throw _privateConstructorUsedError;
  @override
  String? get flag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryDataCopyWith<_CountryData> get copyWith =>
      throw _privateConstructorUsedError;
}
