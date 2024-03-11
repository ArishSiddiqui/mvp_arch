import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool loading;
  const LoginState({
    this.loading = false,
  });

  LoginState copywith({
    bool? loading,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
    loading,
  ];
}
