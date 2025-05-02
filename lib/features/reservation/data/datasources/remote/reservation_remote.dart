import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/api/api_methode_post.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/extenstion/from_json_extenstion.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_available_days.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_avaliable_time.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_my_reservation.dart';

abstract class ReservationRemote {
  //? Get All Avaliable Day Remote :
  Future<GetAllAvailableDaysEntitie> getAllAvaliableDay();
  //? Get All Avaliable Time Remote :
  Future<GetAllAvailableTimeEntitie> getAllAvaliableTime({
    required DateTime date,
  });
  //? Create Appoinment Remote  :
  Future<Unit> createAppoinment({
    required CreateAppoinmentRequest request,
  });
  //? Get All My Resevation Remote :
  Future<GetAllMyResrvationEntities> getAllMyReservation({
    required PaginationEntity paginationEntity,
    required bool isEnded,
  });
}

class ReservationRemoteImpl implements ReservationRemote {
  @override
//? Get All Avaliable Day Remote Impl  :
  Future<GetAllAvailableDaysEntitie> getAllAvaliableDay() async {
    return ApiGetMethods<GetAllAvailableDaysEntitie>().get(
      url: ApiGet.getAllAvailableDays,
      data: (response) =>
          GetAllAvailableDaysEntitie.fromJson(response.jsonBody),
    );
  }

//? Get All Avaliable Time Remote Impl  :
  @override
  Future<GetAllAvailableTimeEntitie> getAllAvaliableTime({
    required DateTime date,
  }) {
    return ApiGetMethods<GetAllAvailableTimeEntitie>().get(
      query: {
        "date": date.toString(),
      },
      url: ApiGet.getAllAvailableTimesForDay,
      data: (response) =>
          GetAllAvailableTimeEntitie.fromJson(response.jsonBody),
    );
  }

  //? Create Appoinment Remote Impl :
  @override
  Future<Unit> createAppoinment(
      {required CreateAppoinmentRequest request}) async {
    return ApiPostMethods<Unit>().post(
      body: request.toJson(),
      url: ApiPost.createAppointmentUrl,
      data: (response) => unit,
    );
  }

  //? Get All My Resevation Remote Impl:
  @override
  Future<GetAllMyResrvationEntities> getAllMyReservation({
    required PaginationEntity paginationEntity,
    required bool isEnded,
  }) {
    return ApiGetMethods<GetAllMyResrvationEntities>().get(
      query: {
        "IsEnded": isEnded,
        "SkipCount": paginationEntity.skipCount,
        "MaxResultCount": paginationEntity.maxResultCount,
      },
      url: ApiGet.getAllMyReservation,
      data: (response) =>
          GetAllMyResrvationEntities.fromJson(response.jsonBody),
    );
  }
}
