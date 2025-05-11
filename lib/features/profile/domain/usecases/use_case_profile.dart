import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/profile/domain/entities/res/patient_profile_entitiey.dart';
import 'package:hosptel_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:hosptel_app/features/profile/domain/usecases/base_use_profile.dart';

class ProfileUseCaseImpl implements ProfileBaseUseCase {
  final ProfileRepository repository;
  ProfileUseCaseImpl({required this.repository});
  //? change Password Use Case  :
  @override
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await repository.changePassword(
        currentPassword: currentPassword, newPassword: newPassword);
  }


  //? Confirm Edit Phone Use Case  :
  @override
  Future<Either<Failure, Unit>> confirmEditPhoneNumber({
    required String phoneNumber,
    required String code,
  }) async {
    return await repository.confirmEditPhoneNumber(
      phoneNumber: phoneNumber,
      code: code,
    );
  }

  //? Confirm Logout Use Case  :
  @override
  Future<Either<Failure, Unit>> logout() async {
    return await repository.logout();
  }

  //? Confirm Delete Account Use Case  :
  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    return await repository.deleteAccount();
  }

  //? Get Patient Profile Base Use Case
  @override
  Future<Either<Failure, PatientProfileEntitey>> getPatientProfile() async {
    return await repository.getPatientProfile();
  }

  //? Update Patient Profile Base Use Case
  @override
  Future<Either<Failure, Unit>> updatePatientProfile({
    required MainPatientProfile request,
  }) async {
    return await repository.updatePatientProfile(request: request);
  }

//? Send Confirmation Code For Edit Number Use Case
  @override
  Future<Either<Failure, Unit>> sendConfirmationCodeForEditNumber(
      {required String phoneNumber}) async {
    return await repository.sendConfirmationCodeForEditNumber(
        phoneNumber: phoneNumber);
  }
}
