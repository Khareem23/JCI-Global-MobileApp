import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/dashboard/viewmodels/user_state.dart';
import 'package:jci_remit_mobile/repositories/user_repository.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_dto.dart';

final dashProvider =
    StateNotifierProvider<UserDashController>((ref) => UserDashController());

class UserDashController extends StateNotifier<UserState> {
  UserDashController() : super(UserLoading());

  getUser() async {
    final userRepository = UserRepository();
    state = UserLoading();
    try {
      final user = await userRepository.getUser();
      if (user != null) {
        state = UserSuccess(user: user);
      }
    } catch (e) {
      state = UserError(e.toString());
    }
  }
}

final userProvider = FutureProvider.autoDispose<UserDto>((ref) async {
  final userRepository = UserRepository();
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  return await userRepository.getUser();
});
