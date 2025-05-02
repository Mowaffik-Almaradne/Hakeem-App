import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/health/domain/entities/res/accounts_for_patient_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/medical_session_entites.dart';
import 'package:hosptel_app/features/health/domain/entities/res/patient_attachmnet_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_details_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_get_all_entities.dart';
import 'package:hosptel_app/features/health/domain/repositories/health_repositores.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use.dart';

class HealthUseCase implements HealthBaseUse {
  final HealthRepositores repositores;
  HealthUseCase({required this.repositores});
  //? Get All Medical Session Use Case :
  @override
  Future<Either<Failure, GetAllMedicalSessionEntitie>>
      getAllGetAllMedicalSession({
    required PaginationEntity paginationEntity,
  }) async {
    return await repositores.getAllGetAllMedicalSession(
        paginationEntity: paginationEntity);
  }

  //? Get All Patient Attachmnet  Use Case :
  @override
  Future<Either<Failure, GetAllPatientAttachmnetEntitie>>
      getAllPatientAttachmnet(
          {required PaginationEntity paginationEntity}) async {
    return await repositores.getAllPatientAttachmnet(
        paginationEntity: paginationEntity);
  }

  //? Get All Patient Prescription  Use Case  :
  @override
  Future<Either<Failure, GetAllPrescriptionEntities>> getAllPatientPrescription(
      {required PaginationEntity paginationEntity}) async {
    return await repositores.getAllPatientPrescription(
        paginationEntity: paginationEntity);
  }

  //? Get All Patient Details Prescription Use Case  :
  @override
  Future<Either<Failure, GetAllPrescriptionDetailsEntities>>
      getAllPatientDetailsPrescription(
          {required int id, required PaginationEntity paginationEntity}) async {
    return await repositores.getAllPatientDetailsPrescription(
        id: id, paginationEntity: paginationEntity);
  }

  //? Get All Patient Accounts For Patient Use Case :
  @override
  Future<Either<Failure, GetAllAccountsForPatientEntities>>
      getAllAccountsForPatient(
          {required PaginationEntity paginationEntity}) async {
    return await repositores.getAllAccountsForPatient(
        paginationEntity: paginationEntity);
  }
}
