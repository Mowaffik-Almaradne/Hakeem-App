class GetAllAvailableTimeEntitie {
  GetAllAvailableTimeEntitie({
    required this.result,
  });

  final List<AvailableTime> result;

  factory GetAllAvailableTimeEntitie.fromJson(Map<String, dynamic> json) {
    return GetAllAvailableTimeEntitie(
      result: json["result"] == null
          ? []
          : List<AvailableTime>.from(
              json["result"]!.map((x) => AvailableTime.fromJson(x))),
    );
  }
}

class AvailableTime {
  AvailableTime({
    required this.fromTime,
    required this.toTime,
    required this.isBooked,
    required this.isSetUnavailable,
  });

  String fromTime;
  String toTime;
  bool isBooked;
  bool isSetUnavailable;

  factory AvailableTime.fromJson(Map<String, dynamic> json) {
    return AvailableTime(
      fromTime: json["fromTime"] ?? "",
      toTime: json["toTime"] ?? "",
      isBooked: json["isBooked"] ?? false,
      isSetUnavailable: json["isSetUnavailable"] ?? false,
    );
  }
}
