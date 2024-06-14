import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/auth/data/datasources/remote/auth_remote.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
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
}
