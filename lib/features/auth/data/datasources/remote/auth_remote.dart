import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_post.dart';
import 'package:hosptel_app/core/extenstion/from_json_extenstion.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
import 'package:hosptel_app/features/auth/domin/entities/res/login_response_entite.dart';

abstract class AuthRemote {
  //? Login Remote :
  Future<LoginResponseEntitie> login({
    required String phoneNumber,
    required String password,
  });
  //? Create Account Remot :
  Future<Unit> createAccount({
    required CreateAccoutRequestEntite request,
  });
  //? Confirm Account Remot :
  Future<Unit> confirmAccount({
    required String phoneNumber,
    required String code,
  });
  //? Resend Code Remot :
  Future<Unit> resendCode({
    required String phoneNumber,
  });
  //? Forget Password Phone Remote :
  Future<Unit> forgetPasswordPhone({
    required String phoneNumber,
  });
  //? Confirm Forget Password Remote :
  Future<Unit> confirmForgetPassword({
    required String phoneNumber,
    required String code,
  });
  //? Reset Password Remote :
  Future<Unit> resetPassword({
    required String newPassword,
    required String phoneNumber,
    required String code,
  });
}

class AuthRemoteImpl implements AuthRemote {
  //? Create Account Remote Impl :
  @override
  Future<Unit> createAccount({
    required CreateAccoutRequestEntite request,
  }) async {
    return ApiPostMethods<Unit>().post(
      body: request.toJson(),
      url: ApiPost.createAccount,
      data: (response) => unit,
    );
  }

//? confirm Account Impl :
  @override
  Future<Unit> confirmAccount({
    required String phoneNumber,
    required String code,
  }) async {
    return ApiPostMethods<Unit>().post(
      query: {
        "phoneNumber": phoneNumber,
        "code": code,
      },
      url: ApiPost.confirmPatientAccount,
      data: (response) => unit,
    );
  }

//? Login Remote Impl :
  @override
  Future<LoginResponseEntitie> login({
    required String phoneNumber,
    required String password,
  }) async {
    final firebaseMessaging = FirebaseMessaging.instance;
    String tokenDevice = await firebaseMessaging.getToken() ?? "";
    return ApiPostMethods<LoginResponseEntitie>().post(
      body: {
        "password": password,
        "phoneNumber": phoneNumber,
        "firebaseToken": tokenDevice,
      },
      url: ApiPost.login,
      data: (response) => LoginResponseEntitie.fromJson(response.jsonBody),
    );
  }

//? Resend Remote Impl :
  @override
  Future<Unit> resendCode({required String phoneNumber}) {
    return ApiPostMethods<Unit>().post(
      query: {
        "phoneNumber": phoneNumber,
      },
      url: ApiPost.resendCodeUrl,
      data: (response) => unit,
    );
  }

//? Confirm Forget Password Remote Impl :
  @override
  Future<Unit> confirmForgetPassword({
    required String phoneNumber,
    required String code,
  }) async {
    return ApiPostMethods<Unit>().post(
      query: {
        "phoneNumber": phoneNumber,
        "code": code,
      },
      url: ApiPost.confirmForgetPassword,
      data: (response) => unit,
    );
  }

//? Forget Password Phone Remote Impl :
  @override
  Future<Unit> forgetPasswordPhone({required String phoneNumber}) {
    return ApiPostMethods<Unit>().post(
      query: {
        "phoneNumber": phoneNumber,
      },
      url: ApiPost.forgetPasswordPhone,
      data: (response) => unit,
    );
  }

  @override
  Future<Unit> resetPassword({
    required String newPassword,
    required String phoneNumber,
    required String code,
  }) {
    return ApiPostMethods<Unit>().post(
      body: {
        "phoneNumber": phoneNumber,
        "code": code,
        "newPassword": newPassword,
      },
      url: ApiPost.resetPasswordUrl,
      data: (response) => unit,
    );
  }
}
