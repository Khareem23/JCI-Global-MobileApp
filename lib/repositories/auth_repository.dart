import 'package:jci_remit_mobile/UI/auth/register/register.model.dart';
import 'package:jci_remit_mobile/helper/static_config.dart';
import 'package:jci_remit_mobile/services/api/user/UserService.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/services/api/user/models/login_res.dart';
import 'package:jci_remit_mobile/services/api/user/models/register_res.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_dto.dart';
import 'package:jci_remit_mobile/services/storage/shared_prefs.dart';
import 'package:jci_remit_mobile/utils/utils.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final userService = ref.watch(userServiceProvider);

  return AuthRepository(userService);
});

class AuthRepository {
  final UserService _userService;
  AuthRepository(this._userService);

  Future<LoginResDto> login(String username, String password) async {
    final res = await _userService.login(username, password);
    await StorageUtil.putString(StaticConfig.token, res.data);
    // await StorageUtil.putString(StaticConfig.userId, res.userId);
    return res;
  }

  Future<RegisterResDto> register(Register register) async {
    final id = await _userService.register(register);
    return id;
  }

  Future<String> sendOtp(String phone) async {
    final res = await _userService.sendOtp(phone);
    return res;
  }

  Future<String> validateOtp(String otp) async {
    final res = await _userService.validateOtp(otp);
    return res;
  }

  Future<UserDto> getUser() async {
    final util = Util();
    final token = StorageUtil.getString(StaticConfig.token);
    final userMap = util.parseJwtPayLoad(token);
    print(userMap);
    final userId = userMap['id'];
    final res = await _userService.getUserProfile(userId);
    return res;
  }
}

class Failure {
  Failure(this.message);

  final String message;
}
