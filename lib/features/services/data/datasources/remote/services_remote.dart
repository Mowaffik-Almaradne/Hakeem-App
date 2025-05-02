import 'package:hosptel_app/core/api/api_links.dart';
import 'package:hosptel_app/core/api/api_methode_get.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/extenstion/from_json_extenstion.dart';
import 'package:hosptel_app/features/services/domain/entities/res/get_all_services_entitie.dart';

abstract class ServicesRemote {
  //? Get All Services Remote :
  Future<GetAllServicesEntitie> getAllServices({
    required PaginationEntity pagination,
  });
}

class ServicesRemoteImpl implements ServicesRemote {
  //? Get All Services Remote Impl:
  @override
  Future<GetAllServicesEntitie> getAllServices({
    required PaginationEntity pagination,
  }) async {
    return await ApiGetMethods<GetAllServicesEntitie>().get(
      query: {
        "SkipCount": pagination.skipCount,
        "MaxResultCount": pagination.maxResultCount,
      },
      url: ApiGet.getAllServices,
      data: (response) => GetAllServicesEntitie.fromJson(response.jsonBody),
    );
  }
}
