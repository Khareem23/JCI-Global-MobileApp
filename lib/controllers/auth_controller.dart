import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/repositories/auth_repository.dart';

import 'auth_state.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  notVerified,
  logout
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return AuthController(authRepository);
});

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  AuthController(this._authRepository, [AuthState? state])
      : super(state ?? AuthUnknown()) {
    auth(AuthenticationStatus.unknown);
  }

  void auth(AuthenticationStatus status) async {
    if (status == AuthenticationStatus.unauthenticated) {
      state = AuthUnauthenticated();
    } else if (status == AuthenticationStatus.authenticated) {
      final user = await _authRepository.getUser();
      state = AuthAuthenticated(user);
    } else if (status == AuthenticationStatus.notVerified) {
      //  final user = await _authRepository.getUser();
      state = AuthNotVerified();
    } else if (status == AuthenticationStatus.logout) {
      await _authRepository.removeToken();
      state = AuthUnauthenticated();
    } else {
      final bool hasToken = _authRepository.hasToken();
      if (hasToken) {
        // final user = await _authRepository.getUser();
        state = AuthPinNeeded();
      } else {
        state = AuthUnauthenticated();
      }
    }
  }
}
