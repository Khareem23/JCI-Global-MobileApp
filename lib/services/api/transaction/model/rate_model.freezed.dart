// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RateModel _$RateModelFromJson(Map<String, dynamic> json) {
  return _RateModel.fromJson(json);
}

/// @nodoc
class _$RateModelTearOff {
  const _$RateModelTearOff();

  _RateModel call(
      {required String status, required String message, List<Datum>? data}) {
    return _RateModel(
      status: status,
      message: message,
      data: data,
    );
  }

  RateModel fromJson(Map<String, Object> json) {
    return RateModel.fromJson(json);
  }
}

/// @nodoc
const $RateModel = _$RateModelTearOff();

/// @nodoc
mixin _$RateModel {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Datum>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateModelCopyWith<RateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateModelCopyWith<$Res> {
  factory $RateModelCopyWith(RateModel value, $Res Function(RateModel) then) =
      _$RateModelCopyWithImpl<$Res>;
  $Res call({String status, String message, List<Datum>? data});
}

/// @nodoc
class _$RateModelCopyWithImpl<$Res> implements $RateModelCopyWith<$Res> {
  _$RateModelCopyWithImpl(this._value, this._then);

  final RateModel _value;
  // ignore: unused_field
  final $Res Function(RateModel) _then;

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
abstract class _$RateModelCopyWith<$Res> implements $RateModelCopyWith<$Res> {
  factory _$RateModelCopyWith(
          _RateModel value, $Res Function(_RateModel) then) =
      __$RateModelCopyWithImpl<$Res>;
  @override
  $Res call({String status, String message, List<Datum>? data});
}

/// @nodoc
class __$RateModelCopyWithImpl<$Res> extends _$RateModelCopyWithImpl<$Res>
    implements _$RateModelCopyWith<$Res> {
  __$RateModelCopyWithImpl(_RateModel _value, $Res Function(_RateModel) _then)
      : super(_value, (v) => _then(v as _RateModel));

  @override
  _RateModel get _value => super._value as _RateModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_RateModel(
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
class _$_RateModel implements _RateModel {
  const _$_RateModel({required this.status, required this.message, this.data});

  factory _$_RateModel.fromJson(Map<String, dynamic> json) =>
      _$_$_RateModelFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final List<Datum>? data;

  @override
  String toString() {
    return 'RateModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RateModel &&
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
  _$RateModelCopyWith<_RateModel> get copyWith =>
      __$RateModelCopyWithImpl<_RateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RateModelToJson(this);
  }
}

abstract class _RateModel implements RateModel {
  const factory _RateModel(
      {required String status,
      required String message,
      List<Datum>? data}) = _$_RateModel;

  factory _RateModel.fromJson(Map<String, dynamic> json) =
      _$_RateModel.fromJson;

  @override
  String get status => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  List<Datum>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RateModelCopyWith<_RateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
class _$DatumTearOff {
  const _$DatumTearOff();

  _Datum call(
      {required int id,
      String? currencyDesc,
      int? rateType,
      String? sendCurrencyCode,
      String? receiveCurrencyCode,
      bool? isUsdDisplay,
      bool? isActive,
      double? amount,
      double? amountNgaUsd}) {
    return _Datum(
      id: id,
      currencyDesc: currencyDesc,
      rateType: rateType,
      sendCurrencyCode: sendCurrencyCode,
      receiveCurrencyCode: receiveCurrencyCode,
      isUsdDisplay: isUsdDisplay,
      isActive: isActive,
      amount: amount,
      amountNgaUsd: amountNgaUsd,
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
  int get id => throw _privateConstructorUsedError;
  String? get currencyDesc => throw _privateConstructorUsedError;
  int? get rateType => throw _privateConstructorUsedError;
  String? get sendCurrencyCode => throw _privateConstructorUsedError;
  String? get receiveCurrencyCode => throw _privateConstructorUsedError;
  bool? get isUsdDisplay => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  double? get amountNgaUsd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? currencyDesc,
      int? rateType,
      String? sendCurrencyCode,
      String? receiveCurrencyCode,
      bool? isUsdDisplay,
      bool? isActive,
      double? amount,
      double? amountNgaUsd});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res> implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  final Datum _value;
  // ignore: unused_field
  final $Res Function(Datum) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? currencyDesc = freezed,
    Object? rateType = freezed,
    Object? sendCurrencyCode = freezed,
    Object? receiveCurrencyCode = freezed,
    Object? isUsdDisplay = freezed,
    Object? isActive = freezed,
    Object? amount = freezed,
    Object? amountNgaUsd = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      currencyDesc: currencyDesc == freezed
          ? _value.currencyDesc
          : currencyDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      rateType: rateType == freezed
          ? _value.rateType
          : rateType // ignore: cast_nullable_to_non_nullable
              as int?,
      sendCurrencyCode: sendCurrencyCode == freezed
          ? _value.sendCurrencyCode
          : sendCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      receiveCurrencyCode: receiveCurrencyCode == freezed
          ? _value.receiveCurrencyCode
          : receiveCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isUsdDisplay: isUsdDisplay == freezed
          ? _value.isUsdDisplay
          : isUsdDisplay // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      amountNgaUsd: amountNgaUsd == freezed
          ? _value.amountNgaUsd
          : amountNgaUsd // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$DatumCopyWith(_Datum value, $Res Function(_Datum) then) =
      __$DatumCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? currencyDesc,
      int? rateType,
      String? sendCurrencyCode,
      String? receiveCurrencyCode,
      bool? isUsdDisplay,
      bool? isActive,
      double? amount,
      double? amountNgaUsd});
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
    Object? id = freezed,
    Object? currencyDesc = freezed,
    Object? rateType = freezed,
    Object? sendCurrencyCode = freezed,
    Object? receiveCurrencyCode = freezed,
    Object? isUsdDisplay = freezed,
    Object? isActive = freezed,
    Object? amount = freezed,
    Object? amountNgaUsd = freezed,
  }) {
    return _then(_Datum(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      currencyDesc: currencyDesc == freezed
          ? _value.currencyDesc
          : currencyDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      rateType: rateType == freezed
          ? _value.rateType
          : rateType // ignore: cast_nullable_to_non_nullable
              as int?,
      sendCurrencyCode: sendCurrencyCode == freezed
          ? _value.sendCurrencyCode
          : sendCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      receiveCurrencyCode: receiveCurrencyCode == freezed
          ? _value.receiveCurrencyCode
          : receiveCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isUsdDisplay: isUsdDisplay == freezed
          ? _value.isUsdDisplay
          : isUsdDisplay // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      amountNgaUsd: amountNgaUsd == freezed
          ? _value.amountNgaUsd
          : amountNgaUsd // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Datum implements _Datum {
  const _$_Datum(
      {required this.id,
      this.currencyDesc,
      this.rateType,
      this.sendCurrencyCode,
      this.receiveCurrencyCode,
      this.isUsdDisplay,
      this.isActive,
      this.amount,
      this.amountNgaUsd});

  factory _$_Datum.fromJson(Map<String, dynamic> json) =>
      _$_$_DatumFromJson(json);

  @override
  final int id;
  @override
  final String? currencyDesc;
  @override
  final int? rateType;
  @override
  final String? sendCurrencyCode;
  @override
  final String? receiveCurrencyCode;
  @override
  final bool? isUsdDisplay;
  @override
  final bool? isActive;
  @override
  final double? amount;
  @override
  final double? amountNgaUsd;

  @override
  String toString() {
    return 'Datum(id: $id, currencyDesc: $currencyDesc, rateType: $rateType, sendCurrencyCode: $sendCurrencyCode, receiveCurrencyCode: $receiveCurrencyCode, isUsdDisplay: $isUsdDisplay, isActive: $isActive, amount: $amount, amountNgaUsd: $amountNgaUsd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Datum &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.currencyDesc, currencyDesc) ||
                const DeepCollectionEquality()
                    .equals(other.currencyDesc, currencyDesc)) &&
            (identical(other.rateType, rateType) ||
                const DeepCollectionEquality()
                    .equals(other.rateType, rateType)) &&
            (identical(other.sendCurrencyCode, sendCurrencyCode) ||
                const DeepCollectionEquality()
                    .equals(other.sendCurrencyCode, sendCurrencyCode)) &&
            (identical(other.receiveCurrencyCode, receiveCurrencyCode) ||
                const DeepCollectionEquality()
                    .equals(other.receiveCurrencyCode, receiveCurrencyCode)) &&
            (identical(other.isUsdDisplay, isUsdDisplay) ||
                const DeepCollectionEquality()
                    .equals(other.isUsdDisplay, isUsdDisplay)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.amountNgaUsd, amountNgaUsd) ||
                const DeepCollectionEquality()
                    .equals(other.amountNgaUsd, amountNgaUsd)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(currencyDesc) ^
      const DeepCollectionEquality().hash(rateType) ^
      const DeepCollectionEquality().hash(sendCurrencyCode) ^
      const DeepCollectionEquality().hash(receiveCurrencyCode) ^
      const DeepCollectionEquality().hash(isUsdDisplay) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(amountNgaUsd);

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
      {required int id,
      String? currencyDesc,
      int? rateType,
      String? sendCurrencyCode,
      String? receiveCurrencyCode,
      bool? isUsdDisplay,
      bool? isActive,
      double? amount,
      double? amountNgaUsd}) = _$_Datum;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$_Datum.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get currencyDesc => throw _privateConstructorUsedError;
  @override
  int? get rateType => throw _privateConstructorUsedError;
  @override
  String? get sendCurrencyCode => throw _privateConstructorUsedError;
  @override
  String? get receiveCurrencyCode => throw _privateConstructorUsedError;
  @override
  bool? get isUsdDisplay => throw _privateConstructorUsedError;
  @override
  bool? get isActive => throw _privateConstructorUsedError;
  @override
  double? get amount => throw _privateConstructorUsedError;
  @override
  double? get amountNgaUsd => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DatumCopyWith<_Datum> get copyWith => throw _privateConstructorUsedError;
}
