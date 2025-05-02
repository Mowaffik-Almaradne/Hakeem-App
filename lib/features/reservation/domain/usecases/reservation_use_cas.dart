import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_available_days.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_avaliable_time.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_my_reservation.dart';
import 'package:hosptel_app/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/resrvation_base_use.dart';

class ReservationUseCaseImpl implements ReservationBaseUseCase {
  final ReservationRepository repository;
  ReservationUseCaseImpl({required this.repository});
  //? Get All Avaliable Day Use Case  :
  @override
  Future<Either<Failure, GetAllAvailableDaysEntitie>>
      getAllAvaliableDay() async {
    return await repository.getAllAvaliableDay();
  }

  //? Get All Avaliable Time Use Case
  @override
  Future<Either<Failure, GetAllAvailableTimeEntitie>> getAllAvaliableTime({
    required DateTime date,
  }) async {
    return await repository.getAllAvaliableTime(date: date);
  }

  //? Create Appoinment Use Case :
  @override
  Future<Either<Failure, Unit>> createAppoinment({
    required CreateAppoinmentRequest request,
  }) async {
    return await repository.createAppoinment(request: request);
  }

  //? Get All My Resevation Use Case :
  @override
  Future<Either<Failure, GetAllMyResrvationEntities>> getAllMyReservation({
    required PaginationEntity paginationEntity,
    required bool isEnded,
  }) async {
    return await repository.getAllMyReservation(
      paginationEntity: paginationEntity,
      isEnded: isEnded,
    );
  }
}
