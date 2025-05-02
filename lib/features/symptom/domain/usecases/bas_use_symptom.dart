import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/symptom/domain/entities/res/symptom_entitie.dart';

abstract class SymptomBaseUseCase {
  //? Get All Symptom Base Use Case :
  Future<Either<Failure, GetAllSymptomEntitie>> getAllSymptom({
    required PaginationEntity paginationEntity,
  });
}
