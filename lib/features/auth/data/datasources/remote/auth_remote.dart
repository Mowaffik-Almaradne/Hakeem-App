import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_post.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
abstract class AuthRemote {
  //? Create Account Remot :
  Future<Unit> createAccount({
    required CreateAccoutRequestEntite request,
  });
  //? Confirm Account Remot :
  Future<Unit> confirmAccount({
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
}
