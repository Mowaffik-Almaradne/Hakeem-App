part of 'confirm_forget_password_cubit.dart';

class ConfirmForgetPasswordState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const ConfirmForgetPasswordState({
    required this.failureMessage,
    required this.status,
  });

  factory ConfirmForgetPasswordState.intial() {
    return ConfirmForgetPasswordState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  ConfirmForgetPasswordState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return ConfirmForgetPasswordState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
