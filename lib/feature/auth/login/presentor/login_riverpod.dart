import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/app_const.dart';
import 'login_state.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(const LoginState());

  Future<void> login({
    required String cred,
    required String password,
  }) async {
    state = state.copywith(
      status: ApiStatus.loading,
    );
    await Future.delayed(const Duration(seconds: 3));
    state = state.copywith(
      status: ApiStatus.success,
    );
  }
}

final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(),
);
