// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateTransactionModel _$_$_CreateTransactionModelFromJson(
    Map<String, dynamic> json) {
  return _$_CreateTransactionModel(
    customerId: json['customerId'] as num?,
    amountToSend: json['amountToSend'] as num,
    exchangeRate: json['exchangeRate'] as num,
    paymentPurpose: json['paymentPurpose'] as String,
    paymentDescription: json['paymentDescription'] as String,
    sendingCountry: json['sendingCountry'] as String,
    receivingCountry: json['receivingCountry'] as String,
    amountToReceive: json['amountToReceive'] as num,
    amountToReceiveNgaUsd: json['amountToReceiveNgaUsd'] as num,
    bonusCode: json['bonusCode'] as String?,
  );
}

Map<String, dynamic> _$_$_CreateTransactionModelToJson(
        _$_CreateTransactionModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'amountToSend': instance.amountToSend,
      'exchangeRate': instance.exchangeRate,
      'paymentPurpose': instance.paymentPurpose,
      'paymentDescription': instance.paymentDescription,
      'sendingCountry': instance.sendingCountry,
      'receivingCountry': instance.receivingCountry,
      'amountToReceive': instance.amountToReceive,
      'amountToReceiveNgaUsd': instance.amountToReceiveNgaUsd,
      'bonusCode': instance.bonusCode,
    };
