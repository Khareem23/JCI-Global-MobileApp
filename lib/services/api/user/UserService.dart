import 'package:dio/dio.dart';
import 'package:jci_remit_mobile/UI/auth/register/register.model.dart';
import 'package:jci_remit_mobile/services/api/user/models/customer_update_dto.dart';
import 'package:jci_remit_mobile/services/api/user/models/state.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_transaction.dart';
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
import 'models/country.dart';
import 'models/login_res.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

class UserService extends IUserService {
  late Dio _dio;

  UserService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        // contentType: "application/json-patch+json",
        baseUrl: Globals.apiBaseUrl);
    _dio = Dio(options);
    _dio.interceptors.add(ApiInterceptor());
    // _dio.interceptors.add(CacheInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
    _dio.interceptors.add(PrettyDioLogger());
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient dioClient) {
    //   dioClient.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return _dio;
    // };
  }
  @override
  Future<LoginResDto> login(username, password) async {
    final url = 'Users/login';
    try {
      final response = await _dio.post(
        url,
        data: {"username": username, "password": password},
      );
      LoginResDto result = LoginResDto.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<RegisterResDto> register(Register register) async {
    final url = 'Users/register';

    var data = {
      "email": "jj@ss.com",
      "firstName": "ie",
      "phoneNumber": "+2348099338822",
      "lastName": "rrr",
      "password": "password",
      "pin": "123456",
      "countryOfResidence": "CAN",
      "countryOfNationality": "ITA",
      "sourceOfFunds": "null",
      "state": "Northwest Territories",
      "city": "wsssfffggghhh",
      "postalCode": "145",
      "address": "erttt",
      "gender": "Female",
      "dateOfBirth": "2022-01-24T00:00:00.000",
      "businessName": "",
      "businessRegNumber": "",
      "accountType": "0",
      "userRole": "0"
    };
    print(data);
    try {
      final response =
          await _dio.post(url, data: register.toJson(), options: Options());
      print(response);
      RegisterResDto result = RegisterResDto.fromJson(response.data);
      //print(result);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.message;
      } else {
        //print(e.error);
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
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<bool> validateOtp(String otp, int userID) async {
    final url = 'Users/login/$userID/$otp';
    try {
      final response = await _dio.post(url,
          options: Options(headers: {"requireToken": true}));
      print(response.data);
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

  @override
  Future<UserDto> getUserProfile(String id) async {
    final url = 'Users/$id';
    try {
      final response = await _dio.get(url,
          options: Options(headers: {"requireToken": true}));
      UserDto result = UserDto.fromJson(response.data['data']);
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

  @override
  Future<Country> getCountries() async {
    final url = 'Users/getCountries';
    try {
      final response = await _dio.get(url);
      Country result = Country.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<Country> getCountriesAll() async {
    final url = 'Users/getCountriesWithCode';
    try {
      final response = await _dio.get(url);
      Country result = Country.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }



  @override
  Future<State> getStates(String countryCode) async {
    final url = 'Users/getCountryStates/$countryCode';
    try {
      final response = await _dio.get(url);
      State result = State.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null) {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<UserTransaction> getUserTransaction() async {
    final url = 'Transactions/getCustomertransactions';
    try {
      final response = await _dio.get(url,
          options: Options(headers: {"requireToken": true}));
      final result = userTransactionFromJson(response.data);
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

  Future<bool> addBankAccount(
      String accCountry,
      String accBankName,
      String accNumber,
      String accName,
      String accountSwiftCode,
      String customerId) async {
    final url = 'Users/addBankAccount';
    try {
      final response = await _dio.post(url,
          data: {
            "accCountry": accCountry,
            "accBankName": accBankName,
            "accNumber": accNumber,
            "accSwiftCode": accountSwiftCode,
            "accountName": accName,
            "customerId": customerId
          },
          options: Options(headers: {"requireToken": true}));
      //final result = userTransactionFromJson(response.data);
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

  Future<bool> updateUser(CustomerUpdateDto customer) async {
    final url = 'Users/updateCustomerByCustomer';
    try {
      final response = await _dio.put(url,
          data: customer.toJson(),
          options: Options(headers: {"requireToken": true}));
      //final result = userTransactionFromJson(response.data);
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

  @override
  Future<bool> resetPassword(String newPassword, String resetKey) async {
    final url = 'Users/resetPassword/$newPassword/$resetKey';
    try {
      final response = await _dio.put(
        url,
      );
      //final result = userTransactionFromJson(response.data);
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
}
