import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
import 'package:hosptel_app/features/auth/domin/entities/res/login_response_entite.dart';

abstract class AuthRepository {
  //? Repository Login :
  Future<Either<Failure, LoginResponseEntitie>> login({
    required String phoneNumber,
    required String password,
  });
  //? Repository Create Account :
  Future<Either<Failure, Unit>> createAccount({
    required CreateAccoutRequestEntite request,
  });

  //? Repository ConfirmAccount :
  Future<Either<Failure, Unit>> confirmAccount({
    required String phoneNumber,
    required String code,
  });
  //? Repository Resend Code  :
  Future<Either<Failure, Unit>> resendCode({
    required String phoneNumber,
  });
  //? Repository Forget Password Phone  :
  Future<Either<Failure, Unit>> forgetPasswordPhone({
    required String phoneNumber,
  });
  //? Repository Confirm Forget Password:
  Future<Either<Failure, Unit>> confirmForgetPassword({
    required String phoneNumber,
    required String code,
  });
  //? Repository Reset Password :
  Future<Either<Failure, Unit>> resetPassword({
    required String newPassword,
    required String phoneNumber,
    required String code,
  });
}
