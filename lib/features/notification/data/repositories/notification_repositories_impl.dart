import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/notification/data/datasources/remote/notification_remote.dart';
import 'package:hosptel_app/features/notification/domain/entities/get_all_notification_entities.dart';
import 'package:hosptel_app/features/notification/domain/repositories/notification_repositories.dart';

class NotificationRepositoriesImpl implements NotificationRepositories {
  final NotificationRemote remote;
  NotificationRepositoriesImpl({required this.remote});
//? Get All Patient Notification Repositories Impl:
  @override
  Future<Either<Failure, GetAllPatientNotificationEntities>>
      getAllPatientNotification({
    required PaginationEntity paginationEntity,
  }) async {
    return await CheckNet<GetAllPatientNotificationEntities>().checkNetResponse(
      tryRight: () async {
        final res = await remote.getAllPatientNotification(
          paginationEntity: paginationEntity,
        );
        return Right(res);
      },
    );
  }
  //? Set Noti fications As Readed Repositories Impl :

  @override
  Future<Either<Failure, Unit>> setNotificationsAsReaded({
    required List<int> asReadedNotification,
  }) async {
    return await CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final res = await remote.setNotificationsAsReaded(
          asReadedNotification: asReadedNotification,
        );
        return Right(res);
      },
    );
  }
}
