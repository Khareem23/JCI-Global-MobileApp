// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryRes _$_$_CountryResFromJson(Map<String, dynamic> json) {
  return _$_CountryRes(
    status: json['status'] as String?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => CountryData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CountryResToJson(_$_CountryRes instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_CountryData _$_$_CountryDataFromJson(Map<String, dynamic> json) {
  return _$_CountryData(
    country: json['country'] as String?,
    callingCode: json['callingCode'] as String?,
    alpha3Code: json['alpha3Code'] as String?,
    alpha2Code: json['alpha2Code'] as String?,
    currency: json['currency'] as String?,
    flag: json['flag'] as String?,
  );
}

Map<String, dynamic> _$_$_CountryDataToJson(_$_CountryData instance) =>
    <String, dynamic>{
      'country': instance.country,
      'callingCode': instance.callingCode,
      'alpha3Code': instance.alpha3Code,
      'alpha2Code': instance.alpha2Code,
      'currency': instance.currency,
      'flag': instance.flag,
    };
