class GetAllPatientNotificationEntities {
  GetAllPatientNotificationEntities({
    required this.result,
  });
  final PatientNotificationResult result;
  factory GetAllPatientNotificationEntities.fromJson(
      Map<String, dynamic> json) {
    return GetAllPatientNotificationEntities(
      result: json["result"] =
          PatientNotificationResult.fromJson(json["result"] ?? {}),
    );
  }
}

class PatientNotificationResult {
  PatientNotificationResult({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<PatientNotification> items;

  factory PatientNotificationResult.fromJson(Map<String, dynamic> json) {
    return PatientNotificationResult(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<PatientNotification>.from(
              json["items"]?.map((x) => PatientNotification.fromJson(x))),
    );
  }
}

class PatientNotification {
  PatientNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.isReaded,
    required this.creationTime,
  });

  final int id;
  final String title;
  final String body;
  final bool isReaded;
  final DateTime creationTime;

  factory PatientNotification.fromJson(Map<String, dynamic> json) {
    return PatientNotification(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      body: json["body"] ?? "",
      isReaded: json["isReaded"] ?? false,
      creationTime: DateTime.tryParse(json["creationTime"]) ?? DateTime(0),
    );
  }
}
