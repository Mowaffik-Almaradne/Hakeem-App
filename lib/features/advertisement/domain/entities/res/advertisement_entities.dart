class GetAllAdvertisementEntitie {
  GetAllAdvertisementEntitie({
    required this.result,
  });

  final AdvertisementResult result;

  factory GetAllAdvertisementEntitie.fromJson(Map<String, dynamic> json) {
    return GetAllAdvertisementEntitie(
      result: json["result"] =
          AdvertisementResult.fromJson(json["result"] ?? {}),
    );
  }
}

class AdvertisementResult {
  AdvertisementResult({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<AdvertisementItem> items;

  factory AdvertisementResult.fromJson(Map<String, dynamic> json) {
    return AdvertisementResult(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<AdvertisementItem>.from(
              json["items"]!.map((x) => AdvertisementItem.fromJson(x))),
    );
  }
}

class AdvertisementItem {
  AdvertisementItem({
    required this.title,
    required this.description,
    required this.id,
  });

  final String title;
  final String description;
  final int id;

  factory AdvertisementItem.fromJson(Map<String, dynamic> json) {
    return AdvertisementItem(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
