class GetAllPrescriptionDetailsEntities {
  GetAllPrescriptionDetailsEntities({
    required this.result,
  });

  final ResultPrescriptionDetails result;
  factory GetAllPrescriptionDetailsEntities.fromJson(
      Map<String, dynamic> json) {
    return GetAllPrescriptionDetailsEntities(
      result: json["result"] =
          ResultPrescriptionDetails.fromJson(json["result"] ?? {}),
    );
  }
}

class ResultPrescriptionDetails {
  ResultPrescriptionDetails({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<PrescriptionDetailsItem> items;

  factory ResultPrescriptionDetails.fromJson(Map<String, dynamic> json) {
    return ResultPrescriptionDetails(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<PrescriptionDetailsItem>.from(
              json["items"]!.map((x) => PrescriptionDetailsItem.fromJson(x))),
    );
  }
}

class PrescriptionDetailsItem {
  PrescriptionDetailsItem({
    required this.usageTimes,
    required this.isBeforeFood,
    required this.usageDuration,
    required this.medicineName,
    required this.id,
  });

  final int usageTimes;
  final bool isBeforeFood;
  final int usageDuration;
  final String medicineName;
  final int id;

  factory PrescriptionDetailsItem.fromJson(Map<String, dynamic> json) {
    return PrescriptionDetailsItem(
      usageTimes: json["usageTimes"] ?? 0,
      isBeforeFood: json["isBeforeFood"] ?? false,
      usageDuration: json["usageDuration"] ?? 0,
      medicineName: json["medicineName"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
