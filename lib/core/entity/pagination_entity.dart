import 'dart:convert';

PaginationEntity paginationEntityFromJson(String str) =>
    PaginationEntity.fromJson(json.decode(str));

String paginationEntityToJson(PaginationEntity data) =>
    json.encode(data.toJson());

class PaginationEntity {
  static const int max = 9999999;

  PaginationEntity({
    required this.maxResultCount,
    required this.skipCount,
  });

  factory PaginationEntity.initial() {
    return PaginationEntity(maxResultCount: max, skipCount: 0);
  }

  factory PaginationEntity.pagination({int? max, int? skip}) {
    return PaginationEntity(maxResultCount: max ?? 5, skipCount: skip ?? 0);
  }

  final int maxResultCount;
  int skipCount;

  factory PaginationEntity.fromJson(Map<String, dynamic> json) =>
      PaginationEntity(
        maxResultCount:
            json["MaxResultCount"] ?? max, // Use the max constant here
        skipCount: json["SkipCount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "MaxResultCount": maxResultCount,
        "SkipCount": skipCount,
      };
}
