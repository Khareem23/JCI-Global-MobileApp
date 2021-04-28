import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/repositories/auth_repository.dart';
import 'package:jci_remit_mobile/services/api/user/UserService.dart';
import 'package:jci_remit_mobile/services/api/user/models/country.dart';
import 'package:jci_remit_mobile/services/api/user/models/state.dart' as c;

import 'register_state.dart';

final registerNotifierProvider =
    StateNotifierProvider<RegisterController>((ref) => RegisterController(ref));

final countryProvider =
    FutureProvider<Country>((_) => UserService().getCountries());
final statesProvider = FutureProvider.family<c.State, String>(
    (_, countryCode) => UserService().getStates(countryCode));

class RegisterController extends StateNotifier<RegisterState> {
  final AuthRepository authRepository;
  RegisterController(ProviderReference ref)
      : authRepository = ref.read(authRepositoryProvider),
        super(RegisterInitial());

  void register(BuildContext context, String email, String firstName,
      String lastName, String password, String userName) async {
    state = RegisterLoading();
    try {
      final res = await authRepository.register(
          email, firstName, lastName, password, userName);
      if (res) {
        state = RegisterSuccess();
      }
    } catch (e) {
      state = RegisterError(e.toString());
    }
  }
}
