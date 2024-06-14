import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
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
}
