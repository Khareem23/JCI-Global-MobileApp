// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RateModel _$_$_RateModelFromJson(Map<String, dynamic> json) {
  return _$_RateModel(
    status: json['status'] as String,
    message: json['message'] as String,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_RateModelToJson(_$_RateModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_Datum _$_$_DatumFromJson(Map<String, dynamic> json) {
  return _$_Datum(
    id: json['id'] as int,
    currencyDesc: json['currencyDesc'] as String?,
    rateType: json['rateType'] as int?,
    sendCurrencyCode: json['sendCurrencyCode'] as String?,
    receiveCurrencyCode: json['receiveCurrencyCode'] as String?,
    isUsdDisplay: json['isUsdDisplay'] as bool?,
    isActive: json['isActive'] as bool?,
    amount: (json['amount'] as num?)?.toDouble(),
    amountNgaUsd: (json['amountNgaUsd'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'id': instance.id,
      'currencyDesc': instance.currencyDesc,
      'rateType': instance.rateType,
      'sendCurrencyCode': instance.sendCurrencyCode,
      'receiveCurrencyCode': instance.receiveCurrencyCode,
      'isUsdDisplay': instance.isUsdDisplay,
      'isActive': instance.isActive,
      'amount': instance.amount,
      'amountNgaUsd': instance.amountNgaUsd,
    };
