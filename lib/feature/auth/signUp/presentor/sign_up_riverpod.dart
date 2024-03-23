import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sign_up_state.dart';

class SignUpStateNotifier extends StateNotifier<SignUpState> {
  SignUpStateNotifier() : super(const SignUpState());

  void setName(String name) {
    state = state.copywith();
  }
}

final signUpProvider = StateNotifierProvider<SignUpStateNotifier, SignUpState>(
  (ref) => SignUpStateNotifier(),
);
