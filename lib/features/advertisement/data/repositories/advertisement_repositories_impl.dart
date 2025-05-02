import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/advertisement/data/datasources/remote/advertisement_remote.dart';
import 'package:hosptel_app/features/advertisement/domain/entities/res/advertisement_entities.dart';
import 'package:hosptel_app/features/advertisement/domain/repositories/advertisement_repositories.dart';

class AdvertisementRepositoriesImpl implements AdvertisementRepositories {
  final AdvertisementRemote remote;
  AdvertisementRepositoriesImpl({required this.remote});
  @override
  //? Get All  Advertisement Repositories Impl :
  Future<Either<Failure, GetAllAdvertisementEntitie>> getAllAdvertisement({
    required PaginationEntity paginationEntity,
  }) async {
    return CheckNet<GetAllAdvertisementEntitie>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllAdvertisement(
            paginationEntity: paginationEntity);
        return Right(data);
      },
    );
  }
}
