// To parse this JSON data, do
//
//     final countryRes = countryResFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'country_res.freezed.dart';
part 'country_res.g.dart';

CountryRes countryResFromJson(Map<String, dynamic> str) =>
    CountryRes.fromJson(str);

String countryResToJson(CountryRes data) => json.encode(data.toJson());

@freezed
abstract class CountryRes with _$CountryRes {
  const factory CountryRes({
    String? status,
    String? message,
    List<CountryData>? data,
  }) = _CountryRes;

  factory CountryRes.fromJson(Map<String, dynamic> json) =>
      _$CountryResFromJson(json);
}

@freezed
abstract class CountryData with _$CountryData {
  const factory CountryData({
    String? country,
    String? callingCode,
    String? alpha3Code,
    String? alpha2Code,
    String? currency,
    String? flag,
  }) = _CountryData;

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);
}
