import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  //? Send Confirmation Code For Edit Number Remote
  Future<Unit> sendConfirmationCodeForEditNumber({
    required String phoneNumber,
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
    final firebaseMessaging = FirebaseMessaging.instance;
    String tokenDevice = await firebaseMessaging.getToken() ?? "";
    return ApiPostMethods<Unit>().post(
      body: {
        "firebaseToken": tokenDevice,
      },
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

  @override
  Future<Unit> sendConfirmationCodeForEditNumber(
      {required String phoneNumber}) async {
    return ApiPostMethods<Unit>().post(
      query: {"phoneNumber": phoneNumber},
      url: ApiPost.sendConfirmationCodeForEditNumberUrl,
      data: (response) => unit,
    );
  }
}
