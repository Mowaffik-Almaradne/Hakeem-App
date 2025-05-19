import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/core/network/check_net.dart';
import 'package:hosptel_app/features/general_setting/data/datasources/remote/general_setting_remote.dart';
import 'package:hosptel_app/features/general_setting/domain/entities/res/get_general_setting_response_entity.dart';
import 'package:hosptel_app/features/general_setting/domain/repositories/general_setting_repository.dart';

class GeneralSettingRepositoryImpl implements GeneralSettingRepository {
  final GeneralSettingRemote remote;

  GeneralSettingRepositoryImpl({required this.remote});
  @override
  Future<Either<Failure, GetGeneralSettingResponseEntity>>
      getGeneralSetting() async {
    return CheckNet<GetGeneralSettingResponseEntity>().checkNetResponse(
      tryRight: () async {
        final data = await remote.getGeneralSetting();
        return Right(data);
      },
    );
  }
}
