// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

CurrencyModel currencyModelFromJson(Map<String, dynamic> str) =>
    CurrencyModel.fromJson(str);

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

@freezed
abstract class CurrencyModel with _$CurrencyModel {
  const factory CurrencyModel({
    required String status,
    required String message,
    List<Datum>? data,
  }) = _CurrencyModel;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
  const factory Datum({
    required String country,
    required String callingCode,
    required String alpha3Code,
    required String alpha2Code,
    required String currency,
    required String flag,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
