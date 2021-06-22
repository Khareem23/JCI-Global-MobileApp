// To parse this JSON data, do
//
//     final beneficiaryModel = beneficiaryModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'beneficiary_model.freezed.dart';
part 'beneficiary_model.g.dart';

BeneficiaryModel beneficiaryModelFromJson(Map<String, dynamic> str) =>
    BeneficiaryModel.fromJson(str);

String beneficiaryModelToJson(BeneficiaryModel data) =>
    json.encode(data.toJson());

@freezed
abstract class BeneficiaryModel with _$BeneficiaryModel {
  const factory BeneficiaryModel({
    String? status,
    String? message,
    List<BeneficiaryData>? data,
  }) = _BeneficiaryModel;

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryModelFromJson(json);
}

@freezed
abstract class BeneficiaryData with _$BeneficiaryData {
  const factory BeneficiaryData({
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
    String? corresBankIban,
  }) = _BeneficiaryData;

  factory BeneficiaryData.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryDataFromJson(json);
}
