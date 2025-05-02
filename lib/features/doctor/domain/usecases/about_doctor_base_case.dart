import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/doctor/domain/entities/res/get_about_doctor_entitie.dart';
import 'package:hosptel_app/features/doctor/domain/entities/res/work_hours_for_doctor.dart';

abstract class AboutDoctorBaseUseCase {
  //? Get About Doctor Base Use Case :
  Future<Either<Failure, GetAboutDoctorEntitie>> getAboutDoctor();
  //? Get All Work Hours For Doctor Base Use Case :

  Future<Either<Failure, GetAllWorkHoursForDoctorEntitie>>
      getAllWorkHoursForDoctor();
}
