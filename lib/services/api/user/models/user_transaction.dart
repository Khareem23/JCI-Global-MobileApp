// To parse this JSON data, do
//
//     final userTransaction = userTransactionFromJson(jsonString);

import 'dart:convert';

UserTransaction userTransactionFromJson(String str) =>
    UserTransaction.fromJson(json.decode(str));

String userTransactionToJson(UserTransaction data) =>
    json.encode(data.toJson());

class UserTransaction {
  UserTransaction({
    this.status,
    this.message,
    this.data,
  });

  final String status;
  final String message;
  final List<Datum> data;

  factory UserTransaction.fromJson(Map<String, dynamic> json) =>
      UserTransaction(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.customerId,
    this.fullName,
    this.senderEmail,
    this.id,
    this.transactionRefNumber,
    this.transactionType,
    this.sendingCountry,
    this.receivingCountry,
    this.amountToSend,
    this.amountToCharge,
    this.amountToReceive,
    this.amountToReceiveNgn,
    this.amountToReceiveUsd,
    this.payInMethod,
    this.paymentPurpose,
    this.paymentDescription,
    this.dateSent,
    this.dateProcessed,
    this.transactionStatus,
    this.paymentConfirmationUrl,
    this.isPaidIn,
    this.bonus,
    this.bonusType,
    this.bonusCode,
    this.exchangeRate,
    this.statusDescription,
    this.receiverId,
    this.receiver,
    this.payment,
  });

  final int customerId;
  final String fullName;
  final String senderEmail;
  final int id;
  final String transactionRefNumber;
  final String transactionType;
  final String sendingCountry;
  final String receivingCountry;
  final num amountToSend;
  final num amountToCharge;
  final num amountToReceive;
  final num amountToReceiveNgn;
  final num amountToReceiveUsd;
  final String payInMethod;
  final String paymentPurpose;
  final String paymentDescription;
  final DateTime dateSent;
  final DateTime dateProcessed;
  final String transactionStatus;
  final String paymentConfirmationUrl;
  final bool isPaidIn;
  final num bonus;
  final String bonusType;
  final String bonusCode;
  final double exchangeRate;
  final dynamic statusDescription;
  final int receiverId;
  final Receiver receiver;
  final Payment payment;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        customerId: json["customerId"] == null ? null : json["customerId"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        senderEmail: json["senderEmail"] == null ? null : json["senderEmail"],
        id: json["id"] == null ? null : json["id"],
        transactionRefNumber: json["transactionRefNumber"] == null
            ? null
            : json["transactionRefNumber"],
        transactionType:
            json["transactionType"] == null ? null : json["transactionType"],
        sendingCountry:
            json["sendingCountry"] == null ? null : json["sendingCountry"],
        receivingCountry:
            json["receivingCountry"] == null ? null : json["receivingCountry"],
        amountToSend:
            json["amountToSend"] == null ? null : json["amountToSend"],
        amountToCharge:
            json["amountToCharge"] == null ? null : json["amountToCharge"],
        amountToReceive:
            json["amountToReceive"] == null ? null : json["amountToReceive"],
        amountToReceiveNgn: json["amountToReceive_NGN"] == null
            ? null
            : json["amountToReceive_NGN"],
        amountToReceiveUsd: json["amountToReceive_USD"] == null
            ? null
            : json["amountToReceive_USD"],
        payInMethod: json["payInMethod"] == null ? null : json["payInMethod"],
        paymentPurpose:
            json["paymentPurpose"] == null ? null : json["paymentPurpose"],
        paymentDescription: json["paymentDescription"] == null
            ? null
            : json["paymentDescription"],
        dateSent:
            json["dateSent"] == null ? null : DateTime.parse(json["dateSent"]),
        dateProcessed: json["dateProcessed"] == null
            ? null
            : DateTime.parse(json["dateProcessed"]),
        transactionStatus: json["transactionStatus"] == null
            ? null
            : json["transactionStatus"],
        paymentConfirmationUrl: json["paymentConfirmationURL"] == null
            ? null
            : json["paymentConfirmationURL"],
        isPaidIn: json["isPaidIn"] == null ? null : json["isPaidIn"],
        bonus: json["bonus"] == null ? null : json["bonus"],
        bonusType: json["bonusType"] == null ? null : json["bonusType"],
        bonusCode: json["bonusCode"] == null ? null : json["bonusCode"],
        exchangeRate: json["exchangeRate"] == null
            ? null
            : json["exchangeRate"].toDouble(),
        statusDescription: json["statusDescription"],
        receiverId: json["receiverId"] == null ? null : json["receiverId"],
        receiver: json["receiver"] == null
            ? null
            : Receiver.fromJson(json["receiver"]),
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId == null ? null : customerId,
        "fullName": fullName == null ? null : fullName,
        "senderEmail": senderEmail == null ? null : senderEmail,
        "id": id == null ? null : id,
        "transactionRefNumber":
            transactionRefNumber == null ? null : transactionRefNumber,
        "transactionType": transactionType == null ? null : transactionType,
        "sendingCountry": sendingCountry == null ? null : sendingCountry,
        "receivingCountry": receivingCountry == null ? null : receivingCountry,
        "amountToSend": amountToSend == null ? null : amountToSend,
        "amountToCharge": amountToCharge == null ? null : amountToCharge,
        "amountToReceive": amountToReceive == null ? null : amountToReceive,
        "amountToReceive_NGN":
            amountToReceiveNgn == null ? null : amountToReceiveNgn,
        "amountToReceive_USD":
            amountToReceiveUsd == null ? null : amountToReceiveUsd,
        "payInMethod": payInMethod == null ? null : payInMethod,
        "paymentPurpose": paymentPurpose == null ? null : paymentPurpose,
        "paymentDescription":
            paymentDescription == null ? null : paymentDescription,
        "dateSent": dateSent == null ? null : dateSent.toIso8601String(),
        "dateProcessed":
            dateProcessed == null ? null : dateProcessed.toIso8601String(),
        "transactionStatus":
            transactionStatus == null ? null : transactionStatus,
        "paymentConfirmationURL":
            paymentConfirmationUrl == null ? null : paymentConfirmationUrl,
        "isPaidIn": isPaidIn == null ? null : isPaidIn,
        "bonus": bonus == null ? null : bonus,
        "bonusType": bonusType == null ? null : bonusType,
        "bonusCode": bonusCode == null ? null : bonusCode,
        "exchangeRate": exchangeRate == null ? null : exchangeRate,
        "statusDescription": statusDescription,
        "receiverId": receiverId == null ? null : receiverId,
        "receiver": receiver == null ? null : receiver.toJson(),
        "payment": payment == null ? null : payment.toJson(),
      };
}

class Payment {
  Payment({
    this.transactionId,
    this.paymentMethod,
    this.paymentToken,
    this.paymentReferenceNo,
    this.paymentLinkUrl,
  });

  final int transactionId;
  final int paymentMethod;
  final dynamic paymentToken;
  final String paymentReferenceNo;
  final dynamic paymentLinkUrl;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        transactionId:
            json["transactionId"] == null ? null : json["transactionId"],
        paymentMethod:
            json["paymentMethod"] == null ? null : json["paymentMethod"],
        paymentToken: json["paymentToken"],
        paymentReferenceNo: json["paymentReferenceNo"] == null
            ? null
            : json["paymentReferenceNo"],
        paymentLinkUrl: json["paymentLinkURL"],
      );

  Map<String, dynamic> toJson() => {
        "transactionId": transactionId == null ? null : transactionId,
        "paymentMethod": paymentMethod == null ? null : paymentMethod,
        "paymentToken": paymentToken,
        "paymentReferenceNo":
            paymentReferenceNo == null ? null : paymentReferenceNo,
        "paymentLinkURL": paymentLinkUrl,
      };
}

class Receiver {
  Receiver({
    this.customerId,
    this.country,
    this.bankName,
    this.bankState,
    this.bankPostalCode,
    this.bankCity,
    this.bankAddress,
    this.accountCurrency,
    this.accountNumber,
    this.accountName,
    this.accountSWiftCode,
    this.accountBsbCode,
    this.corresBankCountry,
    this.corresBankName,
    this.corresBankIban,
  });

  final int customerId;
  final String country;
  final String bankName;
  final String bankState;
  final String bankPostalCode;
  final String bankCity;
  final String bankAddress;
  final String accountCurrency;
  final String accountNumber;
  final String accountName;
  final String accountSWiftCode;
  final String accountBsbCode;
  final String corresBankCountry;
  final String corresBankName;
  final String corresBankIban;

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
        customerId: json["customerId"] == null ? null : json["customerId"],
        country: json["country"] == null ? null : json["country"],
        bankName: json["bankName"] == null ? null : json["bankName"],
        bankState: json["bankState"] == null ? null : json["bankState"],
        bankPostalCode:
            json["bankPostalCode"] == null ? null : json["bankPostalCode"],
        bankCity: json["bankCity"] == null ? null : json["bankCity"],
        bankAddress: json["bankAddress"] == null ? null : json["bankAddress"],
        accountCurrency:
            json["accountCurrency"] == null ? null : json["accountCurrency"],
        accountNumber:
            json["accountNumber"] == null ? null : json["accountNumber"],
        accountName: json["accountName"] == null ? null : json["accountName"],
        accountSWiftCode:
            json["accountSWiftCode"] == null ? null : json["accountSWiftCode"],
        accountBsbCode:
            json["accountBSBCode"] == null ? null : json["accountBSBCode"],
        corresBankCountry: json["corresBankCountry"] == null
            ? null
            : json["corresBankCountry"],
        corresBankName:
            json["corresBankName"] == null ? null : json["corresBankName"],
        corresBankIban:
            json["corresBankIBAN"] == null ? null : json["corresBankIBAN"],
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId == null ? null : customerId,
        "country": country == null ? null : country,
        "bankName": bankName == null ? null : bankName,
        "bankState": bankState == null ? null : bankState,
        "bankPostalCode": bankPostalCode == null ? null : bankPostalCode,
        "bankCity": bankCity == null ? null : bankCity,
        "bankAddress": bankAddress == null ? null : bankAddress,
        "accountCurrency": accountCurrency == null ? null : accountCurrency,
        "accountNumber": accountNumber == null ? null : accountNumber,
        "accountName": accountName == null ? null : accountName,
        "accountSWiftCode": accountSWiftCode == null ? null : accountSWiftCode,
        "accountBSBCode": accountBsbCode == null ? null : accountBsbCode,
        "corresBankCountry":
            corresBankCountry == null ? null : corresBankCountry,
        "corresBankName": corresBankName == null ? null : corresBankName,
        "corresBankIBAN": corresBankIban == null ? null : corresBankIban,
      };
}
