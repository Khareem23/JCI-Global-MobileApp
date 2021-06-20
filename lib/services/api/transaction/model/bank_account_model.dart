// To parse this JSON data, do
//
//     final bankAccountModel = bankAccountModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'bank_account_model.freezed.dart';
part 'bank_account_model.g.dart';

BankAccountModel bankAccountModelFromJson(Map<String, dynamic> str) =>
    BankAccountModel.fromJson(str);

String bankAccountModelToJson(BankAccountModel data) =>
    json.encode(data.toJson());

@freezed
class BankAccountModel with _$BankAccountModel {
  const factory BankAccountModel({
    String? status,
    String? message,
    List<BankAccountData>? data,
  }) = _BankAccountModel;

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountModelFromJson(json);
}

@freezed
class BankAccountData with _$BankAccountData {
  const factory BankAccountData({
    required int id,
    String? countryCode,
    String? country,
    String? bankName,
    String? bankSwiftCode,
    String? bankAccountNumber,
    String? accountName,
  }) = _BankAccountData;

  factory BankAccountData.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDataFromJson(json);
}
