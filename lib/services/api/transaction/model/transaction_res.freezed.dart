// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transaction_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionRes _$TransactionResFromJson(Map<String, dynamic> json) {
  return _TransactionRes.fromJson(json);
}

/// @nodoc
class _$TransactionResTearOff {
  const _$TransactionResTearOff();

  _TransactionRes call(
      {String? status, String? message, TransactionData? data}) {
    return _TransactionRes(
      status: status,
      message: message,
      data: data,
    );
  }

  TransactionRes fromJson(Map<String, Object> json) {
    return TransactionRes.fromJson(json);
  }
}

/// @nodoc
const $TransactionRes = _$TransactionResTearOff();

/// @nodoc
mixin _$TransactionRes {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  TransactionData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionResCopyWith<TransactionRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionResCopyWith<$Res> {
  factory $TransactionResCopyWith(
          TransactionRes value, $Res Function(TransactionRes) then) =
      _$TransactionResCopyWithImpl<$Res>;
  $Res call({String? status, String? message, TransactionData? data});

  $TransactionDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$TransactionResCopyWithImpl<$Res>
    implements $TransactionResCopyWith<$Res> {
  _$TransactionResCopyWithImpl(this._value, this._then);

  final TransactionRes _value;
  // ignore: unused_field
  final $Res Function(TransactionRes) _then;

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
              as TransactionData?,
    ));
  }

  @override
  $TransactionDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TransactionDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$TransactionResCopyWith<$Res>
    implements $TransactionResCopyWith<$Res> {
  factory _$TransactionResCopyWith(
          _TransactionRes value, $Res Function(_TransactionRes) then) =
      __$TransactionResCopyWithImpl<$Res>;
  @override
  $Res call({String? status, String? message, TransactionData? data});

  @override
  $TransactionDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$TransactionResCopyWithImpl<$Res>
    extends _$TransactionResCopyWithImpl<$Res>
    implements _$TransactionResCopyWith<$Res> {
  __$TransactionResCopyWithImpl(
      _TransactionRes _value, $Res Function(_TransactionRes) _then)
      : super(_value, (v) => _then(v as _TransactionRes));

  @override
  _TransactionRes get _value => super._value as _TransactionRes;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_TransactionRes(
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
              as TransactionData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionRes implements _TransactionRes {
  const _$_TransactionRes({this.status, this.message, this.data});

  factory _$_TransactionRes.fromJson(Map<String, dynamic> json) =>
      _$_$_TransactionResFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final TransactionData? data;

  @override
  String toString() {
    return 'TransactionRes(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionRes &&
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
  _$TransactionResCopyWith<_TransactionRes> get copyWith =>
      __$TransactionResCopyWithImpl<_TransactionRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransactionResToJson(this);
  }
}

abstract class _TransactionRes implements TransactionRes {
  const factory _TransactionRes(
      {String? status,
      String? message,
      TransactionData? data}) = _$_TransactionRes;

  factory _TransactionRes.fromJson(Map<String, dynamic> json) =
      _$_TransactionRes.fromJson;

  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  TransactionData? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransactionResCopyWith<_TransactionRes> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionData _$TransactionDataFromJson(Map<String, dynamic> json) {
  return _TransactionData.fromJson(json);
}

/// @nodoc
class _$TransactionDataTearOff {
  const _$TransactionDataTearOff();

  _TransactionData call(
      {required num customerId,
      String? fullName,
      String? senderEmail,
      num? id,
      String? transactionRefNumber,
      String? transactionType,
      String? sendingCountry,
      String? receivingCountry,
      num? amountToSend,
      num? amountToCharge,
      num? amountToReceive,
      num? amountToReceiveNgn,
      num? amountToReceiveUsd,
      String? payInMethod,
      String? paymentPurpose,
      String? paymentDescription,
      DateTime? dateSent,
      DateTime? dateProcessed,
      String? transactionStatus,
      String? paymentConfirmationUrl,
      bool? isPaidIn,
      num? bonus,
      String? bonusType,
      String? bonusCode,
      num? exchangeRate,
      String? statusDescription,
      num? receiverId,
      Receiver? receiver,
      Payment? payment}) {
    return _TransactionData(
      customerId: customerId,
      fullName: fullName,
      senderEmail: senderEmail,
      id: id,
      transactionRefNumber: transactionRefNumber,
      transactionType: transactionType,
      sendingCountry: sendingCountry,
      receivingCountry: receivingCountry,
      amountToSend: amountToSend,
      amountToCharge: amountToCharge,
      amountToReceive: amountToReceive,
      amountToReceiveNgn: amountToReceiveNgn,
      amountToReceiveUsd: amountToReceiveUsd,
      payInMethod: payInMethod,
      paymentPurpose: paymentPurpose,
      paymentDescription: paymentDescription,
      dateSent: dateSent,
      dateProcessed: dateProcessed,
      transactionStatus: transactionStatus,
      paymentConfirmationUrl: paymentConfirmationUrl,
      isPaidIn: isPaidIn,
      bonus: bonus,
      bonusType: bonusType,
      bonusCode: bonusCode,
      exchangeRate: exchangeRate,
      statusDescription: statusDescription,
      receiverId: receiverId,
      receiver: receiver,
      payment: payment,
    );
  }

  TransactionData fromJson(Map<String, Object> json) {
    return TransactionData.fromJson(json);
  }
}

/// @nodoc
const $TransactionData = _$TransactionDataTearOff();

/// @nodoc
mixin _$TransactionData {
  num get customerId => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get senderEmail => throw _privateConstructorUsedError;
  num? get id => throw _privateConstructorUsedError;
  String? get transactionRefNumber => throw _privateConstructorUsedError;
  String? get transactionType => throw _privateConstructorUsedError;
  String? get sendingCountry => throw _privateConstructorUsedError;
  String? get receivingCountry => throw _privateConstructorUsedError;
  num? get amountToSend => throw _privateConstructorUsedError;
  num? get amountToCharge => throw _privateConstructorUsedError;
  num? get amountToReceive => throw _privateConstructorUsedError;
  num? get amountToReceiveNgn => throw _privateConstructorUsedError;
  num? get amountToReceiveUsd => throw _privateConstructorUsedError;
  String? get payInMethod => throw _privateConstructorUsedError;
  String? get paymentPurpose => throw _privateConstructorUsedError;
  String? get paymentDescription => throw _privateConstructorUsedError;
  DateTime? get dateSent => throw _privateConstructorUsedError;
  DateTime? get dateProcessed => throw _privateConstructorUsedError;
  String? get transactionStatus => throw _privateConstructorUsedError;
  String? get paymentConfirmationUrl => throw _privateConstructorUsedError;
  bool? get isPaidIn => throw _privateConstructorUsedError;
  num? get bonus => throw _privateConstructorUsedError;
  String? get bonusType => throw _privateConstructorUsedError;
  String? get bonusCode => throw _privateConstructorUsedError;
  num? get exchangeRate => throw _privateConstructorUsedError;
  String? get statusDescription => throw _privateConstructorUsedError;
  num? get receiverId => throw _privateConstructorUsedError;
  Receiver? get receiver => throw _privateConstructorUsedError;
  Payment? get payment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDataCopyWith<TransactionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDataCopyWith<$Res> {
  factory $TransactionDataCopyWith(
          TransactionData value, $Res Function(TransactionData) then) =
      _$TransactionDataCopyWithImpl<$Res>;
  $Res call(
      {num customerId,
      String? fullName,
      String? senderEmail,
      num? id,
      String? transactionRefNumber,
      String? transactionType,
      String? sendingCountry,
      String? receivingCountry,
      num? amountToSend,
      num? amountToCharge,
      num? amountToReceive,
      num? amountToReceiveNgn,
      num? amountToReceiveUsd,
      String? payInMethod,
      String? paymentPurpose,
      String? paymentDescription,
      DateTime? dateSent,
      DateTime? dateProcessed,
      String? transactionStatus,
      String? paymentConfirmationUrl,
      bool? isPaidIn,
      num? bonus,
      String? bonusType,
      String? bonusCode,
      num? exchangeRate,
      String? statusDescription,
      num? receiverId,
      Receiver? receiver,
      Payment? payment});

  $ReceiverCopyWith<$Res>? get receiver;
  $PaymentCopyWith<$Res>? get payment;
}

/// @nodoc
class _$TransactionDataCopyWithImpl<$Res>
    implements $TransactionDataCopyWith<$Res> {
  _$TransactionDataCopyWithImpl(this._value, this._then);

  final TransactionData _value;
  // ignore: unused_field
  final $Res Function(TransactionData) _then;

  @override
  $Res call({
    Object? customerId = freezed,
    Object? fullName = freezed,
    Object? senderEmail = freezed,
    Object? id = freezed,
    Object? transactionRefNumber = freezed,
    Object? transactionType = freezed,
    Object? sendingCountry = freezed,
    Object? receivingCountry = freezed,
    Object? amountToSend = freezed,
    Object? amountToCharge = freezed,
    Object? amountToReceive = freezed,
    Object? amountToReceiveNgn = freezed,
    Object? amountToReceiveUsd = freezed,
    Object? payInMethod = freezed,
    Object? paymentPurpose = freezed,
    Object? paymentDescription = freezed,
    Object? dateSent = freezed,
    Object? dateProcessed = freezed,
    Object? transactionStatus = freezed,
    Object? paymentConfirmationUrl = freezed,
    Object? isPaidIn = freezed,
    Object? bonus = freezed,
    Object? bonusType = freezed,
    Object? bonusCode = freezed,
    Object? exchangeRate = freezed,
    Object? statusDescription = freezed,
    Object? receiverId = freezed,
    Object? receiver = freezed,
    Object? payment = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as num,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderEmail: senderEmail == freezed
          ? _value.senderEmail
          : senderEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      transactionRefNumber: transactionRefNumber == freezed
          ? _value.transactionRefNumber
          : transactionRefNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      sendingCountry: sendingCountry == freezed
          ? _value.sendingCountry
          : sendingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      receivingCountry: receivingCountry == freezed
          ? _value.receivingCountry
          : receivingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      amountToSend: amountToSend == freezed
          ? _value.amountToSend
          : amountToSend // ignore: cast_nullable_to_non_nullable
              as num?,
      amountToCharge: amountToCharge == freezed
          ? _value.amountToCharge
          : amountToCharge // ignore: cast_nullable_to_non_nullable
              as num?,
      amountToReceive: amountToReceive == freezed
          ? _value.amountToReceive
          : amountToReceive // ignore: cast_nullable_to_non_nullable
              as num?,
      amountToReceiveNgn: amountToReceiveNgn == freezed
          ? _value.amountToReceiveNgn
          : amountToReceiveNgn // ignore: cast_nullable_to_non_nullable
              as num?,
      amountToReceiveUsd: amountToReceiveUsd == freezed
          ? _value.amountToReceiveUsd
          : amountToReceiveUsd // ignore: cast_nullable_to_non_nullable
              as num?,
      payInMethod: payInMethod == freezed
          ? _value.payInMethod
          : payInMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentPurpose: paymentPurpose == freezed
          ? _value.paymentPurpose
          : paymentPurpose // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDescription: paymentDescription == freezed
          ? _value.paymentDescription
          : paymentDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      dateSent: dateSent == freezed
          ? _value.dateSent
          : dateSent // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateProcessed: dateProcessed == freezed
          ? _value.dateProcessed
          : dateProcessed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionStatus: transactionStatus == freezed
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentConfirmationUrl: paymentConfirmationUrl == freezed
          ? _value.paymentConfirmationUrl
          : paymentConfirmationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaidIn: isPaidIn == freezed
          ? _value.isPaidIn
          : isPaidIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      bonus: bonus == freezed
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as num?,
      bonusType: bonusType == freezed
          ? _value.bonusType
          : bonusType // ignore: cast_nullable_to_non_nullable
              as String?,
      bonusCode: bonusCode == freezed
          ? _value.bonusCode
          : bonusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeRate: exchangeRate == freezed
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as num?,
      statusDescription: statusDescription == freezed
          ? _value.statusDescription
          : statusDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as num?,
      receiver: receiver == freezed
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as Receiver?,
      payment: payment == freezed
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment?,
    ));
  }

  @override
  $ReceiverCopyWith<$Res>? get receiver {
    if (_value.receiver == null) {
      return null;
    }

    return $ReceiverCopyWith<$Res>(_value.receiver!, (value) {
      return _then(_value.copyWith(receiver: value));
    });
  }

  @override
  $PaymentCopyWith<$Res>? get payment {
    if (_value.payment == null) {
      return null;
    }

    return $PaymentCopyWith<$Res>(_value.payment!, (value) {
      return _then(_value.copyWith(payment: value));
    });
  }
}

/// @nodoc
abstract class _$TransactionDataCopyWith<$Res>
    implements $TransactionDataCopyWith<$Res> {
  factory _$TransactionDataCopyWith(
          _TransactionData value, $Res Function(_TransactionData) then) =
      __$TransactionDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {num customerId,
      String? fullName,
      String? senderEmail,
      num? id,
      String? transactionRefNumber,
      String? transactionType,
      String? sendingCountry,
      String? receivingCountry,
      num? amountToSend,
      num? amountToCharge,
      num? amountToReceive,
      num? amountToReceiveNgn,
      num? amountToReceiveUsd,
      String? payInMethod,
      String? paymentPurpose,
      String? paymentDescription,
      DateTime? dateSent,
      DateTime? dateProcessed,
      String? transactionStatus,
      String? paymentConfirmationUrl,
      bool? isPaidIn,
      num? bonus,
      String? bonusType,
      String? bonusCode,
      num? exchangeRate,
      String? statusDescription,
      num? receiverId,
      Receiver? receiver,
      Payment? payment});

  @override
  $ReceiverCopyWith<$Res>? get receiver;
  @override
  $PaymentCopyWith<$Res>? get payment;
}

/// @nodoc
class __$TransactionDataCopyWithImpl<$Res>
    extends _$TransactionDataCopyWithImpl<$Res>
    implements _$TransactionDataCopyWith<$Res> {
  __$TransactionDataCopyWithImpl(
      _TransactionData _value, $Res Function(_TransactionData) _then)
      : super(_value, (v) => _then(v as _TransactionData));

  @override
  _TransactionData get _value => super._value as _TransactionData;

  @override
  $Res call({
    Object? customerId = freezed,
    Object? fullName = freezed,
    Object? senderEmail = freezed,
    Object? id = freezed,
    Object? transactionRefNumber = freezed,
    Object? transactionType = freezed,
    Object? sendingCountry = freezed,
    Object? receivingCountry = freezed,
    Object? amountToSend = freezed,
    Object? amountToCharge = freezed,
    Object? amountToReceive = freezed,
    Object? amountToReceiveNgn = freezed,
    Object? amountToReceiveUsd = freezed,
    Object? payInMethod = freezed,
    Object? paymentPurpose = freezed,
    Object? paymentDescription = freezed,
    Object? dateSent = freezed,
    Object? dateProcessed = freezed,
    Object? transactionStatus = freezed,
    Object? paymentConfirmationUrl = freezed,
    Object? isPaidIn = freezed,
    Object? bonus = freezed,
    Object? bonusType = freezed,
    Object? bonusCode = freezed,
    Object? exchangeRate = freezed,
    Object? statusDescription = freezed,
    Object? receiverId = freezed,
    Object? receiver = freezed,
    Object? payment = freezed,
  }) {
    return _then(_TransactionData(
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as num,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderEmail: senderEmail == freezed
          ? _value.senderEmail
          : senderEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      transactionRefNumber: transactionRefNumber == freezed
          ? _value.transactionRefNumber
          : transactionRefNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      sendingCountry: sendingCountry == freezed
          ? _value.sendingCountry
          : sendingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      receivingCountry: receivingCountry == freezed
          ? _value.receivingCountry
          : receivingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      amountToSend: amountToSend == freezed
          ? _value.amountToSend
          : amountToSend // ignore: cast_nullable_to_non_nullable
              as num?,
      amountToCharge: amountToCharge == freezed
          ? _value.amountToCharge
          : amountToCharge // ignore: cast_nullable_to_non_nullable
              as num?,
      amountToReceive: amountToReceive == freezed
          ? _value.amountToReceive
          : amountToReceive // ignore: cast_nullable_to_non_nullable
              as num?,
      amountToReceiveNgn: amountToReceiveNgn == freezed
          ? _value.amountToReceiveNgn
          : amountToReceiveNgn // ignore: cast_nullable_to_non_nullable
              as num?,
      amountToReceiveUsd: amountToReceiveUsd == freezed
          ? _value.amountToReceiveUsd
          : amountToReceiveUsd // ignore: cast_nullable_to_non_nullable
              as num?,
      payInMethod: payInMethod == freezed
          ? _value.payInMethod
          : payInMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentPurpose: paymentPurpose == freezed
          ? _value.paymentPurpose
          : paymentPurpose // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDescription: paymentDescription == freezed
          ? _value.paymentDescription
          : paymentDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      dateSent: dateSent == freezed
          ? _value.dateSent
          : dateSent // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateProcessed: dateProcessed == freezed
          ? _value.dateProcessed
          : dateProcessed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionStatus: transactionStatus == freezed
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentConfirmationUrl: paymentConfirmationUrl == freezed
          ? _value.paymentConfirmationUrl
          : paymentConfirmationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaidIn: isPaidIn == freezed
          ? _value.isPaidIn
          : isPaidIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      bonus: bonus == freezed
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as num?,
      bonusType: bonusType == freezed
          ? _value.bonusType
          : bonusType // ignore: cast_nullable_to_non_nullable
              as String?,
      bonusCode: bonusCode == freezed
          ? _value.bonusCode
          : bonusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeRate: exchangeRate == freezed
          ? _value.exchangeRate
          : exchangeRate // ignore: cast_nullable_to_non_nullable
              as num?,
      statusDescription: statusDescription == freezed
          ? _value.statusDescription
          : statusDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as num?,
      receiver: receiver == freezed
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as Receiver?,
      payment: payment == freezed
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionData implements _TransactionData {
  const _$_TransactionData(
      {required this.customerId,
      this.fullName,
      this.senderEmail,
      this.id,
      this.transactionRefNumber,
      this.transactionType,
      this.sendingCountry,
      this.receivingCountry,
      this.amountToSend,
      this.amountToCharge,
      this.amountToReceive,
      this.amountToReceiveNgn,
      this.amountToReceiveUsd,
      this.payInMethod,
      this.paymentPurpose,
      this.paymentDescription,
      this.dateSent,
      this.dateProcessed,
      this.transactionStatus,
      this.paymentConfirmationUrl,
      this.isPaidIn,
      this.bonus,
      this.bonusType,
      this.bonusCode,
      this.exchangeRate,
      this.statusDescription,
      this.receiverId,
      this.receiver,
      this.payment});

  factory _$_TransactionData.fromJson(Map<String, dynamic> json) =>
      _$_$_TransactionDataFromJson(json);

  @override
  final num customerId;
  @override
  final String? fullName;
  @override
  final String? senderEmail;
  @override
  final num? id;
  @override
  final String? transactionRefNumber;
  @override
  final String? transactionType;
  @override
  final String? sendingCountry;
  @override
  final String? receivingCountry;
  @override
  final num? amountToSend;
  @override
  final num? amountToCharge;
  @override
  final num? amountToReceive;
  @override
  final num? amountToReceiveNgn;
  @override
  final num? amountToReceiveUsd;
  @override
  final String? payInMethod;
  @override
  final String? paymentPurpose;
  @override
  final String? paymentDescription;
  @override
  final DateTime? dateSent;
  @override
  final DateTime? dateProcessed;
  @override
  final String? transactionStatus;
  @override
  final String? paymentConfirmationUrl;
  @override
  final bool? isPaidIn;
  @override
  final num? bonus;
  @override
  final String? bonusType;
  @override
  final String? bonusCode;
  @override
  final num? exchangeRate;
  @override
  final String? statusDescription;
  @override
  final num? receiverId;
  @override
  final Receiver? receiver;
  @override
  final Payment? payment;

  @override
  String toString() {
    return 'TransactionData(customerId: $customerId, fullName: $fullName, senderEmail: $senderEmail, id: $id, transactionRefNumber: $transactionRefNumber, transactionType: $transactionType, sendingCountry: $sendingCountry, receivingCountry: $receivingCountry, amountToSend: $amountToSend, amountToCharge: $amountToCharge, amountToReceive: $amountToReceive, amountToReceiveNgn: $amountToReceiveNgn, amountToReceiveUsd: $amountToReceiveUsd, payInMethod: $payInMethod, paymentPurpose: $paymentPurpose, paymentDescription: $paymentDescription, dateSent: $dateSent, dateProcessed: $dateProcessed, transactionStatus: $transactionStatus, paymentConfirmationUrl: $paymentConfirmationUrl, isPaidIn: $isPaidIn, bonus: $bonus, bonusType: $bonusType, bonusCode: $bonusCode, exchangeRate: $exchangeRate, statusDescription: $statusDescription, receiverId: $receiverId, receiver: $receiver, payment: $payment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionData &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.senderEmail, senderEmail) ||
                const DeepCollectionEquality()
                    .equals(other.senderEmail, senderEmail)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.transactionRefNumber, transactionRefNumber) ||
                const DeepCollectionEquality().equals(
                    other.transactionRefNumber, transactionRefNumber)) &&
            (identical(other.transactionType, transactionType) ||
                const DeepCollectionEquality()
                    .equals(other.transactionType, transactionType)) &&
            (identical(other.sendingCountry, sendingCountry) ||
                const DeepCollectionEquality()
                    .equals(other.sendingCountry, sendingCountry)) &&
            (identical(other.receivingCountry, receivingCountry) ||
                const DeepCollectionEquality()
                    .equals(other.receivingCountry, receivingCountry)) &&
            (identical(other.amountToSend, amountToSend) ||
                const DeepCollectionEquality()
                    .equals(other.amountToSend, amountToSend)) &&
            (identical(other.amountToCharge, amountToCharge) ||
                const DeepCollectionEquality()
                    .equals(other.amountToCharge, amountToCharge)) &&
            (identical(other.amountToReceive, amountToReceive) ||
                const DeepCollectionEquality()
                    .equals(other.amountToReceive, amountToReceive)) &&
            (identical(other.amountToReceiveNgn, amountToReceiveNgn) ||
                const DeepCollectionEquality()
                    .equals(other.amountToReceiveNgn, amountToReceiveNgn)) &&
            (identical(other.amountToReceiveUsd, amountToReceiveUsd) ||
                const DeepCollectionEquality()
                    .equals(other.amountToReceiveUsd, amountToReceiveUsd)) &&
            (identical(other.payInMethod, payInMethod) ||
                const DeepCollectionEquality()
                    .equals(other.payInMethod, payInMethod)) &&
            (identical(other.paymentPurpose, paymentPurpose) ||
                const DeepCollectionEquality()
                    .equals(other.paymentPurpose, paymentPurpose)) &&
            (identical(other.paymentDescription, paymentDescription) ||
                const DeepCollectionEquality()
                    .equals(other.paymentDescription, paymentDescription)) &&
            (identical(other.dateSent, dateSent) ||
                const DeepCollectionEquality()
                    .equals(other.dateSent, dateSent)) &&
            (identical(other.dateProcessed, dateProcessed) ||
                const DeepCollectionEquality()
                    .equals(other.dateProcessed, dateProcessed)) &&
            (identical(other.transactionStatus, transactionStatus) ||
                const DeepCollectionEquality()
                    .equals(other.transactionStatus, transactionStatus)) &&
            (identical(other.paymentConfirmationUrl, paymentConfirmationUrl) ||
                const DeepCollectionEquality().equals(
                    other.paymentConfirmationUrl, paymentConfirmationUrl)) &&
            (identical(other.isPaidIn, isPaidIn) ||
                const DeepCollectionEquality()
                    .equals(other.isPaidIn, isPaidIn)) &&
            (identical(other.bonus, bonus) ||
                const DeepCollectionEquality().equals(other.bonus, bonus)) &&
            (identical(other.bonusType, bonusType) || const DeepCollectionEquality().equals(other.bonusType, bonusType)) &&
            (identical(other.bonusCode, bonusCode) || const DeepCollectionEquality().equals(other.bonusCode, bonusCode)) &&
            (identical(other.exchangeRate, exchangeRate) || const DeepCollectionEquality().equals(other.exchangeRate, exchangeRate)) &&
            (identical(other.statusDescription, statusDescription) || const DeepCollectionEquality().equals(other.statusDescription, statusDescription)) &&
            (identical(other.receiverId, receiverId) || const DeepCollectionEquality().equals(other.receiverId, receiverId)) &&
            (identical(other.receiver, receiver) || const DeepCollectionEquality().equals(other.receiver, receiver)) &&
            (identical(other.payment, payment) || const DeepCollectionEquality().equals(other.payment, payment)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(senderEmail) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(transactionRefNumber) ^
      const DeepCollectionEquality().hash(transactionType) ^
      const DeepCollectionEquality().hash(sendingCountry) ^
      const DeepCollectionEquality().hash(receivingCountry) ^
      const DeepCollectionEquality().hash(amountToSend) ^
      const DeepCollectionEquality().hash(amountToCharge) ^
      const DeepCollectionEquality().hash(amountToReceive) ^
      const DeepCollectionEquality().hash(amountToReceiveNgn) ^
      const DeepCollectionEquality().hash(amountToReceiveUsd) ^
      const DeepCollectionEquality().hash(payInMethod) ^
      const DeepCollectionEquality().hash(paymentPurpose) ^
      const DeepCollectionEquality().hash(paymentDescription) ^
      const DeepCollectionEquality().hash(dateSent) ^
      const DeepCollectionEquality().hash(dateProcessed) ^
      const DeepCollectionEquality().hash(transactionStatus) ^
      const DeepCollectionEquality().hash(paymentConfirmationUrl) ^
      const DeepCollectionEquality().hash(isPaidIn) ^
      const DeepCollectionEquality().hash(bonus) ^
      const DeepCollectionEquality().hash(bonusType) ^
      const DeepCollectionEquality().hash(bonusCode) ^
      const DeepCollectionEquality().hash(exchangeRate) ^
      const DeepCollectionEquality().hash(statusDescription) ^
      const DeepCollectionEquality().hash(receiverId) ^
      const DeepCollectionEquality().hash(receiver) ^
      const DeepCollectionEquality().hash(payment);

  @JsonKey(ignore: true)
  @override
  _$TransactionDataCopyWith<_TransactionData> get copyWith =>
      __$TransactionDataCopyWithImpl<_TransactionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransactionDataToJson(this);
  }
}

abstract class _TransactionData implements TransactionData {
  const factory _TransactionData(
      {required num customerId,
      String? fullName,
      String? senderEmail,
      num? id,
      String? transactionRefNumber,
      String? transactionType,
      String? sendingCountry,
      String? receivingCountry,
      num? amountToSend,
      num? amountToCharge,
      num? amountToReceive,
      num? amountToReceiveNgn,
      num? amountToReceiveUsd,
      String? payInMethod,
      String? paymentPurpose,
      String? paymentDescription,
      DateTime? dateSent,
      DateTime? dateProcessed,
      String? transactionStatus,
      String? paymentConfirmationUrl,
      bool? isPaidIn,
      num? bonus,
      String? bonusType,
      String? bonusCode,
      num? exchangeRate,
      String? statusDescription,
      num? receiverId,
      Receiver? receiver,
      Payment? payment}) = _$_TransactionData;

  factory _TransactionData.fromJson(Map<String, dynamic> json) =
      _$_TransactionData.fromJson;

  @override
  num get customerId => throw _privateConstructorUsedError;
  @override
  String? get fullName => throw _privateConstructorUsedError;
  @override
  String? get senderEmail => throw _privateConstructorUsedError;
  @override
  num? get id => throw _privateConstructorUsedError;
  @override
  String? get transactionRefNumber => throw _privateConstructorUsedError;
  @override
  String? get transactionType => throw _privateConstructorUsedError;
  @override
  String? get sendingCountry => throw _privateConstructorUsedError;
  @override
  String? get receivingCountry => throw _privateConstructorUsedError;
  @override
  num? get amountToSend => throw _privateConstructorUsedError;
  @override
  num? get amountToCharge => throw _privateConstructorUsedError;
  @override
  num? get amountToReceive => throw _privateConstructorUsedError;
  @override
  num? get amountToReceiveNgn => throw _privateConstructorUsedError;
  @override
  num? get amountToReceiveUsd => throw _privateConstructorUsedError;
  @override
  String? get payInMethod => throw _privateConstructorUsedError;
  @override
  String? get paymentPurpose => throw _privateConstructorUsedError;
  @override
  String? get paymentDescription => throw _privateConstructorUsedError;
  @override
  DateTime? get dateSent => throw _privateConstructorUsedError;
  @override
  DateTime? get dateProcessed => throw _privateConstructorUsedError;
  @override
  String? get transactionStatus => throw _privateConstructorUsedError;
  @override
  String? get paymentConfirmationUrl => throw _privateConstructorUsedError;
  @override
  bool? get isPaidIn => throw _privateConstructorUsedError;
  @override
  num? get bonus => throw _privateConstructorUsedError;
  @override
  String? get bonusType => throw _privateConstructorUsedError;
  @override
  String? get bonusCode => throw _privateConstructorUsedError;
  @override
  num? get exchangeRate => throw _privateConstructorUsedError;
  @override
  String? get statusDescription => throw _privateConstructorUsedError;
  @override
  num? get receiverId => throw _privateConstructorUsedError;
  @override
  Receiver? get receiver => throw _privateConstructorUsedError;
  @override
  Payment? get payment => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransactionDataCopyWith<_TransactionData> get copyWith =>
      throw _privateConstructorUsedError;
}

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
class _$PaymentTearOff {
  const _$PaymentTearOff();

  _Payment call(
      {required num transactionId,
      num? paymentMethod,
      String? paymentToken,
      String? paymentReferenceNo,
      String? paymentLinkUrl}) {
    return _Payment(
      transactionId: transactionId,
      paymentMethod: paymentMethod,
      paymentToken: paymentToken,
      paymentReferenceNo: paymentReferenceNo,
      paymentLinkUrl: paymentLinkUrl,
    );
  }

  Payment fromJson(Map<String, Object> json) {
    return Payment.fromJson(json);
  }
}

/// @nodoc
const $Payment = _$PaymentTearOff();

/// @nodoc
mixin _$Payment {
  num get transactionId => throw _privateConstructorUsedError;
  num? get paymentMethod => throw _privateConstructorUsedError;
  String? get paymentToken => throw _privateConstructorUsedError;
  String? get paymentReferenceNo => throw _privateConstructorUsedError;
  String? get paymentLinkUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res>;
  $Res call(
      {num transactionId,
      num? paymentMethod,
      String? paymentToken,
      String? paymentReferenceNo,
      String? paymentLinkUrl});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res> implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  final Payment _value;
  // ignore: unused_field
  final $Res Function(Payment) _then;

  @override
  $Res call({
    Object? transactionId = freezed,
    Object? paymentMethod = freezed,
    Object? paymentToken = freezed,
    Object? paymentReferenceNo = freezed,
    Object? paymentLinkUrl = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: transactionId == freezed
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as num,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as num?,
      paymentToken: paymentToken == freezed
          ? _value.paymentToken
          : paymentToken // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReferenceNo: paymentReferenceNo == freezed
          ? _value.paymentReferenceNo
          : paymentReferenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentLinkUrl: paymentLinkUrl == freezed
          ? _value.paymentLinkUrl
          : paymentLinkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) then) =
      __$PaymentCopyWithImpl<$Res>;
  @override
  $Res call(
      {num transactionId,
      num? paymentMethod,
      String? paymentToken,
      String? paymentReferenceNo,
      String? paymentLinkUrl});
}

/// @nodoc
class __$PaymentCopyWithImpl<$Res> extends _$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(_Payment _value, $Res Function(_Payment) _then)
      : super(_value, (v) => _then(v as _Payment));

  @override
  _Payment get _value => super._value as _Payment;

  @override
  $Res call({
    Object? transactionId = freezed,
    Object? paymentMethod = freezed,
    Object? paymentToken = freezed,
    Object? paymentReferenceNo = freezed,
    Object? paymentLinkUrl = freezed,
  }) {
    return _then(_Payment(
      transactionId: transactionId == freezed
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as num,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as num?,
      paymentToken: paymentToken == freezed
          ? _value.paymentToken
          : paymentToken // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReferenceNo: paymentReferenceNo == freezed
          ? _value.paymentReferenceNo
          : paymentReferenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentLinkUrl: paymentLinkUrl == freezed
          ? _value.paymentLinkUrl
          : paymentLinkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Payment implements _Payment {
  const _$_Payment(
      {required this.transactionId,
      this.paymentMethod,
      this.paymentToken,
      this.paymentReferenceNo,
      this.paymentLinkUrl});

  factory _$_Payment.fromJson(Map<String, dynamic> json) =>
      _$_$_PaymentFromJson(json);

  @override
  final num transactionId;
  @override
  final num? paymentMethod;
  @override
  final String? paymentToken;
  @override
  final String? paymentReferenceNo;
  @override
  final String? paymentLinkUrl;

  @override
  String toString() {
    return 'Payment(transactionId: $transactionId, paymentMethod: $paymentMethod, paymentToken: $paymentToken, paymentReferenceNo: $paymentReferenceNo, paymentLinkUrl: $paymentLinkUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Payment &&
            (identical(other.transactionId, transactionId) ||
                const DeepCollectionEquality()
                    .equals(other.transactionId, transactionId)) &&
            (identical(other.paymentMethod, paymentMethod) ||
                const DeepCollectionEquality()
                    .equals(other.paymentMethod, paymentMethod)) &&
            (identical(other.paymentToken, paymentToken) ||
                const DeepCollectionEquality()
                    .equals(other.paymentToken, paymentToken)) &&
            (identical(other.paymentReferenceNo, paymentReferenceNo) ||
                const DeepCollectionEquality()
                    .equals(other.paymentReferenceNo, paymentReferenceNo)) &&
            (identical(other.paymentLinkUrl, paymentLinkUrl) ||
                const DeepCollectionEquality()
                    .equals(other.paymentLinkUrl, paymentLinkUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(transactionId) ^
      const DeepCollectionEquality().hash(paymentMethod) ^
      const DeepCollectionEquality().hash(paymentToken) ^
      const DeepCollectionEquality().hash(paymentReferenceNo) ^
      const DeepCollectionEquality().hash(paymentLinkUrl);

  @JsonKey(ignore: true)
  @override
  _$PaymentCopyWith<_Payment> get copyWith =>
      __$PaymentCopyWithImpl<_Payment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaymentToJson(this);
  }
}

abstract class _Payment implements Payment {
  const factory _Payment(
      {required num transactionId,
      num? paymentMethod,
      String? paymentToken,
      String? paymentReferenceNo,
      String? paymentLinkUrl}) = _$_Payment;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$_Payment.fromJson;

  @override
  num get transactionId => throw _privateConstructorUsedError;
  @override
  num? get paymentMethod => throw _privateConstructorUsedError;
  @override
  String? get paymentToken => throw _privateConstructorUsedError;
  @override
  String? get paymentReferenceNo => throw _privateConstructorUsedError;
  @override
  String? get paymentLinkUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaymentCopyWith<_Payment> get copyWith =>
      throw _privateConstructorUsedError;
}

Receiver _$ReceiverFromJson(Map<String, dynamic> json) {
  return _Receiver.fromJson(json);
}

/// @nodoc
class _$ReceiverTearOff {
  const _$ReceiverTearOff();

  _Receiver call(
      {required num customerId,
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
    return _Receiver(
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

  Receiver fromJson(Map<String, Object> json) {
    return Receiver.fromJson(json);
  }
}

/// @nodoc
const $Receiver = _$ReceiverTearOff();

/// @nodoc
mixin _$Receiver {
  num get customerId => throw _privateConstructorUsedError;
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
  $ReceiverCopyWith<Receiver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiverCopyWith<$Res> {
  factory $ReceiverCopyWith(Receiver value, $Res Function(Receiver) then) =
      _$ReceiverCopyWithImpl<$Res>;
  $Res call(
      {num customerId,
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
class _$ReceiverCopyWithImpl<$Res> implements $ReceiverCopyWith<$Res> {
  _$ReceiverCopyWithImpl(this._value, this._then);

  final Receiver _value;
  // ignore: unused_field
  final $Res Function(Receiver) _then;

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
              as num,
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
abstract class _$ReceiverCopyWith<$Res> implements $ReceiverCopyWith<$Res> {
  factory _$ReceiverCopyWith(_Receiver value, $Res Function(_Receiver) then) =
      __$ReceiverCopyWithImpl<$Res>;
  @override
  $Res call(
      {num customerId,
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
class __$ReceiverCopyWithImpl<$Res> extends _$ReceiverCopyWithImpl<$Res>
    implements _$ReceiverCopyWith<$Res> {
  __$ReceiverCopyWithImpl(_Receiver _value, $Res Function(_Receiver) _then)
      : super(_value, (v) => _then(v as _Receiver));

  @override
  _Receiver get _value => super._value as _Receiver;

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
    return _then(_Receiver(
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as num,
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
class _$_Receiver implements _Receiver {
  const _$_Receiver(
      {required this.customerId,
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

  factory _$_Receiver.fromJson(Map<String, dynamic> json) =>
      _$_$_ReceiverFromJson(json);

  @override
  final num customerId;
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
    return 'Receiver(customerId: $customerId, country: $country, bankName: $bankName, bankState: $bankState, bankPostalCode: $bankPostalCode, bankCity: $bankCity, bankAddress: $bankAddress, accountCurrency: $accountCurrency, accountNumber: $accountNumber, accountName: $accountName, accountSWiftCode: $accountSWiftCode, accountBsbCode: $accountBsbCode, corresBankCountry: $corresBankCountry, corresBankName: $corresBankName, corresBankIban: $corresBankIban)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Receiver &&
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
                    .equals(other.corresBankIban, corresBankIban)));
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
  _$ReceiverCopyWith<_Receiver> get copyWith =>
      __$ReceiverCopyWithImpl<_Receiver>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReceiverToJson(this);
  }
}

abstract class _Receiver implements Receiver {
  const factory _Receiver(
      {required num customerId,
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
      String? corresBankIban}) = _$_Receiver;

  factory _Receiver.fromJson(Map<String, dynamic> json) = _$_Receiver.fromJson;

  @override
  num get customerId => throw _privateConstructorUsedError;
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
  _$ReceiverCopyWith<_Receiver> get copyWith =>
      throw _privateConstructorUsedError;
}
