import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/repositories/user_repository.dart';

final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordNotifier, RequestState>(
  (ref) => ResetPasswordNotifier(ref.watch(userRepositoryProvider)),
);

class ResetPasswordNotifier extends RequestStateNotifier<void> {
  final UserRepository _userRepository;

  ResetPasswordNotifier(this._userRepository);

  Future<void> resetPassword(String resetKey, String newPassword) =>
      makeRequest(() => _userRepository.resetPassword(resetKey, newPassword));
}
