import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/health/data/datasources/remote/health_remote.dart';
import 'package:hosptel_app/features/health/domain/entities/res/accounts_for_patient_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/medical_session_entites.dart';
import 'package:hosptel_app/features/health/domain/entities/res/patient_attachmnet_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_details_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_get_all_entities.dart';
import 'package:hosptel_app/features/health/domain/repositories/health_repositores.dart';

class HealthRepositoriesImpl implements HealthRepositores {
  final HealthRemote remote;
  HealthRepositoriesImpl({required this.remote});
  //? Get All Medical Session Repositories Impl  :
  @override
  Future<Either<Failure, GetAllMedicalSessionEntitie>>
      getAllGetAllMedicalSession({
    required PaginationEntity paginationEntity,
  }) async {
    return await CheckNet<GetAllMedicalSessionEntitie>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllGetAllMedicalSession(
            paginationEntity: paginationEntity);
        return Right(data);
      },
    );
  }

//? Get All Patient Attachmnet Repositories Impl :
  @override
  Future<Either<Failure, GetAllPatientAttachmnetEntitie>>
      getAllPatientAttachmnet(
          {required PaginationEntity paginationEntity}) async {
    return await CheckNet<GetAllPatientAttachmnetEntitie>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllPatientAttachmnet(
            paginationEntity: paginationEntity);
        return Right(data);
      },
    );
  }
  //? Get All Patient Prescription Repositories Impl :

  @override
  Future<Either<Failure, GetAllPrescriptionEntities>> getAllPatientPrescription(
      {required PaginationEntity paginationEntity}) async {
    return await CheckNet<GetAllPrescriptionEntities>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllPatientPrescription(
            paginationEntity: paginationEntity);
        return Right(data);
      },
    );
  }

//? Get All Patient Prescription Details Repositories Impl :
  @override
  Future<Either<Failure, GetAllPrescriptionDetailsEntities>>
      getAllPatientDetailsPrescription({
    required int id,
    required PaginationEntity paginationEntity,
  }) async {
    return await CheckNet<GetAllPrescriptionDetailsEntities>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllPatientDetailsPrescription(
          paginationEntity: paginationEntity,
          id: id,
        );
        return Right(data);
      },
    );
  }

  //? Get All Patient Accounts For Patient Repositories Impl :
  @override
  Future<Either<Failure, GetAllAccountsForPatientEntities>>
      getAllAccountsForPatient(
          {required PaginationEntity paginationEntity}) async {
    return await CheckNet<GetAllAccountsForPatientEntities>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getAllAccountsForPatient(
            paginationEntity: paginationEntity);
        return Right(data);
      },
    );
  }
}
