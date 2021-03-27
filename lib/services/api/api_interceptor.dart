import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    if (options.headers.containsKey('requireToken')) {
      options.headers.addAll({"Authorization": "Bearer $token"});
      // remove the auxilliary header
      options.headers.remove('requireToken');
    } else {
      options.headers.remove('requireToken');
    }

    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    // options.headers.addAll({"X-Api-Key": "${Globals.xAPIKey}"});

    return options;
  }
}

@override
FutureOr<dynamic> onResponse(Response response) async {
  print(
      "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");
  print("Headers:");
  response.headers?.forEach((k, v) => print('$k: $v'));
  print("Response: ${response.data}");
  print("<-- END HTTP");
  // }
  return response;
}
