import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:jci_remit_mobile/utils/connections/connection_util.dart';

import 'http_util_strings.dart';

class HttpUtils {
  static final BaseOptions options = new BaseOptions(
    connectTimeout: 999990,
    receiveTimeout: 89250,

//    connectTimeout: 7500,
//    receiveTimeout: 4500,
  );

  static Dio getInstance() {
    Dio dio = Dio(options)
      ..interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: false,
          compact: false,
          error: true,
          maxWidth: 90));
    return dio;
  }

  static Future<DioError> buildErrorResponse(DioError err) async {
    switch (err.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        if (await ConnectionUtils.getActiveStatus()) {
          err.error = HttpErrorStrings.CONNECTION_TIMEOUT_ACTIVE;
        } else {
          err.error = HttpErrorStrings.CONNECTION_TIMEOUT_NOT_ACTIVE;
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        err.error = HttpErrorStrings.SEND_TIMEOUT;
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        err.error = HttpErrorStrings.RECEIVE_TIMEOUT;
        break;
      case DioErrorType.RESPONSE:
        if (err.response.statusCode == HttpStatus.badRequest) {
          err.error = err.response.data.toString();
        } else if (err.response.statusCode == HttpStatus.unauthorized) {
          err.error = 'Unauthorized';
        } else {
          err.error = HttpErrorStrings.BAD_RESPONSE;
        }
        break;
      case DioErrorType.CANCEL:
        err.error = HttpErrorStrings.OPERATION_CANCELLED;
        break;
      case DioErrorType.DEFAULT:
        if (!await ConnectionUtils.getActiveStatus()) {
          err.error = HttpErrorStrings.DEFAULT;
        } else {
          err.error = HttpErrorStrings.BAD_RESPONSE;
        }
        break;
      default:
        err.error = HttpErrorStrings.UNKNOWN;
        break;
    }

    return err;
  }
}
