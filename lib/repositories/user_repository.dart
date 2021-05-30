import 'package:jci_remit_mobile/helper/static_config.dart';
import 'package:jci_remit_mobile/services/api/user/UserService.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_dto.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_transaction.dart';
import 'package:jci_remit_mobile/services/storage/shared_prefs.dart';
import 'package:jci_remit_mobile/utils/utils.dart';

class UserRepository {
  UserService _userService;
  UserRepository() {
    _userService = UserService();
  }
  Future<UserDto> getUser() async {
    final util = Util();
    final token = StorageUtil.getString(StaticConfig.token);
    final userMap = util.parseJwtPayLoad(token);
    print(userMap);
    final userId = userMap['nameid'];
    final res = await _userService.getUserProfile(userId);
    return res;
  }

  Future<List<Datum>> getUserTransaction() async {
    final res = await _userService.getUserTransaction();
    return res.data;
  }
}
