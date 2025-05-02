part of 'updata_patient_profile_cubit.dart';

class UpdataPatientProfileState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const UpdataPatientProfileState({
    required this.failureMessage,
    required this.status,
  });

  factory UpdataPatientProfileState.intial() {
    return UpdataPatientProfileState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  UpdataPatientProfileState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return UpdataPatientProfileState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}