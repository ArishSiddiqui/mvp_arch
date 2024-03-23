import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final bool loading;
  const SignUpState({
    this.loading = false,
  });

  SignUpState copywith({
    bool? loading,
  }) {
    return SignUpState(
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
    loading,
  ];
}
