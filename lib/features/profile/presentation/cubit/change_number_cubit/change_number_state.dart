part of 'change_number_cubit.dart';

class EditPhoneNumberState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const EditPhoneNumberState({
    required this.failureMessage,
    required this.status,
  });

  factory EditPhoneNumberState.intial() {
    return EditPhoneNumberState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  EditPhoneNumberState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return EditPhoneNumberState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
