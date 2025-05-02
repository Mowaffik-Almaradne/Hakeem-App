class GetAllAvailableDaysEntitie {
  GetAllAvailableDaysEntitie({
    required this.result,
  });

  final List<AvailableDays> result;

  factory GetAllAvailableDaysEntitie.fromJson(Map<String, dynamic> json) {
    return GetAllAvailableDaysEntitie(
      result: json["result"] == null
          ? []
          : List<AvailableDays>.from(
              json["result"]!.map((x) => AvailableDays.fromJson(x))),
    );
  }
}

class AvailableDays {
  AvailableDays({
    required this.name,
    required this.date,
  });

  final String name;
  final DateTime date;

  factory AvailableDays.fromJson(Map<String, dynamic> json) {
    return AvailableDays(
      name: json["name"] ?? "",
      date: DateTime.tryParse(json["date"] ?? "")??DateTime.now(),
    );
  }
}
