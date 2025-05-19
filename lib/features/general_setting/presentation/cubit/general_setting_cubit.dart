import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/general_setting/domain/entities/res/get_general_setting_response_entity.dart';
import 'package:hosptel_app/features/general_setting/domain/usecases/general_setting_base_use_case.dart';

part 'general_setting_state.dart';

class GeneralSettingCubit extends Cubit<GeneralSettingState> {
  GeneralSettingCubit({required this.useCase})
      : super(GeneralSettingState.inital());
  final GeneralSettingBaseUseCase useCase;
  getGeneralSetting() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.getGeneralSetting();
    if (isClosed) return;
    data.fold(
        (l) => emit(state.copyWith(
            status: DeafultBlocStatus.error,
            failureMessage: mapFailureToMessage(failure: l))), (r) {
      AppSharedPreferences.cashGeneralSetting(
          isDisplayAttachments: r.result.isDisplayAttachments,
          isDisplayPrescription: r.result.isDisplayPrescription,
          isDisplaySessions: r.result.isDisplaySessions,
          isDisplayAccounts: r.result.isDisplayAccounts);
      return emit(
        state.copyWith(status: DeafultBlocStatus.done, entity: r),
      );
    });
  }
}
