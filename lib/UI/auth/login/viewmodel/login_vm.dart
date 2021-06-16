import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/login/viewmodel/login_state.dart';
import 'package:jci_remit_mobile/repositories/auth_repository.dart';

final loginNotifierProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) => LoginController(ref));

class LoginController extends StateNotifier<LoginState> {
  final AuthRepository authRepository;
  LoginController(ProviderReference ref)
      : authRepository = ref.read(authRepositoryProvider),
        super(LoginInitial());

  void login(BuildContext context, String username, String password) async {
    state = LoginLoading();
    try {
      final res = await authRepository.login(username, password);
      if (res.data != null) {
        state = LoginSuccess();
      } else {
        state = UserNotConfirmed();
      }
    } catch (e) {
      state = LoginError(e.toString());
    }
  }
}
