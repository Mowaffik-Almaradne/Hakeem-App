class GetAllPatientAttachmnetEntitie {
  GetAllPatientAttachmnetEntitie({
    required this.result,
  });

  final ResultPatientAttachmnet result;

  factory GetAllPatientAttachmnetEntitie.fromJson(Map<String, dynamic> json) {
    return GetAllPatientAttachmnetEntitie(
      result: json["result"] =
          ResultPatientAttachmnet.fromJson(json["result"] ?? {}),
    );
  }
}

class ResultPatientAttachmnet {
  ResultPatientAttachmnet({
    required this.items,
    required this.totalCount,
  });

  final List<PatientAttachmnetItem> items;
  final int totalCount;

  factory ResultPatientAttachmnet.fromJson(Map<String, dynamic> json) {
    return ResultPatientAttachmnet(
      items: json["items"] == null
          ? []
          : List<PatientAttachmnetItem>.from(
              json["items"]!.map((x) => PatientAttachmnetItem.fromJson(x))),
      totalCount: json["totalCount"] ?? 0,
    );
  }
}

class PatientAttachmnetItem {
  PatientAttachmnetItem({
    required this.id,
    required this.fileUrl,
    required this.fileType,
    required this.fileSize,
    required this.patientId,
    required this.fileName,
    required this.creationTime,
  });

  final int id;
  final String fileUrl;
  final String fileType;
  final double fileSize;
  final int patientId;
  final String fileName;
  final DateTime creationTime;

  factory PatientAttachmnetItem.fromJson(Map<String, dynamic> json) {
    return PatientAttachmnetItem(
      id: json["id"] ?? 0,
      fileUrl: json["fileUrl"] ?? "",
      fileType: json["fileType"] ?? "",
      fileSize: json["fileSize"] ?? 0,
      patientId: json["patientId"] ?? 0,
      fileName: json["fileName"] ?? "",
      creationTime: DateTime.tryParse(json["creationTime"]) ?? DateTime(0),
    );
  }
}
