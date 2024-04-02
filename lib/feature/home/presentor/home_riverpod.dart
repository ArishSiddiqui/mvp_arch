import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_arch/core/const/app_const.dart';

import '../../../core/custom/custom_logger.dart';
import '../../../injection_container.dart';
import '../data/model/character_model.dart';
import 'home_repository.dart';
import 'home_state.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  final HomeRepository repository;
  HomeStateNotifier({
    required this.repository,
  }) : super(const HomeState());

  Future<void> getAllCharacters() async {
    // state = state.copywith(
    //   status: ApiStatus.loading,
    // );
    final charsData = await repository.getCharacters();
    charsData.fold(
      (failure) => state = state.copywith(
        status: ApiStatus.error,
        errorMessage: failure.message,
        allCharacters: <CharacterModel>[],
      ),
      (data) {
        CustomLogger.pP(data);
        return state = state.copywith(
          status: ApiStatus.success,
          allCharacters: data,
        );
      },
    );
  }

  void updateActiveTab(int index) {
    state = state.copywith(
      activeTab: index,
    );
  }
}

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>(
  (ref) => sl<HomeStateNotifier>(),
);

final getCharactersProvider = FutureProvider(
  (ref) => ref.read(homeProvider.notifier).getAllCharacters(),
);
