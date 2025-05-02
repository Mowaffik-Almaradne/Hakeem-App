import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/extenstion/from_json_extenstion.dart';
import 'package:hosptel_app/features/symptom/domain/entities/res/symptom_entitie.dart';

abstract class SymptomRemote {
  //? Get All Symptom Remote :
  Future<GetAllSymptomEntitie> getAllSymptom({
    required PaginationEntity paginationEntity,
  });
}

class SymptomRemoteImpl implements SymptomRemote {
//? Get All Symptom Remote Impl  :
  @override
  Future<GetAllSymptomEntitie> getAllSymptom({
    required PaginationEntity paginationEntity,
  }) async {
    return ApiGetMethods<GetAllSymptomEntitie>().get(
      query: {
        "SkipCount": paginationEntity.skipCount,
        "MaxResultCount": paginationEntity.maxResultCount
      },
      url: ApiGet.getAllSymptom,
      data: (response) => GetAllSymptomEntitie.fromJson(response.jsonBody),
    );
  }
}
