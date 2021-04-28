// To parse this JSON data, do
//
//     final userDto = userDtoFromJson(jsonString);

import 'dart:convert';

UserDto userDtoFromJson(String str) => UserDto.fromJson(json.decode(str));

String userDtoToJson(UserDto data) => json.encode(data.toJson());

class UserDto {
  UserDto({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.createdDate,
    this.userRole,
    this.phoneNumber,
    this.businessName,
    this.businessRegNumber,
    this.pin,
    this.country,
    this.state,
    this.city,
    this.postalCode,
    this.address,
    this.gender,
    this.isKycCompliancePassed,
    this.isAmlCompliancePassed,
    this.isScannedForAml,
    this.dateOfBirth,
    this.age,
    this.resetKey,
    this.referralDiscountCode,
    this.accountType,
    this.receivers,
    this.transactions,
    this.customerReferredTransaction,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  DateTime createdDate;
  String userRole;
  String phoneNumber;
  String businessName;
  String businessRegNumber;
  String pin;
  String country;
  String state;
  String city;
  String postalCode;
  String address;
  String gender;
  bool isKycCompliancePassed;
  bool isAmlCompliancePassed;
  bool isScannedForAml;
  DateTime dateOfBirth;
  int age;
  String resetKey;
  String referralDiscountCode;
  String accountType;
  List<Receiver> receivers;
  List<Transaction> transactions;
  CustomerReferredTransaction customerReferredTransaction;

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        userRole: json["userRole"] == null ? null : json["userRole"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        businessName:
            json["businessName"] == null ? null : json["businessName"],
        businessRegNumber: json["businessRegNumber"] == null
            ? null
            : json["businessRegNumber"],
        pin: json["pin"] == null ? null : json["pin"],
        country: json["country"] == null ? null : json["country"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        address: json["address"] == null ? null : json["address"],
        gender: json["gender"] == null ? null : json["gender"],
        isKycCompliancePassed: json["isKYCCompliancePassed"] == null
            ? null
            : json["isKYCCompliancePassed"],
        isAmlCompliancePassed: json["isAMLCompliancePassed"] == null
            ? null
            : json["isAMLCompliancePassed"],
        isScannedForAml:
            json["isScannedForAML"] == null ? null : json["isScannedForAML"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        age: json["age"] == null ? null : json["age"],
        resetKey: json["resetKey"] == null ? null : json["resetKey"],
        referralDiscountCode: json["referralDiscountCode"] == null
            ? null
            : json["referralDiscountCode"],
        accountType: json["accountType"] == null ? null : json["accountType"],
        receivers: json["receivers"] == null
            ? null
            : List<Receiver>.from(
                json["receivers"].map((x) => Receiver.fromJson(x))),
        transactions: json["transactions"] == null
            ? null
            : List<Transaction>.from(
                json["transactions"].map((x) => Transaction.fromJson(x))),
        customerReferredTransaction: json["customerReferredTransaction"] == null
            ? null
            : CustomerReferredTransaction.fromJson(
                json["customerReferredTransaction"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "createdDate":
            createdDate == null ? null : createdDate.toIso8601String(),
        "userRole": userRole == null ? null : userRole,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "businessName": businessName == null ? null : businessName,
        "businessRegNumber":
            businessRegNumber == null ? null : businessRegNumber,
        "pin": pin == null ? null : pin,
        "country": country == null ? null : country,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
        "postalCode": postalCode == null ? null : postalCode,
        "address": address == null ? null : address,
        "gender": gender == null ? null : gender,
        "isKYCCompliancePassed":
            isKycCompliancePassed == null ? null : isKycCompliancePassed,
        "isAMLCompliancePassed":
            isAmlCompliancePassed == null ? null : isAmlCompliancePassed,
        "isScannedForAML": isScannedForAml == null ? null : isScannedForAml,
        "dateOfBirth":
            dateOfBirth == null ? null : dateOfBirth.toIso8601String(),
        "age": age == null ? null : age,
        "resetKey": resetKey == null ? null : resetKey,
        "referralDiscountCode":
            referralDiscountCode == null ? null : referralDiscountCode,
        "accountType": accountType == null ? null : accountType,
        "receivers": receivers == null
            ? null
            : List<dynamic>.from(receivers.map((x) => x.toJson())),
        "transactions": transactions == null
            ? null
            : List<dynamic>.from(transactions.map((x) => x.toJson())),
        "customerReferredTransaction": customerReferredTransaction == null
            ? null
            : customerReferredTransaction.toJson(),
      };
}

class CustomerReferredTransaction {
  CustomerReferredTransaction({
    this.id,
    this.totalNoTransaction,
    this.payoutBalance,
    this.customerId,
  });

  int id;
  int totalNoTransaction;
  num payoutBalance;
  int customerId;

  factory CustomerReferredTransaction.fromJson(Map<String, dynamic> json) =>
      CustomerReferredTransaction(
        id: json["id"] == null ? null : json["id"],
        totalNoTransaction: json["total_No_Transaction"] == null
            ? null
            : json["total_No_Transaction"],
        payoutBalance:
            json["payout_Balance"] == null ? null : json["payout_Balance"],
        customerId: json["customerId"] == null ? null : json["customerId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "total_No_Transaction":
            totalNoTransaction == null ? null : totalNoTransaction,
        "payout_Balance": payoutBalance == null ? null : payoutBalance,
        "customerId": customerId == null ? null : customerId,
      };
}

class Receiver {
  Receiver({
    this.id,
    this.country,
    this.bankCode,
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
    this.customer,
    this.customerId,
  });

  int id;
  String country;
  String bankCode;
  String bankName;
  String bankState;
  String bankPostalCode;
  String bankCity;
  String bankAddress;
  String accountCurrency;
  String accountNumber;
  String accountName;
  String accountSWiftCode;
  String accountBsbCode;
  String corresBankCountry;
  String corresBankName;
  String corresBankIban;
  Customer customer;
  int customerId;

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
        id: json["id"] == null ? null : json["id"],
        country: json["country"] == null ? null : json["country"],
        bankCode: json["bankCode"] == null ? null : json["bankCode"],
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
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        customerId: json["customerId"] == null ? null : json["customerId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "country": country == null ? null : country,
        "bankCode": bankCode == null ? null : bankCode,
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
        "customer": customer == null ? null : customer.toJson(),
        "customerId": customerId == null ? null : customerId,
      };
}

class Customer {
  Customer({
    this.phoneNumber,
    this.businessName,
    this.businessRegNumber,
    this.pin,
    this.countryOfResidence,
    this.countryOfNationality,
    this.state,
    this.city,
    this.postalCode,
    this.address,
    this.gender,
    this.isActive,
    this.isKycCompliancePassed,
    this.isAmlCompliancePassed,
    this.isScannedForAml,
    this.dateOfBirth,
    this.resetKey,
    this.referralDiscountCode,
    this.accountType,
    this.receivers,
    this.transactions,
    this.customerReferredTransaction,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.passwordHash,
    this.passwordSalt,
    this.createdDate,
    this.lastUpdatedDate,
    this.userRole,
  });

  String phoneNumber;
  String businessName;
  String businessRegNumber;
  String pin;
  String countryOfResidence;
  String countryOfNationality;
  String state;
  String city;
  String postalCode;
  String address;
  String gender;
  bool isActive;
  bool isKycCompliancePassed;
  bool isAmlCompliancePassed;
  bool isScannedForAml;
  DateTime dateOfBirth;
  String resetKey;
  String referralDiscountCode;
  String accountType;
  List<dynamic> receivers;
  List<dynamic> transactions;
  CustomerReferredTransaction customerReferredTransaction;
  int id;
  String email;
  String firstName;
  String lastName;
  String passwordHash;
  String passwordSalt;
  DateTime createdDate;
  DateTime lastUpdatedDate;
  String userRole;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        businessName:
            json["businessName"] == null ? null : json["businessName"],
        businessRegNumber: json["businessRegNumber"] == null
            ? null
            : json["businessRegNumber"],
        pin: json["pin"] == null ? null : json["pin"],
        countryOfResidence: json["countryOfResidence"] == null
            ? null
            : json["countryOfResidence"],
        countryOfNationality: json["countryOfNationality"] == null
            ? null
            : json["countryOfNationality"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        address: json["address"] == null ? null : json["address"],
        gender: json["gender"] == null ? null : json["gender"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        isKycCompliancePassed: json["isKYCCompliancePassed"] == null
            ? null
            : json["isKYCCompliancePassed"],
        isAmlCompliancePassed: json["isAMLCompliancePassed"] == null
            ? null
            : json["isAMLCompliancePassed"],
        isScannedForAml:
            json["isScannedForAML"] == null ? null : json["isScannedForAML"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        resetKey: json["resetKey"] == null ? null : json["resetKey"],
        referralDiscountCode: json["referralDiscountCode"] == null
            ? null
            : json["referralDiscountCode"],
        accountType: json["accountType"] == null ? null : json["accountType"],
        receivers: json["receivers"] == null
            ? null
            : List<dynamic>.from(json["receivers"].map((x) => x)),
        transactions: json["transactions"] == null
            ? null
            : List<dynamic>.from(json["transactions"].map((x) => x)),
        customerReferredTransaction: json["customerReferredTransaction"] == null
            ? null
            : CustomerReferredTransaction.fromJson(
                json["customerReferredTransaction"]),
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        passwordHash:
            json["passwordHash"] == null ? null : json["passwordHash"],
        passwordSalt:
            json["passwordSalt"] == null ? null : json["passwordSalt"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        lastUpdatedDate: json["lastUpdatedDate"] == null
            ? null
            : DateTime.parse(json["lastUpdatedDate"]),
        userRole: json["userRole"] == null ? null : json["userRole"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "businessName": businessName == null ? null : businessName,
        "businessRegNumber":
            businessRegNumber == null ? null : businessRegNumber,
        "pin": pin == null ? null : pin,
        "countryOfResidence":
            countryOfResidence == null ? null : countryOfResidence,
        "countryOfNationality":
            countryOfNationality == null ? null : countryOfNationality,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
        "postalCode": postalCode == null ? null : postalCode,
        "address": address == null ? null : address,
        "gender": gender == null ? null : gender,
        "isActive": isActive == null ? null : isActive,
        "isKYCCompliancePassed":
            isKycCompliancePassed == null ? null : isKycCompliancePassed,
        "isAMLCompliancePassed":
            isAmlCompliancePassed == null ? null : isAmlCompliancePassed,
        "isScannedForAML": isScannedForAml == null ? null : isScannedForAml,
        "dateOfBirth":
            dateOfBirth == null ? null : dateOfBirth.toIso8601String(),
        "resetKey": resetKey == null ? null : resetKey,
        "referralDiscountCode":
            referralDiscountCode == null ? null : referralDiscountCode,
        "accountType": accountType == null ? null : accountType,
        "receivers": receivers == null
            ? null
            : List<dynamic>.from(receivers.map((x) => x)),
        "transactions": transactions == null
            ? null
            : List<dynamic>.from(transactions.map((x) => x)),
        "customerReferredTransaction": customerReferredTransaction == null
            ? null
            : customerReferredTransaction.toJson(),
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "passwordHash": passwordHash == null ? null : passwordHash,
        "passwordSalt": passwordSalt == null ? null : passwordSalt,
        "createdDate":
            createdDate == null ? null : createdDate.toIso8601String(),
        "lastUpdatedDate":
            lastUpdatedDate == null ? null : lastUpdatedDate.toIso8601String(),
        "userRole": userRole == null ? null : userRole,
      };
}

class Transaction {
  Transaction({
    this.id,
    this.transactionRefNumber,
    this.transactionType,
    this.sendingCountry,
    this.receivingCountry,
    this.currencyDesc,
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
    this.receiver,
    this.receiverId,
    this.customer,
    this.customerId,
  });

  int id;
  String transactionRefNumber;
  String transactionType;
  String sendingCountry;
  String receivingCountry;
  String currencyDesc;
  num amountToSend;
  num amountToCharge;
  num amountToReceive;
  num amountToReceiveNgn;
  int amountToReceiveUsd;
  String payInMethod;
  String paymentPurpose;
  String paymentDescription;
  DateTime dateSent;
  DateTime dateProcessed;
  String transactionStatus;
  String paymentConfirmationUrl;
  bool isPaidIn;
  Receiver receiver;
  int receiverId;
  Customer customer;
  int customerId;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
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
        currencyDesc:
            json["currencyDesc"] == null ? null : json["currencyDesc"],
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
        receiver: json["receiver"] == null
            ? null
            : Receiver.fromJson(json["receiver"]),
        receiverId: json["receiverId"] == null ? null : json["receiverId"],
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        customerId: json["customerId"] == null ? null : json["customerId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "transactionRefNumber":
            transactionRefNumber == null ? null : transactionRefNumber,
        "transactionType": transactionType == null ? null : transactionType,
        "sendingCountry": sendingCountry == null ? null : sendingCountry,
        "receivingCountry": receivingCountry == null ? null : receivingCountry,
        "currencyDesc": currencyDesc == null ? null : currencyDesc,
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
        "receiver": receiver == null ? null : receiver.toJson(),
        "receiverId": receiverId == null ? null : receiverId,
        "customer": customer == null ? null : customer.toJson(),
        "customerId": customerId == null ? null : customerId,
      };
}
