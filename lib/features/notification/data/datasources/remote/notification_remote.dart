import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/api/api_methode_post.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/extenstion/from_json_extenstion.dart';
import 'package:hosptel_app/features/notification/domain/entities/get_all_notification_entities.dart';

abstract class NotificationRemote {
  //? Get All Patient Notification Remote :
  Future<GetAllPatientNotificationEntities> getAllPatientNotification({
    required PaginationEntity paginationEntity,
  });
  //? Set Noti fications As Readed Remote  :
  Future<Unit> setNotificationsAsReaded({
    required List<int> asReadedNotification,
  });
}

class NotificationRemoteImpl implements NotificationRemote {
  //? Get All Patient Notification Remote Impl:
  @override
  Future<GetAllPatientNotificationEntities> getAllPatientNotification({
    required PaginationEntity paginationEntity,
  }) async {
    return ApiGetMethods<GetAllPatientNotificationEntities>().get(
      query: {
        "SkipCount": paginationEntity.skipCount,
        "MaxResultCount": paginationEntity.maxResultCount,
      },
      url: ApiGet.getAllPatientNotification,
      data: (response) =>
          GetAllPatientNotificationEntities.fromJson(response.jsonBody),
    );
  }

  //? Set Noti fications As Readed Remote :
  @override
  Future<Unit> setNotificationsAsReaded({
    required List<int> asReadedNotification,
  }) async {
    return ApiPostMethods<Unit>().post(
      body: asReadedNotification,
      url: ApiPost.setNotificationsAsReadedUrl,
      data: (response) => unit,
    );
  }
}
