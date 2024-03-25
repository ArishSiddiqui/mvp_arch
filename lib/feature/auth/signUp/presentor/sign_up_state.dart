import 'package:equatable/equatable.dart';
import 'package:mvp_arch/core/const/app_const.dart';

class SignUpState extends Equatable {
  final ApiStatus status;
  final bool isAccepted;
  const SignUpState({
    this.status = ApiStatus.initial,
    this.isAccepted = false,
  });

  SignUpState copywith({
    ApiStatus? status,
    bool? isAccepted,
  }) {
    return SignUpState(
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
