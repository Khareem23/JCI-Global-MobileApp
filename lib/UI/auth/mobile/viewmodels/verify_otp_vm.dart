import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/repositories/auth_repository.dart';

import 'verify_otp_state.dart';

final verifyOtpProvider = StateNotifierProvider<VerifyOtpController>(
    (ref) => VerifyOtpController(ref));

class VerifyOtpController extends StateNotifier<VerifyOtpState> {
  final AuthRepository authRepository;
  VerifyOtpController(ProviderReference ref)
      : authRepository = ref.read(authRepositoryProvider),
        super(VerifyOtpInitial());

  void validateOtp(String otp) async {
    state = VerifyOtpSending();
    try {
      final res = await authRepository.validateOtp(otp);
      if (res != null) {
        state = VerifyOtpSent();
      }
    } catch (e) {
      state = VerifyOtpError(e.toString());
    }
  }
}
