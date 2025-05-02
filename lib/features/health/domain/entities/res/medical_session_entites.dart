class GetAllMedicalSessionEntitie {
  GetAllMedicalSessionEntitie({
    required this.result,
  });

  final Result result;
  factory GetAllMedicalSessionEntitie.fromJson(Map<String, dynamic> json) {
    return GetAllMedicalSessionEntitie(
      result: json["result"] = Result.fromJson(json["result"] ?? {}),
    );
  }
}
class Result {
  Result({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<MedicalSessionItem> items;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<MedicalSessionItem>.from(
              json["items"]!.map((x) => MedicalSessionItem.fromJson(x))),
    );
  }
}

class MedicalSessionItem {
  MedicalSessionItem({
    required this.id,
    required this.creationTime,
    required this.appointmentStartTime,
  });

  final int id;
  final DateTime creationTime;
  final String appointmentStartTime;

  factory MedicalSessionItem.fromJson(Map<String, dynamic> json) {
    return MedicalSessionItem(
      id: json["id"] ?? 0,
      creationTime:
          DateTime.tryParse(json["creationTime"] ?? "") ?? DateTime(0),
      appointmentStartTime: json["appointmentStartTime"] ?? "",
    );
  }
}
