import 'package:equatable/equatable.dart';

import '../../../../core/const/app_const.dart';

class LoginState extends Equatable {
  final bool loading;
  final ApiStatus status;
  const LoginState({
    this.loading = false,
    this.status = ApiStatus.initial,
  });

  LoginState copywith({
    bool? loading,
    ApiStatus? status,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        status,
      ];
}
