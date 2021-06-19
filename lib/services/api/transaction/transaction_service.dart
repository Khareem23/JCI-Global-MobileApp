import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_transaction_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/currency_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/utils/globals.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
}
