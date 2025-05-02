import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/reservation/data/datasources/remote/reservation_remote.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_available_days.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_avaliable_time.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_my_reservation.dart';
import 'package:hosptel_app/features/reservation/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationRemote remote;
  ReservationRepositoryImpl({required this.remote});
  //? Get All Avaliable Day Repository Impl :
  @override
  Future<Either<Failure, GetAllAvailableDaysEntitie>>
      getAllAvaliableDay() async {
    return CheckNet<GetAllAvailableDaysEntitie>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllAvaliableDay();
        return Right(data);
      },
    );
  }

//? Get All Avaliable Time Repository Impl :
  @override
  Future<Either<Failure, GetAllAvailableTimeEntitie>> getAllAvaliableTime({
    required DateTime date,
  }) {
    return CheckNet<GetAllAvailableTimeEntitie>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllAvaliableTime(date: date);
        return Right(data);
      },
    );
  }

//? Create Appoinment Repositoy Impl:
  @override
  Future<Either<Failure, Unit>> createAppoinment({
    required CreateAppoinmentRequest request,
  }) {
    return CheckNet<Unit>().checkNetResponse(
      tryRight: () async {
        final data = await remote.createAppoinment(request: request);
        return Right(data);
      },
    );
  }

  //? Get All My Resevation Repositories Impl:
  @override
  Future<Either<Failure, GetAllMyResrvationEntities>> getAllMyReservation(
      {required PaginationEntity paginationEntity,
      required bool isEnded}) async {
    return CheckNet<GetAllMyResrvationEntities>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllMyReservation(
            paginationEntity: paginationEntity, isEnded: isEnded);
        return Right(data);
      },
    );
  }
}
