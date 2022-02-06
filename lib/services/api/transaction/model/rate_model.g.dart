// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RateModel _$_$_RateModelFromJson(Map<String, dynamic> json) {
  return _$_RateModel(
    status: json['status'] as String,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : RateData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_RateModelToJson(_$_RateModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_RateData _$_$_RateDataFromJson(Map<String, dynamic> json) {
  return _$_RateData(
    amountToSend: json['amountToSend'] as num,
    totalAmountToCharge: json['totalAmountToCharge'] as num,
    amountToReceiveLocal: (json['amountToReceive_Local'] as num).toDouble(),
    amountToReceiveUSD: json['amountToReceive_USD'] ?? 0,
    rate: (json['rate'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_RateDataToJson(_$_RateData instance) =>
    <String, dynamic>{
      'amountToSend': instance.amountToSend,
      'totalAmountToCharge': instance.totalAmountToCharge,
      'amountToReceive_Local': instance.amountToReceiveLocal,
      'amountToReceive_USD': instance.amountToReceiveUSD,
      'rate': instance.rate,
    };
