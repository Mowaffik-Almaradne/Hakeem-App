import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/services/domain/entities/res/get_all_services_entitie.dart';

abstract class ServicesRepositories {
  //? Get All Services Repositories :
  Future<Either<Failure, GetAllServicesEntitie>> getAllServices({
    required PaginationEntity pagination,
  });
}
