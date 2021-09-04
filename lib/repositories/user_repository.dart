import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/helper/static_config.dart';
import 'package:jci_remit_mobile/services/api/user/UserService.dart';
import 'package:jci_remit_mobile/services/api/user/models/customer_update_dto.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_dto.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_transaction.dart';
import 'package:jci_remit_mobile/services/storage/shared_prefs.dart';
import 'package:jci_remit_mobile/utils/utils.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref);
});

class UserRepository {
  final ProviderReference ref;
  late UserService _userService;
  UserRepository(this.ref) {
    _userService = ref.watch(userServiceProvider);
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

  Future<bool> addBankAccount(String accCountry, String accBankName,
      String accNumber, String accName, String accountSwiftCode) async {
    final util = Util();
    final token = StorageUtil.getString(StaticConfig.token);
    final userMap = util.parseJwtPayLoad(token);
    print(userMap);
    final userId = userMap['nameid'];
    final res = await _userService.addBankAccount(
        accCountry, accBankName, accNumber, accName, accountSwiftCode, userId);
    return res;
  }

  Future<bool> updateUser(CustomerUpdateDto customer) async {
    final util = Util();
    final token = StorageUtil.getString(StaticConfig.token);
    final userMap = util.parseJwtPayLoad(token);
    print(userMap);
    final userId = userMap['nameid'];
    final xCustomer = customer.copyWith(id: int.parse(userId));
    final res = await _userService.updateUser(xCustomer);
    return res;
  }

  Future<bool> resetPassword(String resetKey, newPassword) async {
    final res = await _userService.resetPassword(newPassword, resetKey);
    return res;
  }
}
