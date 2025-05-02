import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_available_days.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_avaliable_time.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_my_reservation.dart';

abstract class ReservationRepository {
  //? Get All Avaliable Day Repository :
  Future<Either<Failure, GetAllAvailableDaysEntitie>> getAllAvaliableDay();
  //? Get All Avaliable Time Repository :
  Future<Either<Failure, GetAllAvailableTimeEntitie>> getAllAvaliableTime({
    required DateTime date,
  });
  //? Create Appoinment Repositoy :
  Future<Either<Failure, Unit>> createAppoinment({
    required CreateAppoinmentRequest request,
  });

  //? Get All My Resevation Repositoy :
  Future<Either<Failure, GetAllMyResrvationEntities>> getAllMyReservation({
    required PaginationEntity paginationEntity,
    required bool isEnded,
  });
}
