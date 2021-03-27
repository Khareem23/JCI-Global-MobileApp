import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:jci_remit_mobile/services/api/user/models/register_res.dart';
import 'package:jci_remit_mobile/services/api/user/models/send_otp_res_dto.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_dto.dart';
import 'package:jci_remit_mobile/services/models/failure.dart';
import 'package:jci_remit_mobile/utils/globals.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api_interceptor.dart';
import '../error_interceptor.dart';
import 'IUserService.dart';
import 'models/login_res.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

class UserService extends IUserService {
  Dio _dio;

  UserService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: Globals.apiBaseUrl);
    _dio = Dio(options);
    _dio.interceptors.add(ApiInterceptor());
    // _dio.interceptors.add(CacheInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
    _dio.interceptors.add(PrettyDioLogger());
  }
  @override
  Future<LoginResDto> login(email, password) async {
    final url = 'auth';
    try {
      final response = await _dio.post(url,
          data: {"email": email, "password": password, "rememberMe": true},
          options: Options());
      LoginResDto result = LoginResDto.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        Failure result = Failure.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<String> register(
      email, firstName, lastName, password, String userName) async {
    final url = 'users';
    try {
      final response = await _dio.post(url,
          data: {
            "email": email,
            "firstName": firstName,
            "lastName": lastName,
            "password": password,
            "userName": userName,
            "isAdmin": false
          },
          options: Options());
      RegisterResDto result = RegisterResDto.fromJson(response.data);
      return result.id;
    } on DioError catch (e) {
      if (e.response != null) {
        Failure result = Failure.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<String> sendOtp(String phone) async {
    final url = 'auth/SendOtp';
    try {
      final response = await _dio.post(url,
          data: {
            "phone": phone,
          },
          options: Options(headers: {"requireToken": true}));
      SendOtpResDto result = SendOtpResDto.fromJson(response.data);
      return result.message;
    } on DioError catch (e) {
      if (e.response != null && e.response.data != '') {
        Failure result = Failure.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<String> validateOtp(String otp) async {
    final url = 'auth/validateOtp';
    try {
      final response = await _dio.post(url,
          data: {
            "otp": otp,
          },
          options: Options(headers: {"requireToken": true}));
      SendOtpResDto result = SendOtpResDto.fromJson(response.data);
      return result.message;
    } on DioError catch (e) {
      if (e.response != null && e.response.data != '') {
        Failure result = Failure.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<UserDto> getUserProfile(String id) async {
    final url = 'users/$id';
    try {
      final response = await _dio.get(url,
          options: Options(headers: {"requireToken": true}));
      UserDto result = UserDto.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response.data != '') {
        // Failure result = Failure.fromJson(e.response.data);
        throw e.response.data['message'];
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }
}
