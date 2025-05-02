class GetAllSymptomEntitie {
  GetAllSymptomEntitie({
    required this.result,
  });

  final SymptomResult result;

  factory GetAllSymptomEntitie.fromJson(Map<String, dynamic> json) {
    return GetAllSymptomEntitie(
      result: json["result"] = SymptomResult.fromJson(json["result"] ?? {}),
    );
  }
}

class SymptomResult {
  SymptomResult({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<SymptomItem> items;

  factory SymptomResult.fromJson(Map<String, dynamic> json) {
    return SymptomResult(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<SymptomItem>.from(
              json["items"]!.map((x) => SymptomItem.fromJson(x))),
    );
  }
}

class SymptomItem {
  SymptomItem({
    required this.name,
    required this.id,
    this.select = false,
  });

  final String name;
  final int id;
  bool select;

  factory SymptomItem.fromJson(Map<String, dynamic> json) {
    return SymptomItem(
      name: json["name"] ?? "",
      id: json["id"] ?? 0,
    );
  }
  Map<String, dynamic> toJson() => {
        "symptomId": id,
      };
}
