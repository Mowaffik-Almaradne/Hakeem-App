class GetAllServicesEntitie {
  GetAllServicesEntitie({
    required this.result,
  });

  final ServicesItem result;
  factory GetAllServicesEntitie.fromJson(Map<String, dynamic> json) {
    return GetAllServicesEntitie(
      result: json["result"] = ServicesItem.fromJson(json["result"] ?? {}),
    );
  }
}

class ServicesItem {
  ServicesItem({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<ItemListServices> items;

  factory ServicesItem.fromJson(Map<String, dynamic> json) {
    return ServicesItem(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<ItemListServices>.from(
              json["items"]!.map((x) => ItemListServices.fromJson(x))),
    );
  }
}
class ItemListServices {
  ItemListServices({
    required this.name,
    required this.imageUrl,
    required this.id,
  });

  final String name;
  final String imageUrl;
  final int id;

  factory ItemListServices.fromJson(Map<String, dynamic> json) {
    return ItemListServices(
      name: json["name"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
