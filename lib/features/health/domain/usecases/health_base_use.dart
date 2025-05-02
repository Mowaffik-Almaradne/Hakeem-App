import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/health/domain/entities/res/accounts_for_patient_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/medical_session_entites.dart';
import 'package:hosptel_app/features/health/domain/entities/res/patient_attachmnet_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_details_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_get_all_entities.dart';

abstract class HealthBaseUse {
  //? Get All Medical Session Base Use Case :
  Future<Either<Failure, GetAllMedicalSessionEntitie>>
      getAllGetAllMedicalSession({
    required PaginationEntity paginationEntity,
  });
  //? Get All Patient Attachmnet Base Use Case :
  Future<Either<Failure, GetAllPatientAttachmnetEntitie>>
      getAllPatientAttachmnet({
    required PaginationEntity paginationEntity,
  });
  //? Get All Patient Prescription Base Use Case  :
  Future<Either<Failure, GetAllPrescriptionEntities>>
      getAllPatientPrescription({
    required PaginationEntity paginationEntity,
  });
  //? Get All Patient Details Prescription Base Use Case  :
  Future<Either<Failure, GetAllPrescriptionDetailsEntities>>
      getAllPatientDetailsPrescription({
    required int id,
    required PaginationEntity paginationEntity,
  });
  //? Get All Patient Accounts For Patient Base Use Case :
  Future<Either<Failure, GetAllAccountsForPatientEntities>>
      getAllAccountsForPatient({
    required PaginationEntity paginationEntity,
  });
}
