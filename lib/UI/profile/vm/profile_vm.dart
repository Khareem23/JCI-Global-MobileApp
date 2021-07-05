import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/repositories/user_repository.dart';

final addAccountProvider =
    StateNotifierProvider<AddAccountRequestNotifier, RequestState<bool>>(
  (ref) => AddAccountRequestNotifier(ref.watch(userRepositoryProvider)),
);

class AddAccountRequestNotifier extends RequestStateNotifier<bool> {
  final UserRepository _api;

  AddAccountRequestNotifier(this._api);

  Future<void> addAccount(String accCountry, String accBankName,
          String accNumber, String accName, String accountSwiftCode) =>
      makeRequest(() => _api.addBankAccount(
          accCountry, accBankName, accNumber, accName, accountSwiftCode));
}
