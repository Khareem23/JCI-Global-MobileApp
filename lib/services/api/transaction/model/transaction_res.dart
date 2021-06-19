// To parse this JSON data, do
//
//     final transactionRes = transactionResFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'transaction_res.freezed.dart';
part 'transaction_res.g.dart';

TransactionRes transactionResFromJson(Map<String, dynamic> str) =>
    TransactionRes.fromJson(str);

String transactionResToJson(TransactionRes data) => json.encode(data.toJson());

@freezed
abstract class TransactionRes with _$TransactionRes {
  const factory TransactionRes({
    String? status,
    String? message,
    TransactionData? data,
  }) = _TransactionRes;

  factory TransactionRes.fromJson(Map<String, dynamic> json) =>
      _$TransactionResFromJson(json);
}

@freezed
abstract class TransactionData with _$TransactionData {
  const factory TransactionData({
    required num customerId,
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
    Payment? payment,
  }) = _TransactionData;

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      _$TransactionDataFromJson(json);
}

@freezed
abstract class Payment with _$Payment {
  const factory Payment({
    required num transactionId,
    num? paymentMethod,
    String? paymentToken,
    String? paymentReferenceNo,
    String? paymentLinkUrl,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

@freezed
abstract class Receiver with _$Receiver {
  const factory Receiver({
    required num customerId,
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
    String? corresBankIban,
  }) = _Receiver;

  factory Receiver.fromJson(Map<String, dynamic> json) =>
      _$ReceiverFromJson(json);
}
