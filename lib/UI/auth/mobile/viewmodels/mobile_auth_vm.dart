import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/repositories/auth_repository.dart';

import 'mobile_auth_state.dart';

final mobileAuthProvider = StateNotifierProvider<MobileAuthController>(
    (ref) => MobileAuthController(ref));

class MobileAuthController extends StateNotifier<MobileAuthState> {
  final AuthRepository authRepository;
  MobileAuthController(ProviderReference ref)
      : authRepository = ref.read(authRepositoryProvider),
        super(MobileAuthInitial());

  void sendOtp(String phone) async {
    state = MobileAuthSending();
    try {
      final res = await authRepository.sendOtp(phone);
      if (res != null) {
        state = MobileAuthSent();
      }
    } catch (e) {
      state = MobileAuthError(e.toString());
    }
  }
}
