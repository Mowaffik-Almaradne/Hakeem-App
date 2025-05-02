part of 'confirm_edit_phone_number_cubit.dart';

class ConfirmEditPhoneNumberState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const ConfirmEditPhoneNumberState({
    required this.failureMessage,
    required this.status,
  });

  factory ConfirmEditPhoneNumberState.intial() {
    return ConfirmEditPhoneNumberState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  ConfirmEditPhoneNumberState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return ConfirmEditPhoneNumberState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
