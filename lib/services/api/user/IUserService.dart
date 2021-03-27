import 'package:jci_remit_mobile/services/api/user/models/user_dto.dart';

import 'models/login_res.dart';

abstract class IUserService {
  Future<LoginResDto> login(username, password);
  Future<String> register(
      email, firstName, lastName, password, String userName);
  Future<String> sendOtp(String phone);
  Future<String> validateOtp(String otp);
  Future<UserDto> getUserProfile(String id);
}
