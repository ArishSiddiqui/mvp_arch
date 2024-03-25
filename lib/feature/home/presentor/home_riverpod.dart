import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_state.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier() : super(const HomeState());

  void updateAccepted(bool? value) {
    state = state.copywith(
      isAccepted: value,
    );
  }
}

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>(
  (ref) => HomeStateNotifier(),
);
