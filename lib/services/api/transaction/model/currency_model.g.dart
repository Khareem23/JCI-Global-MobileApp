// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyModel _$_$_CurrencyModelFromJson(Map<String, dynamic> json) {
  return _$_CurrencyModel(
    status: json['status'] as String,
    message: json['message'] as String,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CurrencyModelToJson(_$_CurrencyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_Datum _$_$_DatumFromJson(Map<String, dynamic> json) {
  return _$_Datum(
    country: json['country'] as String,
    callingCode: json['callingCode'] as String,
    alpha3Code: json['alpha3Code'] as String,
    alpha2Code: json['alpha2Code'] as String,
    currency: json['currency'] as String,
    flag: json['flag'] as String,
  );
}

Map<String, dynamic> _$_$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'country': instance.country,
      'callingCode': instance.callingCode,
      'alpha3Code': instance.alpha3Code,
      'alpha2Code': instance.alpha2Code,
      'currency': instance.currency,
      'flag': instance.flag,
    };
