import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/notification/domain/entities/get_all_notification_entities.dart';
import 'package:hosptel_app/features/notification/domain/repositories/notification_repositories.dart';
import 'package:hosptel_app/features/notification/domain/usecases/notification_base_use_case.dart';

class NotificationUseCaseImpl implements NotificationBaseUseCase {
  final NotificationRepositories repository;
  NotificationUseCaseImpl({required this.repository});
  //? Get All Patient Notification Use Case :
  @override
  Future<Either<Failure, GetAllPatientNotificationEntities>>
      getAllPatientNotification(
          {required PaginationEntity paginationEntity}) async {
    return await repository.getAllPatientNotification(
        paginationEntity: paginationEntity);
  }

  //? Set Noti fications As Readed Use Case  :
  @override
  Future<Either<Failure, Unit>> setNotificationsAsReaded({
    required List<int> asReadedNotification,
  }) async {
    return await repository.setNotificationsAsReaded(
        asReadedNotification: asReadedNotification);
  }
}
