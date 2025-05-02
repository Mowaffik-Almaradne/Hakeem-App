import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/services/data/datasources/remote/services_remote.dart';
import 'package:hosptel_app/features/services/domain/entities/res/get_all_services_entitie.dart';
import 'package:hosptel_app/features/services/domain/repositories/services_repositories.dart';

class ServicesRepositoriesImpl implements ServicesRepositories {
  final ServicesRemote remote;
  ServicesRepositoriesImpl({required this.remote});
  //? Get All Services Repositories Impl  :
  @override
  Future<Either<Failure, GetAllServicesEntitie>> getAllServices({
    required PaginationEntity pagination,
  }) async {
    return await CheckNet<GetAllServicesEntitie>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllServices(pagination: pagination);
        return Right(data);
      },
    );
  }
}
