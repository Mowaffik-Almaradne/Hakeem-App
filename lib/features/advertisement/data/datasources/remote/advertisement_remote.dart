import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/extenstion/from_json_extenstion.dart';
import 'package:hosptel_app/features/advertisement/domain/entities/res/advertisement_entities.dart';

abstract class AdvertisementRemote {
  //? Get All Advertisement Remote :
  Future<GetAllAdvertisementEntitie> getAllAdvertisement({
    required PaginationEntity paginationEntity,
  });
}

class AdvertisementRemoteImpl implements AdvertisementRemote {
  //? Get All Advertisement Remote Impl :
  @override
  Future<GetAllAdvertisementEntitie> getAllAdvertisement({
    required PaginationEntity paginationEntity,
  }) async {
    return await ApiGetMethods<GetAllAdvertisementEntitie>().get(
      query: {
        "SkipCount": paginationEntity.skipCount,
        "MaxResultCount": paginationEntity.maxResultCount,
      },
      url: ApiGet.getAllAdvertisement,
      data: (response) =>
          GetAllAdvertisementEntitie.fromJson(response.jsonBody),
    );
  }
}
