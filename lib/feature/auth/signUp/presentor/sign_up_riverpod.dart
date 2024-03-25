import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sign_up_state.dart';

class SignUpStateNotifier extends StateNotifier<SignUpState> {
  SignUpStateNotifier() : super(const SignUpState());

  void updateAccepted(bool? value) {
    state = state.copywith(
      isAccepted: value,
    );
  }
}

final signUpProvider = StateNotifierProvider<SignUpStateNotifier, SignUpState>(
  (ref) => SignUpStateNotifier(),
);
