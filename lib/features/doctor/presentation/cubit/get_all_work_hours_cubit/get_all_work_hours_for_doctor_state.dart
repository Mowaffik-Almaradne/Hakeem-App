import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/doctor/domain/entities/res/work_hours_for_doctor.dart';

class GetAllWorkHoursForDoctorState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final GetAllWorkHoursForDoctorEntitie entitie;
  const GetAllWorkHoursForDoctorState({
    required this.failureMessage,
    required this.status,
    required this.entitie,
  });

  factory GetAllWorkHoursForDoctorState.intial() {
    return GetAllWorkHoursForDoctorState(
      entitie: GetAllWorkHoursForDoctorEntitie.fromJson({}),
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllWorkHoursForDoctorState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    GetAllWorkHoursForDoctorEntitie? entitie,
  }) {
    return GetAllWorkHoursForDoctorState(
      entitie: entitie ?? this.entitie,
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        failureMessage,
        status,
        entitie,
      ];
}
