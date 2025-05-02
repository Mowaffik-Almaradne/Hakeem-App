class GetAboutDoctorEntitie {
  GetAboutDoctorEntitie({
    required this.result,
  });
  final AboutDoctor result;
  factory GetAboutDoctorEntitie.fromJson(Map<String, dynamic> json) {
    return GetAboutDoctorEntitie(
      result: json["result"] = AboutDoctor.fromJson(json["result"] ?? {}),
    );
  }
}

class AboutDoctor {
  AboutDoctor({
    required this.doctorName,
    required this.specialization,
    required this.introduction,
    required this.address,
    required this.personalImageUrl,
    required this.latitude,
    required this.longitude,
    required this.phoneNumber,
    required this.userName,
    required this.id,
  });

  final String doctorName;
  final String specialization;
  final String introduction;
  final String address;
  final String personalImageUrl;
  final dynamic latitude;
  final dynamic longitude;
  final String phoneNumber;
  final String userName;
  final int id;

  factory AboutDoctor.fromJson(Map<String, dynamic> json) {
    return AboutDoctor(
      doctorName: json["doctorName"] ?? "",
      specialization: json["specialization"] ?? "",
      introduction: json["introduction"] ?? "",
      address: json["address"] ?? "",
      personalImageUrl: json["personalImageUrl"] ?? "",
      latitude: json["latitude"],
      longitude: json["longitude"],
      phoneNumber: json["phoneNumber"] ?? "",
      userName: json["userName"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
