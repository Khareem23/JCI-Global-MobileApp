// To parse this JSON data, do
//
//     final rateModel = rateModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'rate_model.freezed.dart';
part 'rate_model.g.dart';

RateModel rateModelFromJson(Map<String, dynamic> str) =>
    RateModel.fromJson(str);

String rateModelToJson(RateModel data) => json.encode(data.toJson());

@freezed
abstract class RateModel with _$RateModel {
  const factory RateModel({
    required String status,
    required String message,
    List<Datum>? data,
  }) = _RateModel;

  factory RateModel.fromJson(Map<String, dynamic> json) =>
      _$RateModelFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
  const factory Datum({
    required int id,
    String? currencyDesc,
    int? rateType,
    String? sendCurrencyCode,
    String? receiveCurrencyCode,
    bool? isUsdDisplay,
    bool? isActive,
    double? amount,
    double? amountNgaUsd,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
