// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_beneficiary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateBeneficiaryModel _$_$_CreateBeneficiaryModelFromJson(
    Map<String, dynamic> json) {
  return _$_CreateBeneficiaryModel(
    customerId: json['customerId'] as int?,
    country: json['country'] as String,
    bankName: json['bankName'] as String,
    bankState: json['bankState'] as String,
    bankPostalCode: json['bankPostalCode'] as String,
    bankCity: json['bankCity'] as String,
    bankAddress: json['bankAddress'] as String,
    accountCurrency: json['accountCurrency'] as String,
    accountNumber: json['accountNumber'] as String,
    accountName: json['accountName'] as String,
    beneficiaryAddress: json['beneficiaryAddress'] as String,
    accountSWiftCode: json['accountSWiftCode'] as String?,
    accountBsbCode: json['accountBsbCode'] as String?,
    corresBankCountry: json['corresBankCountry'] as String?,
    corresBankName: json['corresBankName'] as String?,
    corresBankIban: json['corresBankIban'] as String?,
    corresBankAddress: json['corresBankAddress'] as String?,
  );
}

Map<String, dynamic> _$_$_CreateBeneficiaryModelToJson(
        _$_CreateBeneficiaryModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'country': instance.country,
      'bankName': instance.bankName,
      'bankState': instance.bankState,
      'bankPostalCode': instance.bankPostalCode,
      'bankCity': instance.bankCity,
      'bankAddress': instance.bankAddress,
      'accountCurrency': instance.accountCurrency,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'beneficiaryAddress': instance.beneficiaryAddress,
      'accountSWiftCode': instance.accountSWiftCode,
      'accountBsbCode': instance.accountBsbCode,
      'corresBankCountry': instance.corresBankCountry,
      'corresBankName': instance.corresBankName,
      'corresBankIban': instance.corresBankIban,
      'corresBankAddress': instance.corresBankAddress,
    };
