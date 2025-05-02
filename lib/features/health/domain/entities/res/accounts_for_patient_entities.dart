class GetAllAccountsForPatientEntities {
  GetAllAccountsForPatientEntities({
    required this.result,
  });

  final AccountsForPatientResult result;

  factory GetAllAccountsForPatientEntities.fromJson(Map<String, dynamic> json) {
    return GetAllAccountsForPatientEntities(
      result: json["result"] =
          AccountsForPatientResult.fromJson(json["result"] ?? {}),
    );
  }
}

class AccountsForPatientResult {
  AccountsForPatientResult({
    required this.pagedResultDto,
    required this.deptTotalAmount,
    required this.pushTotalAmount,
  });

  final PagedResultDto pagedResultDto;
  final double deptTotalAmount;
  final double pushTotalAmount;

  factory AccountsForPatientResult.fromJson(Map<String, dynamic> json) {
    return AccountsForPatientResult(
      pagedResultDto: json["pagedResultDto"] =
          PagedResultDto.fromJson(json["pagedResultDto"] ?? {}),
      deptTotalAmount: json["deptTotalAmount"] ?? 0.0,
      pushTotalAmount: json["pushTotalAmount"] ?? 0.0,
    );
  }
}

class PagedResultDto {
  PagedResultDto({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<AccountsForPatientItem> items;

  factory PagedResultDto.fromJson(Map<String, dynamic> json) {
    return PagedResultDto(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? []
          : List<AccountsForPatientItem>.from(
              json["items"]!.map((x) => AccountsForPatientItem.fromJson(x))),
    );
  }
}

class AccountsForPatientItem {
  AccountsForPatientItem({
    required this.amount,
    required this.creationTime,
    required this.id,
  });

  final double amount;
  final DateTime creationTime;
  final int id;

  factory AccountsForPatientItem.fromJson(Map<String, dynamic> json) {
    return AccountsForPatientItem(
      amount: json["amount"] ?? 0.0,
      creationTime: DateTime.tryParse(json["creationTime"]) ?? DateTime(0),
      id: json["id"] ?? 0,
    );
  }
}
