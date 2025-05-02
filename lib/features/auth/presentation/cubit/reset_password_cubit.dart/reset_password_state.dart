part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const ResetPasswordState({
    required this.failureMessage,
    required this.status,
  });

  factory ResetPasswordState.intial() {
    return ResetPasswordState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  ResetPasswordState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return ResetPasswordState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
