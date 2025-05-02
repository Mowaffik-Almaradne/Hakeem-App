import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/symptom/data/datasources/remote/symptom_remote.dart';
import 'package:hosptel_app/features/symptom/domain/entities/res/symptom_entitie.dart';
import 'package:hosptel_app/features/symptom/domain/repositories/symptom_repositories.dart';

class SymptomRepositoriesImpl implements SymptomRepositories {
  final SymptomRemote remote;
  SymptomRepositoriesImpl({required this.remote});
  //? Get All Symptom Repositories Impl :
  @override
  Future<Either<Failure, GetAllSymptomEntitie>> getAllSymptom({
    required PaginationEntity paginationEntity,
  }) async {
    return CheckNet<GetAllSymptomEntitie>().checkNetResponse(
      tryRight: () async {
        final data =
            await remote.getAllSymptom(paginationEntity: paginationEntity);
        return Right(data);
      },
    );
  }
}
