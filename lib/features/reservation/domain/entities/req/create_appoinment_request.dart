import 'package:hosptel_app/features/symptom/domain/entities/res/symptom_entitie.dart';

class CreateAppoinmentRequest {
  CreateAppoinmentRequest({
    required this.appointmentDate,
    required this.startTime,
    required this.endTime,
    required this.appointmentSymptoms,
  });

  DateTime appointmentDate;
  String startTime;
  String endTime;
  List<SymptomItem> appointmentSymptoms;

  factory CreateAppoinmentRequest.fromJson(Map<String, dynamic> json) {
    return CreateAppoinmentRequest(
      appointmentDate:
          DateTime.tryParse(json["appointmentDate"] ?? "") ?? DateTime(0),
      startTime: json["startTime"] ?? "",
      endTime: json["endTime"] ?? "",
      appointmentSymptoms: json["appointmentSymptoms"] == null
          ? []
          : List<SymptomItem>.from(
              json["appointmentSymptoms"].map((x) => SymptomItem.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "appointmentDate": appointmentDate.toIso8601String(),
        "startTime": startTime, // Serialize as String
        "endTime": endTime, // Serialize as String
        "appointmentSymptoms":
            appointmentSymptoms.map((x) => x.toJson()).toList(),
      };
}
