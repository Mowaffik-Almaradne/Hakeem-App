class GetAllMyResrvationEntities {
  GetAllMyResrvationEntities({
    required this.result,
  });

  final MyReservationResult result;

  factory GetAllMyResrvationEntities.fromJson(Map<String, dynamic> json) {
    return GetAllMyResrvationEntities(
      result: json["result"] =
          MyReservationResult.fromJson(json["result"] ?? {}),
    );
  }
}
class MyReservationResult {
  MyReservationResult({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<MyReservationItem> items;

  factory MyReservationResult.fromJson(Map<String, dynamic> json) {
    return MyReservationResult(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<MyReservationItem>.from(
              json["items"]!.map((x) => MyReservationItem.fromJson(x))),
    );
  }
}

class MyReservationItem {
  MyReservationItem({
    required this.order,
    required this.appointmentDate,
    required this.startTime,
    required this.dayName,
    required this.id,
  });

  final int order;
  final DateTime appointmentDate;
  final String startTime;
  final String dayName;
  final int id;

  factory MyReservationItem.fromJson(Map<String, dynamic> json) {
    return MyReservationItem(
      order: json["order"] ?? 0,
      appointmentDate:
          DateTime.tryParse(json["appointmentDate"]) ?? DateTime(0),
      startTime: json["startTime"] ?? "",
      dayName: json["dayName"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
