import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/entities/res/patient_profile_entitiey.dart';
import 'package:hosptel_app/features/profile/domain/usecases/base_use_profile.dart';

part 'updata_patient_profile_state.dart';

class UpdataPatientProfileCubit extends Cubit<UpdataPatientProfileState> {
  UpdataPatientProfileCubit({required this.useCase})
      : super(UpdataPatientProfileState.intial());
  final ProfileBaseUseCase useCase;
  Future<void> updataPatientProfile({
    required MainPatientProfile request,
  }) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.updatePatientProfile(request: request);
    if (isClosed) {
      return;
    }
    data.fold(
      (failure) {
        emit(
          state.copyWith(
            failureMessage: mapFailureToMessage(failure: failure),
            status: DeafultBlocStatus.error,
          ),
        );
      },
      (done) {
        emit(
          state.copyWith(
            status: DeafultBlocStatus.done,
          ),
        );
      },
    );
  }
}
