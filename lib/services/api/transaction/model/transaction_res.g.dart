// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionRes _$_$_TransactionResFromJson(Map<String, dynamic> json) {
  return _$_TransactionRes(
    status: json['status'] as String?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : TransactionData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_TransactionResToJson(_$_TransactionRes instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_TransactionData _$_$_TransactionDataFromJson(Map<String, dynamic> json) {
  return _$_TransactionData(
    customerId: json['customerId'] as num,
    fullName: json['fullName'] as String?,
    senderEmail: json['senderEmail'] as String?,
    id: json['id'] as num?,
    transactionRefNumber: json['transactionRefNumber'] as String?,
    transactionType: json['transactionType'] as String?,
    sendingCountry: json['sendingCountry'] as String?,
    receivingCountry: json['receivingCountry'] as String?,
    amountToSend: json['amountToSend'] as num?,
    amountToCharge: json['amountToCharge'] as num?,
    amountToReceive: json['amountToReceive_Local'] as num?,
    amountToReceiveNgn: json['amountToReceiveNgn'] as num?,
    amountToReceiveUsd: json['amountToReceiveUsd'] as num?,
    payInMethod: json['payInMethod'] as String?,
    paymentPurpose: json['paymentPurpose'] as String?,
    paymentDescription: json['paymentDescription'] as String?,
    dateSent: json['dateSent'] == null
        ? null
        : DateTime.parse(json['dateSent'] as String),
    dateProcessed: json['dateProcessed'] == null
        ? null
        : DateTime.parse(json['dateProcessed'] as String),
    transactionStatus: json['transactionStatus'] as String?,
    paymentConfirmationUrl: json['paymentConfirmationUrl'] as String?,
    isPaidIn: json['isPaidIn'] as bool?,
    bonus: json['bonus'] as num?,
    bonusType: json['bonusType'] as String?,
    bonusCode: json['bonusCode'] as String?,
    exchangeRate: json['exchangeRate'] as num?,
    statusDescription: json['statusDescription'] as String?,
    receiverId: json['receiverId'] as num?,
    receiver: json['receiver'] == null
        ? null
        : Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
    payment: json['payment'] == null
        ? null
        : Payment.fromJson(json['payment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_TransactionDataToJson(_$_TransactionData instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'fullName': instance.fullName,
      'senderEmail': instance.senderEmail,
      'id': instance.id,
      'transactionRefNumber': instance.transactionRefNumber,
      'transactionType': instance.transactionType,
      'sendingCountry': instance.sendingCountry,
      'receivingCountry': instance.receivingCountry,
      'amountToSend': instance.amountToSend,
      'amountToCharge': instance.amountToCharge,
      'amountToReceive': instance.amountToReceive,
      'amountToReceiveNgn': instance.amountToReceiveNgn,
      'amountToReceiveUsd': instance.amountToReceiveUsd,
      'payInMethod': instance.payInMethod,
      'paymentPurpose': instance.paymentPurpose,
      'paymentDescription': instance.paymentDescription,
      'dateSent': instance.dateSent?.toIso8601String(),
      'dateProcessed': instance.dateProcessed?.toIso8601String(),
      'transactionStatus': instance.transactionStatus,
      'paymentConfirmationUrl': instance.paymentConfirmationUrl,
      'isPaidIn': instance.isPaidIn,
      'bonus': instance.bonus,
      'bonusType': instance.bonusType,
      'bonusCode': instance.bonusCode,
      'exchangeRate': instance.exchangeRate,
      'statusDescription': instance.statusDescription,
      'receiverId': instance.receiverId,
      'receiver': instance.receiver,
      'payment': instance.payment,
    };

_$_Payment _$_$_PaymentFromJson(Map<String, dynamic> json) {
  return _$_Payment(
    transactionId: json['transactionId'] as num,
    paymentMethod: json['paymentMethod'] as num?,
    paymentToken: json['paymentToken'] as String?,
    paymentReferenceNo: json['paymentReferenceNo'] as String?,
    paymentLinkUrl: json['paymentLinkUrl'] as String?,
  );
}

Map<String, dynamic> _$_$_PaymentToJson(_$_Payment instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'paymentMethod': instance.paymentMethod,
      'paymentToken': instance.paymentToken,
      'paymentReferenceNo': instance.paymentReferenceNo,
      'paymentLinkUrl': instance.paymentLinkUrl,
    };

_$_Receiver _$_$_ReceiverFromJson(Map<String, dynamic> json) {
  return _$_Receiver(
    customerId: json['customerId'] as num,
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

Map<String, dynamic> _$_$_ReceiverToJson(_$_Receiver instance) =>
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
