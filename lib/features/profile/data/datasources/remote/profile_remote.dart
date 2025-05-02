import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_delete.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/api/api_methode_post.dart';
import 'package:hosptel_app/core/api/api_methode_put.dart';
import 'package:hosptel_app/core/extenstion/from_json_extenstion.dart';
import 'package:hosptel_app/features/profile/domain/entities/res/patient_profile_entitiey.dart';

abstract class ProfileRemote {
  //? Change Password Remote :
  Future<Unit> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  //? Change Password Remote :
  Future<Unit> editPhonNumber({
    required String phoneNumber,
  });
  //? Confirm Edit PhoneNumber  Remote :
  Future<Unit> confirmEditPhoneNumber({
    required String phoneNumber,
    required String code,
  });
  //? logout Remote :
  Future<Unit> logout();
  //? Delete Account Remote :
  Future<Unit> deleteAccount();
  //? Get Patient Profile Remote
  Future<PatientProfileEntitey> getPatientProfile();
  //? Update Patient Profile Remote
  Future<Unit> updatePatientProfile({
    required MainPatientProfile request,
  });
}

class ProfileRemoteImpl implements ProfileRemote {
  //? Change Password Remote Impl :
  @override
  Future<Unit> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return ApiPostMethods<Unit>().post(
      body: {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      },
      url: ApiPost.changePasswordUrl,
      data: (response) {
        return unit;
      },
    );
  }

  //? Edit Phone Number Remote Impl :
  @override
  Future<Unit> editPhonNumber({required String phoneNumber}) async {
    return ApiPostMethods<Unit>().post(
      query: {
        "phoneNumber": phoneNumber,
      },
      url: ApiPost.editPhoneNumberUrl,
      data: (response) => unit,
    );
  }

  //? Confirm Edit PhoneNumber Remote Impl :
  @override
  Future<Unit> confirmEditPhoneNumber({
    required String phoneNumber,
    required String code,
  }) async {
    return ApiPostMethods<Unit>().post(
      query: {
        "phoneNumber": phoneNumber,
        "code": code,
      },
      url: ApiPost.confirmEditPhoneNumberUrl,
      data: (response) => unit,
    );
  }

//? Logout Remote Impl :
  @override
  Future<Unit> logout() async {
    return ApiPostMethods<Unit>().post(
      url: ApiPost.logoutUrl,
      data: (response) => unit,
    );
  }

//? Delete Remote Impl :
  @override
  Future<Unit> deleteAccount() {
    return ApiDeleteMethods<Unit>().delete(
      url: ApiDelete.deleteAccountUrl,
      data: (response) => unit,
    );
  }

  //? Get Patient Profile Remote Impl :
  @override
  Future<PatientProfileEntitey> getPatientProfile() {
    return ApiGetMethods<PatientProfileEntitey>().get(
      url: ApiGet.getpatientProfileUrl,
      data: (response) => PatientProfileEntitey.fromJson(response.jsonBody),
    );
  }

//? Updata Patient Profile Remote Impl :
  @override
  Future<Unit> updatePatientProfile({required MainPatientProfile request}) {
    return ApiPutMethods<Unit>().put(
      body: request.toJson(),
      url: ApiPut.updatapatientProfileUrl,
      data: (response) => unit,
    );
  }
}
