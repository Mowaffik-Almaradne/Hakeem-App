import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/extenstion/from_json_extenstion.dart';
import 'package:hosptel_app/features/health/domain/entities/res/accounts_for_patient_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/medical_session_entites.dart';
import 'package:hosptel_app/features/health/domain/entities/res/patient_attachmnet_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_details_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_get_all_entities.dart';

abstract class HealthRemote {
  //? Get ALL Medical Session Remote :
  Future<GetAllMedicalSessionEntitie> getAllGetAllMedicalSession({
    required PaginationEntity paginationEntity,
  });
  //? Get ALL Patient Attachmnet Remote :
  Future<GetAllPatientAttachmnetEntitie> getAllPatientAttachmnet({
    required PaginationEntity paginationEntity,
  });
  //? Get All Patient Prescription Remote :
  Future<GetAllPrescriptionEntities> getAllPatientPrescription({
    required PaginationEntity paginationEntity,
  });
  //? Get All Patient Prescription Details Remote :
  Future<GetAllPrescriptionDetailsEntities> getAllPatientDetailsPrescription(
      {required int id, required PaginationEntity paginationEntity});
  //? Get All Patient Accounts For Patient Remote :
  Future<GetAllAccountsForPatientEntities> getAllAccountsForPatient(
      {required PaginationEntity paginationEntity});
}

class HealthRemoteImpl implements HealthRemote {
  //? Get ALL Medical Session Remote Impl  :
  @override
  Future<GetAllMedicalSessionEntitie> getAllGetAllMedicalSession({
    required PaginationEntity paginationEntity,
  }) async {
    return ApiGetMethods<GetAllMedicalSessionEntitie>().get(
      query: {
        "SkipCount": paginationEntity.skipCount,
        "MaxResultCount": paginationEntity.maxResultCount,
      },
      url: ApiGet.getAllmedicalSessionUrl,
      data: (response) =>
          GetAllMedicalSessionEntitie.fromJson(response.jsonBody),
    );
  }

  //? Get ALL Patient Attachmnet Remote Impl  :
  @override
  Future<GetAllPatientAttachmnetEntitie> getAllPatientAttachmnet(
      {required PaginationEntity paginationEntity}) async {
    return ApiGetMethods<GetAllPatientAttachmnetEntitie>().get(
      query: {
        "SkipCount": paginationEntity.skipCount,
        "MaxResultCount": paginationEntity.maxResultCount,
      },
      url: ApiGet.getAllPatientAttachmnetUrl,
      data: (response) =>
          GetAllPatientAttachmnetEntitie.fromJson(response.jsonBody),
    );
  }
  //? Get All Patient Prescription Remote Impl :

  @override
  Future<GetAllPrescriptionEntities> getAllPatientPrescription(
      {required PaginationEntity paginationEntity}) async {
    return ApiGetMethods<GetAllPrescriptionEntities>().get(
      query: {
        "SkipCount": paginationEntity.skipCount,
        "MaxResultCount": paginationEntity.maxResultCount,
      },
      url: ApiGet.getAllprescriptionUrl,
      data: (response) =>
          GetAllPrescriptionEntities.fromJson(response.jsonBody),
    );
  }

//? Get All Patient Prescription Details Remote Impl :
  @override
  Future<GetAllPrescriptionDetailsEntities> getAllPatientDetailsPrescription({
    required int id,
    required PaginationEntity paginationEntity,
  }) {
    return ApiGetMethods<GetAllPrescriptionDetailsEntities>().get(
      query: {
        "PrescriptionId": id,
        "SkipCount": paginationEntity.skipCount,
        "MaxResultCount": paginationEntity.maxResultCount,
      },
      url: ApiGet.getAllprescriptionDetailsUrl,
      data: (response) =>
          GetAllPrescriptionDetailsEntities.fromJson(response.jsonBody),
    );
  }

  //? Get All Patient Accounts For Patient Remote Impl:
  @override
  Future<GetAllAccountsForPatientEntities> getAllAccountsForPatient(
      {required PaginationEntity paginationEntity}) async {
    return ApiGetMethods<GetAllAccountsForPatientEntities>().get(
      query: {
        "SkipCount": paginationEntity.skipCount,
        "MaxResultCount": paginationEntity.maxResultCount,
      },
      url: ApiGet.getAllAccountsForPatientUrl,
      data: (response) =>
          GetAllAccountsForPatientEntities.fromJson(response.jsonBody),
    );
  }
}
