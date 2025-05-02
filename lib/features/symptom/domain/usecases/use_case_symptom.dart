import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/symptom/domain/entities/res/symptom_entitie.dart';
import 'package:hosptel_app/features/symptom/domain/repositories/symptom_repositories.dart';
import 'package:hosptel_app/features/symptom/domain/usecases/bas_use_symptom.dart';

class SymptomUseCaseImpl implements SymptomBaseUseCase {
  final SymptomRepositories repositories;
  SymptomUseCaseImpl({required this.repositories});
  //? Get All Symptom Use Case Impl :
  @override
  Future<Either<Failure, GetAllSymptomEntitie>> getAllSymptom({
    required PaginationEntity paginationEntity,
  }) async {
    return await repositories.getAllSymptom(paginationEntity: paginationEntity);
  }
}
