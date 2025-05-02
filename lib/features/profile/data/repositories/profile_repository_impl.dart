import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/profile/data/datasources/remote/profile_remote.dart';
import 'package:hosptel_app/features/profile/domain/entities/res/patient_profile_entitiey.dart';
import 'package:hosptel_app/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemote remote;
  ProfileRepositoryImpl({required this.remote});
  //? Change Passwprd Repositorey Impl :
  @override
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
        return Right(data);
      },
    );
  }

  //? Edit Phone Number  Impl :
  @override
  Future<Either<Failure, Unit>> editPhonNumber(
      {required String phoneNumber}) async {
    return await CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.editPhonNumber(phoneNumber: phoneNumber);
        return Right(data);
      },
    );
  }

  //? Confirm Edit Phone Number  Repository Impl :
  @override
  Future<Either<Failure, Unit>> confirmEditPhoneNumber(
      {required String phoneNumber, required String code}) async {
    return await CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.confirmEditPhoneNumber(
            phoneNumber: phoneNumber, code: code);
        return Right(data);
      },
    );
  }

  //? Logout Repository Impl :
  @override
  Future<Either<Failure, Unit>> logout() async {
    return await CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.logout();
        return Right(data);
      },
    );
  }

  //? Delete Account Repository Impl :
  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    return await CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.deleteAccount();
        return Right(data);
      },
    );
  }

//? Get Patient Profile Repository Impl :
  @override
  Future<Either<Failure, PatientProfileEntitey>> getPatientProfile() async {
    return await CheckNet<PatientProfileEntitey>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getPatientProfile();
        return Right(data);
      },
    );
  }

//? Updata Patient Profile Repository Impl :
  @override
  Future<Either<Failure, Unit>> updatePatientProfile({
    required MainPatientProfile request,
  }) async {
    return await CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.updatePatientProfile(request: request);
        return Right(data);
      },
    );
  }
}
