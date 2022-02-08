// To parse this JSON data, do
//
//     final createTransactionModel = createTransactionModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_transaction_model.freezed.dart';

part 'create_transaction_model.g.dart';

CreateTransactionModel createTransactionModelFromJson(String str) =>
    CreateTransactionModel.fromJson(json.decode(str));

String createTransactionModelToJson(CreateTransactionModel data) =>
    json.encode(data.toJson());

@freezed
abstract class CreateTransactionModel with _$CreateTransactionModel {
  const factory CreateTransactionModel({
    num? customerId,
    required num amountToSend,
    required num exchangeRate,
    required String paymentPurpose,
    required String paymentDescription,
    required String sendingCountry,
    required String receivingCountry,
    required num amountToReceive,
    required num amountToReceiveNgaUsd,
    String? bonusCode,
  }) = _CreateTransactionModel;

  factory CreateTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionModelFromJson(json);
}
