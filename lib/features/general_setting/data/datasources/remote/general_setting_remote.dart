import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/extenstion/from_json_extenstion.dart';
import 'package:hosptel_app/features/general_setting/domain/entities/res/get_general_setting_response_entity.dart';

abstract class GeneralSettingRemote {
  Future<GetGeneralSettingResponseEntity> getGeneralSetting();
}

class GeneralSettingRemoteImpl implements GeneralSettingRemote {
  @override
  Future<GetGeneralSettingResponseEntity> getGeneralSetting() {
    return ApiGetMethods<GetGeneralSettingResponseEntity>().get(
      url: ApiGet.getGeneralSetting,
      data: (response) =>
          GetGeneralSettingResponseEntity.fromJson(response.jsonBody),
    );
  }
}
