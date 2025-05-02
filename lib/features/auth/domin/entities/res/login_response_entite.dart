class LoginResponseEntitie {
  LoginResponseEntitie({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  final LoginEntities? result;
  final dynamic targetUrl;
  final bool success;
  final dynamic error;
  final bool unAuthorizedRequest;
  final bool abp;

  factory LoginResponseEntitie.fromJson(Map<String, dynamic> json) {
    return LoginResponseEntitie(
      result: json["result"] == null
          ? null
          : LoginEntities.fromJson(json["result"]),
      targetUrl: json["targetUrl"],
      success: json["success"] ?? false,
      error: json["error"],
      unAuthorizedRequest: json["unAuthorizedRequest"] ?? false,
      abp: json["__abp"] ?? false,
    );
  }
}

class LoginEntities {
  LoginEntities({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.userId,
  });

  String accessToken;
  int userId;
  final String encryptedAccessToken;
  final int expireInSeconds;

  factory LoginEntities.fromJson(Map<String, dynamic> json) {
    return LoginEntities(
      accessToken: json["accessToken"] ?? "",
      encryptedAccessToken: json["encryptedAccessToken"] ?? "",
      expireInSeconds: json["expireInSeconds"] ?? 0,
      userId: json["userId"] ?? 0,
    );
  }
}
