import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/helper/static_config.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/bank_account_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/country_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_transaction_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/currency_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/services/storage/shared_prefs.dart';
import 'package:jci_remit_mobile/utils/globals.dart';
import 'package:jci_remit_mobile/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

import '../api_interceptor.dart';
import '../error_interceptor.dart';

final trnxServiceProvider = Provider<TransactionService>((ref) {
  return TransactionService();
});

class TransactionService {
  late Dio _dio;

  TransactionService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: Globals.apiBaseUrl);
    _dio = Dio(options)
      ..interceptors.add(ApiInterceptor())
      ..interceptors.add(ErrorInterceptor())
      ..interceptors.add(PrettyDioLogger());
  }

  Future<CurrencyModel> getAllSendingCurrency() async {
    final url = 'Rates/getAllSendCountryTransactionRate';//getAllTransactionSendingCurrency
    try {
      final response = await _dio.get(url,
          options: Options(headers: {"requireToken": true}));
      CurrencyModel result = currencyModelFromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<CurrencyModel> getAllReceivingCurrency() async {
    final url = 'Rates/getAllReceiveTransactionRate'; //getAllTransactionReceivingCurrency
    try {
      final response = await _dio.get(url,
          options: Options(headers: {"requireToken": true}));
      CurrencyModel result = currencyModelFromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<CountryRes> getCountries() async {
    final url = 'Users/getCountries';
    try {
      final response = await _dio.get(url,
          options: Options(headers: {"requireToken": true}));
      final result = countryResFromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<BankAccountModel> getBankAccounts() async {
    final url = '/JCIBank/GetAllBankAccount';
    try {
      final response = await _dio.get(url,
          options: Options(headers: {"requireToken": true}));
      final result = bankAccountModelFromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<BankAccountModel> getBankAccountsBySendingCountry(
      String countryCode) async {
    final url = '/JCIBank/GetAllBankAccountBySendingCountry/' + countryCode;
    try {
      final response = await _dio.get(url,
          options: Options(headers: {"requireToken": true}));
      final result = bankAccountModelFromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<BeneficiaryModel> getBeneficiaries() async {
    final url = '/Transactions/getUserReceivers';
    try {
      final response = await _dio.get(url,
          options: Options(headers: {"requireToken": true}));
      final result = beneficiaryModelFromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<RateModel> getRate(String sendCurrencyCode, String receiveCurrencyCode,
      num amount) async {
    final url = 'Transactions/convertSendingToReceiving';
    try {
      final response = await _dio.post(url,
          data: {
            "sendCountry": sendCurrencyCode,
            "receieveCountry": receiveCurrencyCode,
            "amountToSend": amount
          },
          options: Options(headers: {"requireToken": true}));
      final result = rateModelFromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<bool> uploadPaymentConfirmation(num transactionId,
      String filePath) async {
    File file = File(filePath);
    final url = 'Transactions/uploadPaymentConfirmation/$transactionId';
    final mimeTypeData =
    lookupMimeType(file.path, headerBytes: [0xFF, 0xD8])!.split('/');
    FormData formData = FormData.fromMap({
      "fileToUpload": await MultipartFile.fromFile(file.path,
          contentType: MediaType(mimeTypeData[0], mimeTypeData[1]))
    });
    try {
      final response = await _dio.post(url,
          data: formData, options: Options(headers: {"requireToken": true}));
      //final result = rateModelFromJson(response.data);
      return true;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<String> addPaymentToTransaction(num transactionId,
      num paymentTypeId) async {
    final url =
        'Transactions/AddPaymentToTransaction/$transactionId/PaymentTypeID/$paymentTypeId';
    print(url);
    try {
      final response = await _dio.patch(url,
          options: Options(headers: {"requireToken": true}));
      final result = response.data['data'];
      print(response.data["message"]);
      return response.data["message"];
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<String> addPaymentToTransaction2(num transactionId,
      num paymentTypeId) async {
    final url =
        'Transactions/AddPaymentToTransaction/$transactionId/PaymentTypeID/$paymentTypeId';
    print(url);
    try {
      final response = await _dio.patch(url,
          options: Options(headers: {"requireToken": true}));
      final result = response.data['data']['paymentLinkURL'];
      print(response.data["message"]);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }


  Future<TransactionRes> createTransaction(
      CreateTransactionModel transaction) async {
    final url = 'Transactions/createTransaction';
    try {
      final response = await _dio.post(url,
          data: {
            "customerId": transaction.customerId,
            "amountToSend": transaction.amountToSend,
            "exchangeRate": transaction.exchangeRate,
            "paymentPurpose": transaction.paymentPurpose,
            "paymentDescription": transaction.paymentDescription,
            "sendingCountry": transaction.sendingCountry,
            "receivingCountry": transaction.receivingCountry,
            "amountToReceive_Local": transaction.amountToReceive,
            "amountToReceive_USD": transaction.amountToReceiveNgaUsd,
            "bonusCode": transaction.bonusCode
          },
          options: Options(headers: {"requireToken": true}));
      final result = transactionResFromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  // Create beneficiary on transaction screen or beneficiary screen
  Future<bool> createBeneficiary(CreateBeneficiaryModel beneficiary,
      num? transactionId) async {
    final url = transactionId == null
        ? 'Transactions/addReceiver'
        : 'Transactions/addNewBeneficiaryToTransaction/$transactionId';
    try {
      print(beneficiary.toJson());

      final response = transactionId == null
          ? await _dio.post(url,
          // data: beneficiary.toJson(),
          data: {
            "customerId": beneficiary.customerId,
            "bankCountry": beneficiary.bankCountry,
            "bankName": beneficiary.bankName,
            "bankState": beneficiary.bankState,
            "bankPostalCode": beneficiary.bankPostalCode,
            "bankCity": beneficiary.bankCity,
            "bankAddress": beneficiary.bankAddress,
            "accountCurrency": beneficiary.accountCurrency,
            "accountNumber": beneficiary.accountNumber,
            "accountName": beneficiary.accountName,
            "accountSWiftCode": beneficiary.accountSWiftCode,
            "accountBSBCode": beneficiary.accountBsbCode,
            "beneficiaryAddress": beneficiary.beneficiaryAddress,
            "beneficiaryCountry": beneficiary.beneficiaryCountry,
            "bankIdentifierCode": beneficiary.bankIdentifierCode,
            "bankIdentifier": beneficiary.bankIdentifier,
            "corresBankCountry": beneficiary.bankCountry,
            "corresBankName": beneficiary.corresBankName,
            "corresBankIBAN": beneficiary.corresBankIban,
            "corresBankAddress": beneficiary.corresBankAddress,
            "corresAccountName": beneficiary.corresBankCountry,
          },
          options: Options(headers: {"requireToken": true}))
          : await _dio.patch(url,
          data: {
            "customerId": beneficiary.customerId,
            "bankCountry": beneficiary.bankCountry,
            "bankName": beneficiary.bankName,
            "bankState": beneficiary.bankState,
            "bankPostalCode": beneficiary.bankPostalCode,
            "bankCity": beneficiary.bankCity,
            "bankAddress": beneficiary.bankAddress,
            "accountCurrency": beneficiary.accountCurrency,
            "accountNumber": beneficiary.accountNumber,
            "accountName": beneficiary.accountName,
            "accountSWiftCode": beneficiary.accountSWiftCode,
            "accountBSBCode": beneficiary.accountBsbCode,
            "beneficiaryAddress": beneficiary.beneficiaryAddress,
            "beneficiaryCountry": beneficiary.beneficiaryCountry,
            "bankIdentifierCode": beneficiary.bankIdentifierCode,
            "bankIdentifier": beneficiary.bankIdentifier,
            "corresBankCountry": beneficiary.bankCountry,
            "corresBankName": beneficiary.corresBankName,
            "corresBankIBAN": beneficiary.corresBankIban,
            "corresBankAddress": beneficiary.corresBankAddress,
            "corresAccountName": beneficiary.corresBankCountry,
          },
          options: Options(headers: {"requireToken": true}));

      return response.data != null;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<bool> addExistingBeneficiaryByAccountNo(String beneficiary,
      num transactionId) async {
    final url =
        'Transactions/addExistingBeneficiaryToTransactionByAccountNo/$transactionId/$beneficiary';
    print(url);
    try {
      final response = await _dio.patch(url,
          options: Options(headers: {"requireToken": true}));

      return response.data != null;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<bool> addExistingBeneficiary(num beneficiary,
      num transactionId) async {
    final url =
        'Transactions/addExistingBeneficiaryToTransaction/$transactionId/$beneficiary';
    try {
      final response = await _dio.patch(url,
          options: Options(headers: {"requireToken": true}));

      return response.data != null;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        // Failure result = Failure.fromJson(e.response!.data);
        throw e.response!.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  // Stream<String> downloadFile(num transactionId) async* {
  //   StreamController<String> streamController = StreamController();
  //   // final url = 'Transactions/downloadTransactionReceiptJson/172';
  //   final url = 'Transactions/downloadTransactionReceiptJson/$transactionId';
  //   try {
  //     final directory = await getApplicationDocumentsDirectory();
  //     var path = '${directory.path}/invoice.pdf';
  //     await _dio
  //         .download(url, path,
  //             options: Options(headers: {"requireToken": true}),
  //             onReceiveProgress: (received, total) {
  //           if (total != -1) {
  //             streamController.add(total.toString());
  //             print((received / total * 100).toStringAsFixed(0) + "%");
  //           }
  //         })
  //         .then((Response response) =>
  //             {streamController.add("Download Finished")})
  //         .catchError((ex) {
  //           streamController.add(ex.toString());
  //         })
  //         .whenComplete(() => streamController.close());
  //     yield* streamController.stream;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  // downloadFile(num transactionId, context) async {
  //   // StreamController<String> streamController = StreamController();
  //   // final url = 'Transactions/downloadTransactionReceiptJson/172';
  //   print("downloading file");
  //   final url = 'Transactions/downloadTransactionReceiptPDF/$transactionId';
  //   try {
  //     var res = await _dio.get(url,
  //         options: Options(headers: {"requireToken": true}));
  //     // streamController.add("Download Finished");
  //     // print(res.data['message']);
  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //   SnackBar(
  //     //     backgroundColor: Colors.red,
  //     //     content: Text(res.data['message']),
  //     //   ),
  //     // );
  //     AppSnackBar.showSuccessSnackBar(context, message: res.data['message']);
  //   } on DioError catch (e) {
  //     AppSnackBar.showErrorSnackBar(context,
  //         message: e.response!.data['message']);
  //     if (e.response != null && e.response!.data != '') {
  //       // Failure result = Failure.fromJson(e.response!.data);
  //       throw e.response!.data['message'];
  //     } else {
  //       print(e.error);
  //       throw e.error;
  //     }
  //   }
  // }
  bool downloading = true;
  String downloadingStr = "No data";
  String savePath = "";

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory dir = await getApplicationDocumentsDirectory();

    path = '${dir.path}/$uniqueFileName';

    return path;
  }


  Future downloadFile2(String pdf) async {
    try {
      Dio dio = Dio();

      String name = pdf;
      String fileName = name.substring(name.lastIndexOf("/") + 1);

      savePath = await getFilePath(fileName);
      await dio.download(pdf, savePath, onReceiveProgress: (rec, total) {
        // setState(() {
        //   downloading = true;
        //   // download = (rec / total) * 100;
        //   downloadingStr =
        //   "Downloading Image : $rec" ;
        //
        // });


      });
      // setState(() {
      //   downloading = false;
      //   downloadingStr = "Completed";
      // });
    } catch (e) {
      print(e.toString());
      //}
    }
  }

    downloadFile(num transactionId, context) async {
      final util = Util();
      final token = StorageUtil.getString(StaticConfig.token);
      final userMap = util.parseJwtPayLoad(token);
      final email = userMap['email'];
      final baseUrl =
          "http://jciremitreceipt.decloud23.com/api/TransactionReceipt/download-receipt";
      final url = baseUrl + "/$transactionId/$email";
      print(url);
      try {
        var res = await http.get(Uri.parse(url), headers: {
          "content-type": "application/json",
        });

        var body = json.decode(res.body);
        print(body);
        if (body['status'] != 'failed') {

          var downloadUrl = body['path'];
          print(downloadUrl);
          downloadFile2(downloadUrl);

          AppSnackBar.showSuccessSnackBar(context, message: body['message']);
        } else {
          print(body['message']);
          AppSnackBar.showErrorSnackBar(context, message: body['message']);
        }
      } on TimeoutException catch (e) {
        print('Timeout: $e');
      } on Error catch (e) {
        print('Error: $e');
      }
    }
  }
