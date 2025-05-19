import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/general_setting/domain/entities/res/get_general_setting_response_entity.dart';
import 'package:hosptel_app/features/general_setting/domain/repositories/general_setting_repository.dart';
import 'package:hosptel_app/features/general_setting/domain/usecases/general_setting_base_use_case.dart';

class GeneralSettingUseCase implements GeneralSettingBaseUseCase {
  final GeneralSettingRepository repository;
  GeneralSettingUseCase({required this.repository});
  @override
  Future<Either<Failure, GetGeneralSettingResponseEntity>>
      getGeneralSetting() async {
    return await repository.getGeneralSetting();
  }
}
