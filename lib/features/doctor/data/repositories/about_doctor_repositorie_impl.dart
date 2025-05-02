import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/doctor/data/datasources/remote/about_doctor_remote.dart';
import 'package:hosptel_app/features/doctor/domain/entities/res/get_about_doctor_entitie.dart';
import 'package:hosptel_app/features/doctor/domain/entities/res/work_hours_for_doctor.dart';
import 'package:hosptel_app/features/doctor/domain/repositories/about_doctor_repositories.dart';

class AboutDoctorRepositoriesImpl implements AboutDoctorRepositories {
  final AboutDoctorRemote remote;
  AboutDoctorRepositoriesImpl({required this.remote});
  //? Get About Doctor Repositories Impl :
  @override
  Future<Either<Failure, GetAboutDoctorEntitie>> getAboutDoctor() async {
    return await CheckNet<GetAboutDoctorEntitie>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAboutDoctor();
        return Right(data);
      },
    );
  }

//? Get All Work Hours For Doctor Repositories Impl :
  @override
  Future<Either<Failure, GetAllWorkHoursForDoctorEntitie>>
      getAllWorkHoursForDoctor() async {
    return await CheckNet<GetAllWorkHoursForDoctorEntitie>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllWorkHoursForDoctor();
        return Right(data);
      },
    );
  }
}
