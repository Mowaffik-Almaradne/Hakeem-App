part of 'send_confirmation_code_for_edit_number_cubit.dart';

class SendConfirmationCodeForEditNumberState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const SendConfirmationCodeForEditNumberState({
    required this.failureMessage,
    required this.status,
  });

  factory SendConfirmationCodeForEditNumberState.intial() {
    return SendConfirmationCodeForEditNumberState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  SendConfirmationCodeForEditNumberState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return SendConfirmationCodeForEditNumberState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
