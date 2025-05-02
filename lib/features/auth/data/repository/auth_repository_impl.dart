import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/auth/data/datasources/remote/auth_remote.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
import 'package:hosptel_app/features/auth/domin/entities/res/login_response_entite.dart';
import 'package:hosptel_app/features/auth/domin/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemote remote;

  AuthRepositoryImpl({required this.remote});
  //?  Create Account Repository Impl :
  @override
  Future<Either<Failure, Unit>> createAccount({
    required CreateAccoutRequestEntite request,
  }) async {
    return CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.createAccount(request: request);
        return Right(data);
      },
    );
  }

//? Confirm Account Repository Impl :
  @override
  Future<Either<Failure, Unit>> confirmAccount({
    required String phoneNumber,
    required String code,
  }) async {
    return CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.confirmAccount(
          phoneNumber: phoneNumber,
          code: code,
        );
        return Right(data);
      },
    );
  }

//? Login Repository Impl :
  @override
  Future<Either<Failure, LoginResponseEntitie>> login({
    required String phoneNumber,
    required String password,
  }) async {
    return CheckNet<LoginResponseEntitie>().checkNetResponse(
      tryRight: () async {
        final data =
            await remote.login(phoneNumber: phoneNumber, password: password);
        return Right(data);
      },
    );
  }

  //? Resend Code Repository Impl :
  @override
  Future<Either<Failure, Unit>> resendCode({
    required String phoneNumber,
  }) async {
    return CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.resendCode(phoneNumber: phoneNumber);
        return Right(data);
      },
    );
  }

//? Confirm Forget Password Repository Impl :
  @override
  Future<Either<Failure, Unit>> confirmForgetPassword({
    required String phoneNumber,
    required String code,
  }) async {
    return CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.confirmForgetPassword(
            phoneNumber: phoneNumber, code: code);
        return Right(data);
      },
    );
  }

//? Forget Password Phone Repository Impl :
  @override
  Future<Either<Failure, Unit>> forgetPasswordPhone({
    required String phoneNumber,
  }) async {
    return CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.forgetPasswordPhone(phoneNumber: phoneNumber);
        return Right(data);
      },
    );
  }

  //? Reset Password Repository Impl :
  @override
  Future<Either<Failure, Unit>> resetPassword({
    required String newPassword,
    required String phoneNumber,
    required String code,
  }) async {
    return CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.resetPassword(
          newPassword: newPassword,
          phoneNumber: phoneNumber,
          code: code,
        );
        return Right(data);
      },
    );
  }
}
