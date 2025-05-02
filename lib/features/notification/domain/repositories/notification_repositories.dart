import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/notification/domain/entities/get_all_notification_entities.dart';

abstract class NotificationRepositories {
  //? Get All Patient Notification Repositories :
  Future<Either<Failure, GetAllPatientNotificationEntities>>
      getAllPatientNotification({
    required PaginationEntity paginationEntity,
  });
  //? Set Noti fications As Readed Repositories :
  Future<Either<Failure, Unit>> setNotificationsAsReaded({
    required List<int> asReadedNotification,
  });
}
