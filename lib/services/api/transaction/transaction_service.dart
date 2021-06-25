import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/bank_account_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/country_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_transaction_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/currency_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/utils/globals.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

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
    final url = 'Rates/getAllSendingCurrency';
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
    final url = 'Rates/getAllReceivingCurrency';
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

  Future<RateModel> getRate(
      String sendCurrencyCode, String receiveCurrencyCode, num amount) async {
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

  Future<bool> uploadPaymentConfirmation(
      num transactionId, String filePath) async {
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

  Future<bool> addPaymentToTransaction(
      num transactionId, num paymentTypeId) async {
    final url =
        'Transactions/AddPaymentToTransaction/$transactionId/PaymentTypeID/$paymentTypeId';

    try {
      final response = await _dio.patch(url,
          options: Options(headers: {"requireToken": true}));
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

  Future<TransactionRes> createTransaction(
      CreateTransactionModel transaction) async {
    final url = 'Transactions/createTransaction';
    try {
      final response = await _dio.post(url,
          data: transaction.toJson(),
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

  Future<bool> createBeneficiary(
      CreateBeneficiaryModel beneficiary, num transactionId) async {
    final url = 'Transactions/addNewBeneficiaryToTransaction/$transactionId';
    try {
      final response = await _dio.patch(url,
          data: beneficiary.toJson(),
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

  Future<bool> addExistingBeneficiary(
      num beneficiary, num transactionId) async {
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
}
