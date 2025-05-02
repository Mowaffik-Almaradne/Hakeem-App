part of 'forget_password_phone_cubit.dart';

class ForgetPasswordPhoneState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const ForgetPasswordPhoneState({
    required this.failureMessage,
    required this.status,
  });

  factory ForgetPasswordPhoneState.intial() {
    return ForgetPasswordPhoneState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  ForgetPasswordPhoneState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return ForgetPasswordPhoneState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
