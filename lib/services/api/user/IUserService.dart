import 'package:jci_remit_mobile/UI/auth/register/register.model.dart';
import 'package:jci_remit_mobile/services/api/user/models/state.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_dto.dart';

import 'models/country.dart';
import 'models/login_res.dart';
import 'models/register_res.dart';

abstract class IUserService {
  Future<LoginResDto> login(username, password);
  Future<RegisterResDto> register(Register register);
  Future<String> sendOtp(String phone);
  Future<String> validateOtp(String otp);
  Future<UserDto> getUserProfile(String id);
  Future<Country> getCountries();
  Future<State> getStates(String countryCode);
}
