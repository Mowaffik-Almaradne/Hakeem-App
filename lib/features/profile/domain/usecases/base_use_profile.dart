import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/profile/domain/entities/res/patient_profile_entitiey.dart';

abstract class ProfileBaseUseCase {
  //? change Password Base Use Case  :
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  //? Confirm Edit Phone Base Use Case  :
  Future<Either<Failure, Unit>> confirmEditPhoneNumber({
    required String phoneNumber,
    required String code,
  });
  //? Logout Base Use Case :
  Future<Either<Failure, Unit>> logout();
  //? Delete Account  Base Use Case  :
  Future<Either<Failure, Unit>> deleteAccount();
  //? Get Patient Profile Base Use Case
  Future<Either<Failure, PatientProfileEntitey>> getPatientProfile();
  //? Update Patient Profile Base Use Case
  Future<Either<Failure, Unit>> updatePatientProfile({
    required MainPatientProfile request,
  });
  //? Send Confirmation Code For Edit Number Base Use Case
  Future<Either<Failure, Unit>> sendConfirmationCodeForEditNumber({
    required String phoneNumber,
  });
}
