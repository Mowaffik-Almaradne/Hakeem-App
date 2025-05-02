import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/advertisement/domain/entities/res/advertisement_entities.dart';
import 'package:hosptel_app/features/advertisement/domain/repositories/advertisement_repositories.dart';
import 'package:hosptel_app/features/advertisement/domain/usecases/advertisement_base_case.dart';

class AdvertisementUseCaseImpl implements AdvertisementBaseCase {
  final AdvertisementRepositories repositories;
  AdvertisementUseCaseImpl({required this.repositories});
  //? Get All  Advertisement  Use Case :
  @override
  Future<Either<Failure, GetAllAdvertisementEntitie>> getAllAdvertisement({
    required PaginationEntity paginationEntity,
  }) async {
    return await repositories.getAllAdvertisement(
        paginationEntity: paginationEntity);
  }
}
