// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BeneficiaryModel _$_$_BeneficiaryModelFromJson(Map<String, dynamic> json) {
  return _$_BeneficiaryModel(
    status: json['status'] as String?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => BeneficiaryData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_BeneficiaryModelToJson(
        _$_BeneficiaryModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_BeneficiaryData _$_$_BeneficiaryDataFromJson(Map<String, dynamic> json) {
  return _$_BeneficiaryData(
    customerId: json['customerId'] as int,
    country: json['country'] as String?,
    bankName: json['bankName'] as String?,
    bankState: json['bankState'] as String?,
    bankPostalCode: json['bankPostalCode'] as String?,
    bankCity: json['bankCity'] as String?,
    bankAddress: json['bankAddress'] as String?,
    accountCurrency: json['accountCurrency'] as String?,
    accountNumber: json['accountNumber'] as String?,
    accountName: json['accountName'] as String?,
    accountSWiftCode: json['accountSWiftCode'] as String?,
    accountBsbCode: json['accountBsbCode'] as String?,
    corresBankCountry: json['corresBankCountry'] as String?,
    corresBankName: json['corresBankName'] as String?,
    corresBankIban: json['corresBankIban'] as String?,
  );
}

Map<String, dynamic> _$_$_BeneficiaryDataToJson(_$_BeneficiaryData instance) =>
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
      'accountSWiftCode': instance.accountSWiftCode,
      'accountBsbCode': instance.accountBsbCode,
      'corresBankCountry': instance.corresBankCountry,
      'corresBankName': instance.corresBankName,
      'corresBankIban': instance.corresBankIban,
    };
