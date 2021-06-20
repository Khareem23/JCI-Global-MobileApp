// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankAccountModel _$_$_BankAccountModelFromJson(Map<String, dynamic> json) {
  return _$_BankAccountModel(
    status: json['status'] as String?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => BankAccountData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_BankAccountModelToJson(
        _$_BankAccountModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_BankAccountData _$_$_BankAccountDataFromJson(Map<String, dynamic> json) {
  return _$_BankAccountData(
    id: json['id'] as int,
    countryCode: json['countryCode'] as String?,
    country: json['country'] as String?,
    bankName: json['bankName'] as String?,
    bankSwiftCode: json['bankSwiftCode'] as String?,
    bankAccountNumber: json['bankAccountNumber'] as String?,
    accountName: json['accountName'] as String?,
  );
}

Map<String, dynamic> _$_$_BankAccountDataToJson(_$_BankAccountData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryCode': instance.countryCode,
      'country': instance.country,
      'bankName': instance.bankName,
      'bankSwiftCode': instance.bankSwiftCode,
      'bankAccountNumber': instance.bankAccountNumber,
      'accountName': instance.accountName,
    };
