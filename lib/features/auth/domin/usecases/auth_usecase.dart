import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
import 'package:hosptel_app/features/auth/domin/entities/res/login_response_entite.dart';
import 'package:hosptel_app/features/auth/domin/repository/auth_repository.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';

class AuthUseCaseImpl implements AuthBaseUseCase {
  final AuthRepository repository;

  AuthUseCaseImpl({required this.repository});
  //? Use Case Crate Account :
  @override
  Future<Either<Failure, Unit>> createAccount({
    required CreateAccoutRequestEntite request,
  }) async {
    return await repository.createAccount(request: request);
  }

//? Use Case confirm Account :
  @override
  Future<Either<Failure, Unit>> confirmAccount({
    required String phoneNumber,
    required String code,
  }) async {
    return await repository.confirmAccount(
      phoneNumber: phoneNumber,
      code: code,
    );
  }

  //? Use Case Login :
  @override
  Future<Either<Failure, LoginResponseEntitie>> login({
    required String phoneNumber,
    required String password,
  }) async {
    return await repository.login(phoneNumber: phoneNumber, password: password);
  }

  //? Use Case Resend Code :
  @override
  Future<Either<Failure, Unit>> resendCode({
    required String phoneNumber,
  }) async {
    return await repository.resendCode(phoneNumber: phoneNumber);
  }

//? Use Case Confirm Forget Password:
  @override
  Future<Either<Failure, Unit>> confirmForgetPassword({
    required String phoneNumber,
    required String code,
  }) async {
    return await repository.confirmForgetPassword(
        phoneNumber: phoneNumber, code: code);
  }

//? Use Case Forget Password Phone  :
  @override
  Future<Either<Failure, Unit>> forgetPasswordPhone({
    required String phoneNumber,
  }) async {
    return await repository.forgetPasswordPhone(phoneNumber: phoneNumber);
  }

//? Use Case Reset Password  :
  @override
  Future<Either<Failure, Unit>> resetPassword({
    required String newPassword,
    required String phoneNumber,
    required String code,
  }) async {
    return await repository.resetPassword(
        newPassword: newPassword, phoneNumber: phoneNumber, code: code);
  }
}
