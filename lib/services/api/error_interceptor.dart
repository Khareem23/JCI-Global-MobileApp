import 'package:dio/dio.dart';
import 'package:jci_remit_mobile/utils/http_utils/http_utils.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err) async {
    err = await HttpUtils.buildErrorResponse(err);
    throw err;
  }
}
