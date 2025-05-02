import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/doctor/domain/entities/res/get_about_doctor_entitie.dart';
import 'package:hosptel_app/features/doctor/domain/entities/res/work_hours_for_doctor.dart';
import 'package:hosptel_app/features/doctor/domain/repositories/about_doctor_repositories.dart';
import 'package:hosptel_app/features/doctor/domain/usecases/about_doctor_base_case.dart';

class AboutDoctorUseCaseImpl implements AboutDoctorBaseUseCase {
  AboutDoctorUseCaseImpl({required this.repositories});
  final AboutDoctorRepositories repositories;
  //? Get About Doctor Use Case Impl  :
  @override
  Future<Either<Failure, GetAboutDoctorEntitie>> getAboutDoctor() async {
    return await repositories.getAboutDoctor();
  }

  //? Get All Work Hours For Doctor Use Case  :
  @override
  Future<Either<Failure, GetAllWorkHoursForDoctorEntitie>>
      getAllWorkHoursForDoctor() async {
    return await repositories.getAllWorkHoursForDoctor();
  }
}
