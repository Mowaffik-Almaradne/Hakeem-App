import 'package:dartz/dartz.dart';
import 'package:hosptel_app/core/error/failure.dart';
import 'package:hosptel_app/features/general_setting/domain/entities/res/get_general_setting_response_entity.dart';

abstract class GeneralSettingBaseUseCase {
  Future<Either<Failure, GetGeneralSettingResponseEntity>> getGeneralSetting();
}
