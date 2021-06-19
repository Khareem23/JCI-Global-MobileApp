// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'create_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateTransactionModel _$CreateTransactionModelFromJson(
    Map<String, dynamic> json) {
  return _CreateTransactionModel.fromJson(json);
}

/// @nodoc
class _$CreateTransactionModelTearOff {
  const _$CreateTransactionModelTearOff();

  _CreateTransactionModel call(
      {num? customerId,
      required num amountToSend,
      required num exchangeRate,
      required String paymentPurpose,
      required String paymentDescription,
      required String sendingCountry,
      required String receivingCountry,
      required num amountToReceive,
      int? amountToReceiveNgaUsd,
      String? bonusCode}) {
    return _CreateTransactionModel(
      customerId: customerId,
      amountToSend: amountToSend,
      exchangeRate: exchangeRate,
      paymentPurpose: paymentPurpose,
      paymentDescription: paymentDescription,
      sendingCountry: sendingCountry,
      receivingCountry: receivingCountry,
      amountToReceive: amountToReceive,
      amountToReceiveNgaUsd: amountToReceiveNgaUsd,
      bonusCode: bonusCode,
    );
  }

  CreateTransactionModel fromJson(Map<String, Object> json) {
    return CreateTransactionModel.fromJson(json);
  }
}

/// @nodoc
const $CreateTransactionModel = _$CreateTransactionModelTearOff();

/// @nodoc
mixin _$CreateTransactionModel {
  num? get customerId => throw _privateConstructorUsedError;
  num get amountToSend => throw _privateConstructorUsedError;
  num get exchangeRate => throw _privateConstructorUsedError;
  String get paymentPurpose => throw _privateConstructorUsedError;
  String get paymentDescription => throw _privateConstructorUsedError;
  String get sendingCountry => throw _privateConstructorUsedError;
  String get receivingCountry => throw _privateConstructorUsedError;
  num get amountToReceive => throw _privateConstructorUsedError;
  int? get amountToReceiveNgaUsd => throw _privateConstructorUsedError;
  String? get bonusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTransactionModelCopyWith<CreateTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTransactionModelCopyWith<$Res> {
  factory $CreateTransactionModelCopyWith(CreateTransactionModel value,
          $Res Function(CreateTransactionModel) then) =
      _$CreateTransactionModelCopyWithImpl<$Res>;
  $Res call(
      {num? customerId,
      num amountToSend,
      num exchangeRate,
      String paymentPurpose,
      String paymentDescription,
      String sendingCountry,
      String receivingCountry,
      num amountToReceive,
      int? amountToReceiveNgaUsd,
      String? bonusCode});
}

/// @nodoc
class _$CreateTransactionModelCopyWithImpl<$Res>
    implements $CreateTransactionModelCopyWith<$Res> {
  _$CreateTransactionModelCopyWithImpl(this._value, this._then);

  final CreateTransactionModel _value;
  // ignore: unused_field
  final $Res Function(CreateTransactionModel) _then;

  @override
  $Res call({
    Object? customerId = freezed,
    Object? amountToSend = freezed,
    Object? exchangeRate = freezed,
    Object? paymentPurpose = freezed,
    Object? paymentDescription = freezed,
    Object? sendingCountry = freezed,
    Object? receivingCountry = freezed,
    Object? amountToReceive = freezed,
    Object? amountToReceiveNgaUsd = freezed,
    Object? bonusCode = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as num?,
      amountToSend: amountToSend == freezed
          ? _value.amountToSend
          : amountToSend // ignore: cast_nullable_to_non_nullable
              as num,
      exchangeRate: exchangeRate == freezed
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as num,
      paymentPurpose: paymentPurpose == freezed
          ? _value.paymentPurpose
          : paymentPurpose // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDescription: paymentDescription == freezed
          ? _value.paymentDescription
          : paymentDescription // ignore: cast_nullable_to_non_nullable
              as String,
      sendingCountry: sendingCountry == freezed
          ? _value.sendingCountry
          : sendingCountry // ignore: cast_nullable_to_non_nullable
              as String,
      receivingCountry: receivingCountry == freezed
          ? _value.receivingCountry
          : receivingCountry // ignore: cast_nullable_to_non_nullable
              as String,
      amountToReceive: amountToReceive == freezed
          ? _value.amountToReceive
          : amountToReceive // ignore: cast_nullable_to_non_nullable
              as num,
      amountToReceiveNgaUsd: amountToReceiveNgaUsd == freezed
          ? _value.amountToReceiveNgaUsd
          : amountToReceiveNgaUsd // ignore: cast_nullable_to_non_nullable
              as int?,
      bonusCode: bonusCode == freezed
          ? _value.bonusCode
          : bonusCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CreateTransactionModelCopyWith<$Res>
    implements $CreateTransactionModelCopyWith<$Res> {
  factory _$CreateTransactionModelCopyWith(_CreateTransactionModel value,
          $Res Function(_CreateTransactionModel) then) =
      __$CreateTransactionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {num? customerId,
      num amountToSend,
      num exchangeRate,
      String paymentPurpose,
      String paymentDescription,
      String sendingCountry,
      String receivingCountry,
      num amountToReceive,
      int? amountToReceiveNgaUsd,
      String? bonusCode});
}

/// @nodoc
class __$CreateTransactionModelCopyWithImpl<$Res>
    extends _$CreateTransactionModelCopyWithImpl<$Res>
    implements _$CreateTransactionModelCopyWith<$Res> {
  __$CreateTransactionModelCopyWithImpl(_CreateTransactionModel _value,
      $Res Function(_CreateTransactionModel) _then)
      : super(_value, (v) => _then(v as _CreateTransactionModel));

  @override
  _CreateTransactionModel get _value => super._value as _CreateTransactionModel;

  @override
  $Res call({
    Object? customerId = freezed,
    Object? amountToSend = freezed,
    Object? exchangeRate = freezed,
    Object? paymentPurpose = freezed,
    Object? paymentDescription = freezed,
    Object? sendingCountry = freezed,
    Object? receivingCountry = freezed,
    Object? amountToReceive = freezed,
    Object? amountToReceiveNgaUsd = freezed,
    Object? bonusCode = freezed,
  }) {
    return _then(_CreateTransactionModel(
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as num?,
      amountToSend: amountToSend == freezed
          ? _value.amountToSend
          : amountToSend // ignore: cast_nullable_to_non_nullable
              as num,
      exchangeRate: exchangeRate == freezed
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as num,
      paymentPurpose: paymentPurpose == freezed
          ? _value.paymentPurpose
          : paymentPurpose // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDescription: paymentDescription == freezed
          ? _value.paymentDescription
          : paymentDescription // ignore: cast_nullable_to_non_nullable
              as String,
      sendingCountry: sendingCountry == freezed
          ? _value.sendingCountry
          : sendingCountry // ignore: cast_nullable_to_non_nullable
              as String,
      receivingCountry: receivingCountry == freezed
          ? _value.receivingCountry
          : receivingCountry // ignore: cast_nullable_to_non_nullable
              as String,
      amountToReceive: amountToReceive == freezed
          ? _value.amountToReceive
          : amountToReceive // ignore: cast_nullable_to_non_nullable
              as num,
      amountToReceiveNgaUsd: amountToReceiveNgaUsd == freezed
          ? _value.amountToReceiveNgaUsd
          : amountToReceiveNgaUsd // ignore: cast_nullable_to_non_nullable
              as int?,
      bonusCode: bonusCode == freezed
          ? _value.bonusCode
          : bonusCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateTransactionModel implements _CreateTransactionModel {
  const _$_CreateTransactionModel(
      {this.customerId,
      required this.amountToSend,
      required this.exchangeRate,
      required this.paymentPurpose,
      required this.paymentDescription,
      required this.sendingCountry,
      required this.receivingCountry,
      required this.amountToReceive,
      this.amountToReceiveNgaUsd,
      this.bonusCode});

  factory _$_CreateTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CreateTransactionModelFromJson(json);

  @override
  final num? customerId;
  @override
  final num amountToSend;
  @override
  final num exchangeRate;
  @override
  final String paymentPurpose;
  @override
  final String paymentDescription;
  @override
  final String sendingCountry;
  @override
  final String receivingCountry;
  @override
  final num amountToReceive;
  @override
  final int? amountToReceiveNgaUsd;
  @override
  final String? bonusCode;

  @override
  String toString() {
    return 'CreateTransactionModel(customerId: $customerId, amountToSend: $amountToSend, exchangeRate: $exchangeRate, paymentPurpose: $paymentPurpose, paymentDescription: $paymentDescription, sendingCountry: $sendingCountry, receivingCountry: $receivingCountry, amountToReceive: $amountToReceive, amountToReceiveNgaUsd: $amountToReceiveNgaUsd, bonusCode: $bonusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreateTransactionModel &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.amountToSend, amountToSend) ||
                const DeepCollectionEquality()
                    .equals(other.amountToSend, amountToSend)) &&
            (identical(other.exchangeRate, exchangeRate) ||
                const DeepCollectionEquality()
                    .equals(other.exchangeRate, exchangeRate)) &&
            (identical(other.paymentPurpose, paymentPurpose) ||
                const DeepCollectionEquality()
                    .equals(other.paymentPurpose, paymentPurpose)) &&
            (identical(other.paymentDescription, paymentDescription) ||
                const DeepCollectionEquality()
                    .equals(other.paymentDescription, paymentDescription)) &&
            (identical(other.sendingCountry, sendingCountry) ||
                const DeepCollectionEquality()
                    .equals(other.sendingCountry, sendingCountry)) &&
            (identical(other.receivingCountry, receivingCountry) ||
                const DeepCollectionEquality()
                    .equals(other.receivingCountry, receivingCountry)) &&
            (identical(other.amountToReceive, amountToReceive) ||
                const DeepCollectionEquality()
                    .equals(other.amountToReceive, amountToReceive)) &&
            (identical(other.amountToReceiveNgaUsd, amountToReceiveNgaUsd) ||
                const DeepCollectionEquality().equals(
                    other.amountToReceiveNgaUsd, amountToReceiveNgaUsd)) &&
            (identical(other.bonusCode, bonusCode) ||
                const DeepCollectionEquality()
                    .equals(other.bonusCode, bonusCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(amountToSend) ^
      const DeepCollectionEquality().hash(exchangeRate) ^
      const DeepCollectionEquality().hash(paymentPurpose) ^
      const DeepCollectionEquality().hash(paymentDescription) ^
      const DeepCollectionEquality().hash(sendingCountry) ^
      const DeepCollectionEquality().hash(receivingCountry) ^
      const DeepCollectionEquality().hash(amountToReceive) ^
      const DeepCollectionEquality().hash(amountToReceiveNgaUsd) ^
      const DeepCollectionEquality().hash(bonusCode);

  @JsonKey(ignore: true)
  @override
  _$CreateTransactionModelCopyWith<_CreateTransactionModel> get copyWith =>
      __$CreateTransactionModelCopyWithImpl<_CreateTransactionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CreateTransactionModelToJson(this);
  }
}

abstract class _CreateTransactionModel implements CreateTransactionModel {
  const factory _CreateTransactionModel(
      {num? customerId,
      required num amountToSend,
      required num exchangeRate,
      required String paymentPurpose,
      required String paymentDescription,
      required String sendingCountry,
      required String receivingCountry,
      required num amountToReceive,
      int? amountToReceiveNgaUsd,
      String? bonusCode}) = _$_CreateTransactionModel;

  factory _CreateTransactionModel.fromJson(Map<String, dynamic> json) =
      _$_CreateTransactionModel.fromJson;

  @override
  num? get customerId => throw _privateConstructorUsedError;
  @override
  num get amountToSend => throw _privateConstructorUsedError;
  @override
  num get exchangeRate => throw _privateConstructorUsedError;
  @override
  String get paymentPurpose => throw _privateConstructorUsedError;
  @override
  String get paymentDescription => throw _privateConstructorUsedError;
  @override
  String get sendingCountry => throw _privateConstructorUsedError;
  @override
  String get receivingCountry => throw _privateConstructorUsedError;
  @override
  num get amountToReceive => throw _privateConstructorUsedError;
  @override
  int? get amountToReceiveNgaUsd => throw _privateConstructorUsedError;
  @override
  String? get bonusCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CreateTransactionModelCopyWith<_CreateTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
