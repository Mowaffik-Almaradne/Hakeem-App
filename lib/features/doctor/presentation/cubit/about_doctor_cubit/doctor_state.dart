part of 'doctor_cubit.dart';

class GetAboutDoctorState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final GetAboutDoctorEntitie entitie;
  final bool isLoading;
  const GetAboutDoctorState({
    required this.failureMessage,
    required this.status,
    required this.entitie,
    required this.isLoading,
  });

  factory GetAboutDoctorState.intial() {
    return GetAboutDoctorState(
      isLoading: false,
      entitie: GetAboutDoctorEntitie.fromJson({}),
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAboutDoctorState copyWith(
      {FailureMessage? failureMessage,
      DeafultBlocStatus? status,
      GetAboutDoctorEntitie? entitie,
      bool? isLoading}) {
    return GetAboutDoctorState(
      isLoading: isLoading ?? this.isLoading,
      entitie: entitie ?? this.entitie,
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [failureMessage, status, entitie, isLoading];
}
