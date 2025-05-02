import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/health/domain/entities/res/accounts_for_patient_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/medical_session_entites.dart';
import 'package:hosptel_app/features/health/domain/entities/res/patient_attachmnet_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_details_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_get_all_entities.dart';

abstract class HealthRepositores {
  //? Get All Medical Session Repositories :
  Future<Either<Failure, GetAllMedicalSessionEntitie>>
      getAllGetAllMedicalSession({
    required PaginationEntity paginationEntity,
  });
  //? Get All Patient Attachmnet Repositories :
  Future<Either<Failure, GetAllPatientAttachmnetEntitie>>
      getAllPatientAttachmnet({
    required PaginationEntity paginationEntity,
  });
  //? Get All Patient Prescription Repositories :
  Future<Either<Failure, GetAllPrescriptionEntities>>
      getAllPatientPrescription({
    required PaginationEntity paginationEntity,
  });
  //? Get All Patient Details Prescription Repositories :
  Future<Either<Failure, GetAllPrescriptionDetailsEntities>>
      getAllPatientDetailsPrescription({
    required int id,
    required PaginationEntity paginationEntity,
  });
  //? Get All Patient Accounts For Patient Repositories :
  Future<Either<Failure, GetAllAccountsForPatientEntities>>
      getAllAccountsForPatient({
    required PaginationEntity paginationEntity,
  });
}
