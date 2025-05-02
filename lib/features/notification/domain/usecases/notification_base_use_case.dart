import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/notification/domain/entities/get_all_notification_entities.dart';

abstract class NotificationBaseUseCase {
  //? Get All Patient Notification Base Use Case :
  Future<Either<Failure, GetAllPatientNotificationEntities>>
      getAllPatientNotification({
    required PaginationEntity paginationEntity,
  });
  //? Set Noti fications As Readed Base Use Case  :
  Future<Either<Failure, Unit>> setNotificationsAsReaded({
    required List<int> asReadedNotification,
  });
}
