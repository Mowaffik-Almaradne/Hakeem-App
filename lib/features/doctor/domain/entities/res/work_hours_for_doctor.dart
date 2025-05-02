class GetAllWorkHoursForDoctorEntitie {
  GetAllWorkHoursForDoctorEntitie({
    required this.result,
  });

  final List<WorkHoursForDoctor> result;

  factory GetAllWorkHoursForDoctorEntitie.fromJson(Map<String, dynamic> json) {
    return GetAllWorkHoursForDoctorEntitie(
      result: json["result"] == null
          ? []
          : List<WorkHoursForDoctor>.from(
              json["result"]!.map((x) => WorkHoursForDoctor.fromJson(x))),
    );
  }
}

class WorkHoursForDoctor {
  WorkHoursForDoctor({
    required this.dayId,
    required this.dayName,
    required this.fromTime,
    required this.toTime,
    required this.userId,
    required this.id,
  });

  final int dayId;
  final String dayName;
  final String fromTime;
  final String toTime;
  final int userId;
  final int id;

  factory WorkHoursForDoctor.fromJson(Map<String, dynamic> json) {
    return WorkHoursForDoctor(
      dayId: json["dayId"] ?? 0,
      dayName: json["dayName"] ?? "",
      fromTime: json["fromTime"] ?? "",
      toTime: json["toTime"] ?? "",
      userId: json["userId"] ?? 0,
      id: json["id"] ?? 0,
    );
  }
}
