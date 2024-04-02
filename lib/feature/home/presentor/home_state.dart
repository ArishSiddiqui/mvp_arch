import 'package:equatable/equatable.dart';

import '../../../core/const/app_const.dart';
import '../data/model/character_model.dart';

class HomeState extends Equatable {
  final ApiStatus status;
  final List<CharacterModel>? allCharacters;
  final String errorMessage;
  final int activeTab;
  const HomeState({
    this.status = ApiStatus.initial,
    this.allCharacters,
    this.errorMessage = '',
    this.activeTab = 0,
  });

  HomeState copywith({
    ApiStatus? status,
    List<CharacterModel>? allCharacters,
    String? errorMessage,
    int? activeTab,
  }) {
    return HomeState(
      status: status ?? this.status,
      allCharacters: allCharacters ?? this.allCharacters,
      errorMessage: errorMessage ?? this.errorMessage,
      activeTab: activeTab ?? this.activeTab,
    );
  }

  @override
  List<Object?> get props => [
        status,
        allCharacters,
        errorMessage,
        activeTab,
      ];
}
