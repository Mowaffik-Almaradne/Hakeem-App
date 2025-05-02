import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/services/domain/entities/res/get_all_services_entitie.dart';
import 'package:hosptel_app/features/services/domain/repositories/services_repositories.dart';
import 'package:hosptel_app/features/services/domain/usecases/services_base_case.dart';

class ServicesUseCaseImpl implements ServicesBaseCase {
  final ServicesRepositories repositories;
  ServicesUseCaseImpl({required this.repositories});
  //? Get All Services Use Case  :
  @override
  Future<Either<Failure, GetAllServicesEntitie>> getAllServices({
    required PaginationEntity pagination,
  }) async {
    return await repositories.getAllServices(pagination: pagination);
  }
}
