import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_available_days.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_avaliable_time.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_my_reservation.dart';

abstract class ReservationBaseUseCase {
  //? Get All Avaliable Day Base Use Case  :
  Future<Either<Failure, GetAllAvailableDaysEntitie>> getAllAvaliableDay();
  //? Get All Avaliable Time Base Use Case  :
  Future<Either<Failure, GetAllAvailableTimeEntitie>> getAllAvaliableTime({
    required DateTime date,
  });

  //? Create Appoinment Base Use Case  :
  Future<Either<Failure, Unit>> createAppoinment({
    required CreateAppoinmentRequest request,
  });
  //? Get All My Resevation Base Use Case :
  Future<Either<Failure, GetAllMyResrvationEntities>> getAllMyReservation({
    required PaginationEntity paginationEntity,
    required bool isEnded,
  });
}
