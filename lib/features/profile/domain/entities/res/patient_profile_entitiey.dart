class PatientProfileEntitey {
  PatientProfileEntitey({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  final MainPatientProfile result;
  final dynamic targetUrl;
  final bool success;
  final dynamic error;
  final bool unAuthorizedRequest;
  final bool abp;

  factory PatientProfileEntitey.fromJson(Map<String, dynamic> json) {
    return PatientProfileEntitey(
      result: json["result"] =
          MainPatientProfile.fromJson(json["result"] ?? {}),
      targetUrl: json["targetUrl"],
      success: json["success"] ?? false,
      error: json["error"],
      unAuthorizedRequest: json["unAuthorizedRequest"] ?? false,
      abp: json["__abp"] ?? false,
    );
  }
}

class MainPatientProfile {
  MainPatientProfile({
    required this.fullName,
    required this.birthDate,
    required this.phoneNumber,
    required this.gender,
    required this.id,
  });

  String fullName;
  DateTime? birthDate;
  String phoneNumber;
  int gender;
  int id;

  factory MainPatientProfile.fromJson(Map<String, dynamic> json) {
    return MainPatientProfile(
      fullName: json["fullName"] ?? "",
      birthDate: DateTime.tryParse(json["birthDate"] ?? ""),
      phoneNumber: json["phoneNumber"] ?? "",
      gender: json["gender"] ?? 0,
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "birthDate": birthDate?.toIso8601String(),
        "phoneNumber": phoneNumber,
        "gender": gender,
        "id": id,
      };
}
