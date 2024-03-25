import 'package:equatable/equatable.dart';

import '../../../core/const/app_const.dart';

class HomeState extends Equatable {
  final ApiStatus status;
  final bool isAccepted;
  const HomeState({
    this.status = ApiStatus.initial,
    this.isAccepted = false,
  });

  HomeState copywith({
    ApiStatus? status,
    bool? isAccepted,
  }) {
    return HomeState(
      status: status ?? this.status,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }

  @override
  List<Object?> get props => [
    status,
    isAccepted,
  ];
}
