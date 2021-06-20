// To parse this JSON data, do
//
//     final createBeneficiaryModel = createBeneficiaryModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_beneficiary_model.freezed.dart';
part 'create_beneficiary_model.g.dart';

CreateBeneficiaryModel createBeneficiaryModelFromJson(String str) =>
    CreateBeneficiaryModel.fromJson(json.decode(str));

String createBeneficiaryModelToJson(CreateBeneficiaryModel data) =>
    json.encode(data.toJson());

@freezed
class CreateBeneficiaryModel with _$CreateBeneficiaryModel {
  const factory CreateBeneficiaryModel({
    int? customerId,
    required String country,
    required String bankName,
    required String bankState,
    required String bankPostalCode,
    required String bankCity,
    required String bankAddress,
    required String accountCurrency,
    required String accountNumber,
    required String accountName,
    String? accountSWiftCode,
    String? accountBsbCode,
    String? corresBankCountry,
    String? corresBankName,
    String? corresBankIban,
  }) = _CreateBeneficiaryModel;

  factory CreateBeneficiaryModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBeneficiaryModelFromJson(json);
}
