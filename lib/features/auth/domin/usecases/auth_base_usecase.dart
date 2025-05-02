import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
import 'package:hosptel_app/features/auth/domin/entities/res/login_response_entite.dart';

abstract class AuthBaseUseCase {
  //? Base Use Case  Login :
  Future<Either<Failure, LoginResponseEntitie>> login({
    required String phoneNumber,
    required String password,
  });
  //? Base Use Case  Create Account :
  Future<Either<Failure, Unit>> createAccount({
    required CreateAccoutRequestEntite request,
  });

  //? Base Use ConfirmAccount :
  Future<Either<Failure, Unit>> confirmAccount({
    required String phoneNumber,
    required String code,
  });
  //? Base Use  Resend Code  :
  Future<Either<Failure, Unit>> resendCode({
    required String phoneNumber,
  });

  //? Base Use Forget Password Phone  :
  Future<Either<Failure, Unit>> forgetPasswordPhone({
    required String phoneNumber,
  });
  //? Base Use Confirm Forget Password:
  Future<Either<Failure, Unit>> confirmForgetPassword({
    required String phoneNumber,
    required String code,
  });
  //? Base Use Reset Password :
  Future<Either<Failure, Unit>> resetPassword({
    required String newPassword,
    required String phoneNumber,
    required String code,
  });
}
