part of 'get_patient_profile_cubit.dart';

class GetPatientProfileState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final PatientProfileEntitey entitey;
  const GetPatientProfileState({
    required this.failureMessage,
    required this.status,
    required this.entitey,
  });

  factory GetPatientProfileState.intial() {
    return GetPatientProfileState(
      entitey: PatientProfileEntitey.fromJson({}),
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status, entitey];

  GetPatientProfileState copyWith(
      {FailureMessage? failureMessage,
      DeafultBlocStatus? status,
      PatientProfileEntitey? entitey}) {
    return GetPatientProfileState(
      entitey: entitey ?? this.entitey,
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
