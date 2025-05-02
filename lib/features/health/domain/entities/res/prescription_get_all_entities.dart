class GetAllPrescriptionEntities {
  GetAllPrescriptionEntities({
    required this.result,
  });

  final ResultPrescription result;

  factory GetAllPrescriptionEntities.fromJson(Map<String, dynamic> json) {
    return GetAllPrescriptionEntities(
      result: json["result"] =
          ResultPrescription.fromJson(json["result"] ?? {}),
    );
  }
}

class ResultPrescription {
  ResultPrescription({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<PrescriptionItem> items;

  factory ResultPrescription.fromJson(Map<String, dynamic> json) {
    return ResultPrescription(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<PrescriptionItem>.from(
              json["items"]!.map((x) => PrescriptionItem.fromJson(x))),
    );
  }
}

class PrescriptionItem {
  PrescriptionItem({
    required this.creationTime,
    required this.id,
  });

  final DateTime creationTime;
  final int id;

  factory PrescriptionItem.fromJson(Map<String, dynamic> json) {
    return PrescriptionItem(
      creationTime: DateTime.tryParse(json["creationTime"]) ?? DateTime(0),
      id: json["id"] ?? 0,
    );
  }
}
