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
    RateData? data,
  }) = _RateModel;

  factory RateModel.fromJson(Map<String, dynamic> json) =>
      _$RateModelFromJson(json);
}

@freezed
abstract class RateData with _$RateData {
  const factory RateData({
    required num amountToSend,
    required num totalAmountToCharge,
    required double amountToReceive,
    @Default(0) dynamic amountToReceiveNgaUsd,
    required double rate,
  }) = _RateData;

  factory RateData.fromJson(Map<String, dynamic> json) =>
      _$RateDataFromJson(json);
}
