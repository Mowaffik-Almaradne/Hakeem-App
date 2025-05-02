part of 'resend_code_cubit.dart';

class ResendCodeState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const ResendCodeState({
    required this.failureMessage,
    required this.status,
  });

  factory ResendCodeState.intial() {
    return ResendCodeState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  ResendCodeState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return ResendCodeState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
