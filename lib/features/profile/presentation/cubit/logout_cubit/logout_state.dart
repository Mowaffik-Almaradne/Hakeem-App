part of 'logout_cubit.dart';

class LogoutState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const LogoutState({
    required this.failureMessage,
    required this.status,
  });

  factory LogoutState.intial() {
    return LogoutState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  LogoutState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return LogoutState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
