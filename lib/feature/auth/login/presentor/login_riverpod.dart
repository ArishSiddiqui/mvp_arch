import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_state.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(const LoginState());

  void setName(String name) {
    state = state.copywith();
  }
}

final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(),
);
