import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/profile/domain/entities/res/patient_profile_entitiey.dart';

abstract class ProfileRepository {
  //? change Password Repository :
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  
  //? Confirm Edit Phone Repository :
  Future<Either<Failure, Unit>> confirmEditPhoneNumber({
    required String phoneNumber,
    required String code,
  });
  //? Logout Repository :
  Future<Either<Failure, Unit>> logout();
  //? Delete Account  Repository :
  Future<Either<Failure, Unit>> deleteAccount();
  //? Get Patient Profile Repository
  Future<Either<Failure, PatientProfileEntitey>> getPatientProfile();
  //? update Patient Profile Repository
  Future<Either<Failure, Unit>> updatePatientProfile({
    required MainPatientProfile request,
  });
  //? Send Confirmation Code For Edit Number Repository
  Future<Either<Failure, Unit>> sendConfirmationCodeForEditNumber({
    required String phoneNumber,
  });
}
