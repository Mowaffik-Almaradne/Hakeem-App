class GetGeneralSettingResponseEntity {
  GetGeneralSettingResponseEntity({
    required this.result,
  });

  final ResultGeneralSetting result;

  factory GetGeneralSettingResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetGeneralSettingResponseEntity(
      result: json["result"] =
          ResultGeneralSetting.fromJson(json["result"] ?? {}),
    );
  }
}

class ResultGeneralSetting {
  ResultGeneralSetting({
    required this.isDisplayAttachments,
    required this.isDisplayPrescription,
    required this.isDisplaySessions,
    required this.isDisplayAccounts,
  });

  final bool isDisplayAttachments;
  final bool isDisplayPrescription;
  final bool isDisplaySessions;
  final bool isDisplayAccounts;

  factory ResultGeneralSetting.fromJson(Map<String, dynamic> json) {
    return ResultGeneralSetting(
      isDisplayAttachments: json["isDisplayAttachments"] ?? false,
      isDisplayPrescription: json["isDisplayPrescription"] ?? false,
      isDisplaySessions: json["isDisplaySessions"] ?? false,
      isDisplayAccounts: json["isDisplayAccounts"] ?? false,
    );
  }
}
