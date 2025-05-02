import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/extenstion/from_json_extenstion.dart';
import 'package:hosptel_app/features/doctor/domain/entities/res/get_about_doctor_entitie.dart';
import 'package:hosptel_app/features/doctor/domain/entities/res/work_hours_for_doctor.dart';

abstract class AboutDoctorRemote {
  //? Get About Doctor Remote :
  Future<GetAboutDoctorEntitie> getAboutDoctor();
  //? Get All Work Hours For Doctor Remote :
  Future<GetAllWorkHoursForDoctorEntitie> getAllWorkHoursForDoctor();
}

class AboutDoctorRemoteImpl implements AboutDoctorRemote {
  //? Get About Doctor Remote Impl  :
  @override
  Future<GetAboutDoctorEntitie> getAboutDoctor() async {
    return ApiGetMethods<GetAboutDoctorEntitie>().get(
      url: ApiGet.getAboutDoctoreUrl,
      data: (response) => GetAboutDoctorEntitie.fromJson(response.jsonBody),
    );
  }

  //? Get All Work Hours For Doctor Remote  Impl :
  @override
  Future<GetAllWorkHoursForDoctorEntitie> getAllWorkHoursForDoctor() {
    return ApiGetMethods<GetAllWorkHoursForDoctorEntitie>().get(
      url: ApiGet.getAllWorkHoursForDoctorUrl,
      data: (response) =>
          GetAllWorkHoursForDoctorEntitie.fromJson(response.jsonBody),
    );
  }
}
