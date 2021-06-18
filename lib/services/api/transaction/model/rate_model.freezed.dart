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
      {required String status, required String message, RateData? data}) {
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
  RateData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateModelCopyWith<RateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateModelCopyWith<$Res> {
  factory $RateModelCopyWith(RateModel value, $Res Function(RateModel) then) =
      _$RateModelCopyWithImpl<$Res>;
  $Res call({String status, String message, RateData? data});

  $RateDataCopyWith<$Res>? get data;
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
              as RateData?,
    ));
  }

  @override
  $RateDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $RateDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$RateModelCopyWith<$Res> implements $RateModelCopyWith<$Res> {
  factory _$RateModelCopyWith(
          _RateModel value, $Res Function(_RateModel) then) =
      __$RateModelCopyWithImpl<$Res>;
  @override
  $Res call({String status, String message, RateData? data});

  @override
  $RateDataCopyWith<$Res>? get data;
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
              as RateData?,
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
  final RateData? data;

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
      RateData? data}) = _$_RateModel;

  factory _RateModel.fromJson(Map<String, dynamic> json) =
      _$_RateModel.fromJson;

  @override
  String get status => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  RateData? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RateModelCopyWith<_RateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

RateData _$RateDataFromJson(Map<String, dynamic> json) {
  return _RateData.fromJson(json);
}

/// @nodoc
class _$RateDataTearOff {
  const _$RateDataTearOff();

  _RateData call(
      {required num amountToSend,
      required num totalAmountToCharge,
      required double amountToReceive,
      dynamic amountToReceiveNgaUsd = 0,
      required double rate}) {
    return _RateData(
      amountToSend: amountToSend,
      totalAmountToCharge: totalAmountToCharge,
      amountToReceive: amountToReceive,
      amountToReceiveNgaUsd: amountToReceiveNgaUsd,
      rate: rate,
    );
  }

  RateData fromJson(Map<String, Object> json) {
    return RateData.fromJson(json);
  }
}

/// @nodoc
const $RateData = _$RateDataTearOff();

/// @nodoc
mixin _$RateData {
  num get amountToSend => throw _privateConstructorUsedError;
  num get totalAmountToCharge => throw _privateConstructorUsedError;
  double get amountToReceive => throw _privateConstructorUsedError;
  dynamic get amountToReceiveNgaUsd => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateDataCopyWith<RateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateDataCopyWith<$Res> {
  factory $RateDataCopyWith(RateData value, $Res Function(RateData) then) =
      _$RateDataCopyWithImpl<$Res>;
  $Res call(
      {num amountToSend,
      num totalAmountToCharge,
      double amountToReceive,
      dynamic amountToReceiveNgaUsd,
      double rate});
}

/// @nodoc
class _$RateDataCopyWithImpl<$Res> implements $RateDataCopyWith<$Res> {
  _$RateDataCopyWithImpl(this._value, this._then);

  final RateData _value;
  // ignore: unused_field
  final $Res Function(RateData) _then;

  @override
  $Res call({
    Object? amountToSend = freezed,
    Object? totalAmountToCharge = freezed,
    Object? amountToReceive = freezed,
    Object? amountToReceiveNgaUsd = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      amountToSend: amountToSend == freezed
          ? _value.amountToSend
          : amountToSend // ignore: cast_nullable_to_non_nullable
              as num,
      totalAmountToCharge: totalAmountToCharge == freezed
          ? _value.totalAmountToCharge
          : totalAmountToCharge // ignore: cast_nullable_to_non_nullable
              as num,
      amountToReceive: amountToReceive == freezed
          ? _value.amountToReceive
          : amountToReceive // ignore: cast_nullable_to_non_nullable
              as double,
      amountToReceiveNgaUsd: amountToReceiveNgaUsd == freezed
          ? _value.amountToReceiveNgaUsd
          : amountToReceiveNgaUsd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$RateDataCopyWith<$Res> implements $RateDataCopyWith<$Res> {
  factory _$RateDataCopyWith(_RateData value, $Res Function(_RateData) then) =
      __$RateDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {num amountToSend,
      num totalAmountToCharge,
      double amountToReceive,
      dynamic amountToReceiveNgaUsd,
      double rate});
}

/// @nodoc
class __$RateDataCopyWithImpl<$Res> extends _$RateDataCopyWithImpl<$Res>
    implements _$RateDataCopyWith<$Res> {
  __$RateDataCopyWithImpl(_RateData _value, $Res Function(_RateData) _then)
      : super(_value, (v) => _then(v as _RateData));

  @override
  _RateData get _value => super._value as _RateData;

  @override
  $Res call({
    Object? amountToSend = freezed,
    Object? totalAmountToCharge = freezed,
    Object? amountToReceive = freezed,
    Object? amountToReceiveNgaUsd = freezed,
    Object? rate = freezed,
  }) {
    return _then(_RateData(
      amountToSend: amountToSend == freezed
          ? _value.amountToSend
          : amountToSend // ignore: cast_nullable_to_non_nullable
              as num,
      totalAmountToCharge: totalAmountToCharge == freezed
          ? _value.totalAmountToCharge
          : totalAmountToCharge // ignore: cast_nullable_to_non_nullable
              as num,
      amountToReceive: amountToReceive == freezed
          ? _value.amountToReceive
          : amountToReceive // ignore: cast_nullable_to_non_nullable
              as double,
      amountToReceiveNgaUsd: amountToReceiveNgaUsd == freezed
          ? _value.amountToReceiveNgaUsd
          : amountToReceiveNgaUsd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RateData implements _RateData {
  const _$_RateData(
      {required this.amountToSend,
      required this.totalAmountToCharge,
      required this.amountToReceive,
      this.amountToReceiveNgaUsd = 0,
      required this.rate});

  factory _$_RateData.fromJson(Map<String, dynamic> json) =>
      _$_$_RateDataFromJson(json);

  @override
  final num amountToSend;
  @override
  final num totalAmountToCharge;
  @override
  final double amountToReceive;
  @JsonKey(defaultValue: 0)
  @override
  final dynamic amountToReceiveNgaUsd;
  @override
  final double rate;

  @override
  String toString() {
    return 'RateData(amountToSend: $amountToSend, totalAmountToCharge: $totalAmountToCharge, amountToReceive: $amountToReceive, amountToReceiveNgaUsd: $amountToReceiveNgaUsd, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RateData &&
            (identical(other.amountToSend, amountToSend) ||
                const DeepCollectionEquality()
                    .equals(other.amountToSend, amountToSend)) &&
            (identical(other.totalAmountToCharge, totalAmountToCharge) ||
                const DeepCollectionEquality()
                    .equals(other.totalAmountToCharge, totalAmountToCharge)) &&
            (identical(other.amountToReceive, amountToReceive) ||
                const DeepCollectionEquality()
                    .equals(other.amountToReceive, amountToReceive)) &&
            (identical(other.amountToReceiveNgaUsd, amountToReceiveNgaUsd) ||
                const DeepCollectionEquality().equals(
                    other.amountToReceiveNgaUsd, amountToReceiveNgaUsd)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amountToSend) ^
      const DeepCollectionEquality().hash(totalAmountToCharge) ^
      const DeepCollectionEquality().hash(amountToReceive) ^
      const DeepCollectionEquality().hash(amountToReceiveNgaUsd) ^
      const DeepCollectionEquality().hash(rate);

  @JsonKey(ignore: true)
  @override
  _$RateDataCopyWith<_RateData> get copyWith =>
      __$RateDataCopyWithImpl<_RateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RateDataToJson(this);
  }
}

abstract class _RateData implements RateData {
  const factory _RateData(
      {required num amountToSend,
      required num totalAmountToCharge,
      required double amountToReceive,
      dynamic amountToReceiveNgaUsd,
      required double rate}) = _$_RateData;

  factory _RateData.fromJson(Map<String, dynamic> json) = _$_RateData.fromJson;

  @override
  num get amountToSend => throw _privateConstructorUsedError;
  @override
  num get totalAmountToCharge => throw _privateConstructorUsedError;
  @override
  double get amountToReceive => throw _privateConstructorUsedError;
  @override
  dynamic get amountToReceiveNgaUsd => throw _privateConstructorUsedError;
  @override
  double get rate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RateDataCopyWith<_RateData> get copyWith =>
      throw _privateConstructorUsedError;
}
