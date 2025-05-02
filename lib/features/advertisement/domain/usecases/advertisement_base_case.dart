import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/advertisement/domain/entities/res/advertisement_entities.dart';

abstract class AdvertisementBaseCase {
  //? Get All  Advertisement Base Use Case :
  Future<Either<Failure, GetAllAdvertisementEntitie>> getAllAdvertisement({
    required PaginationEntity paginationEntity,
  });
}
