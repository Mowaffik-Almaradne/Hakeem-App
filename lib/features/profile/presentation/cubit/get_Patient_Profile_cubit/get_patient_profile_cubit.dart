import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/entities/res/patient_profile_entitiey.dart';
import 'package:hosptel_app/features/profile/domain/usecases/base_use_profile.dart';
part 'get_patient_profile_state.dart';

class GetPatientProfileCubit extends Cubit<GetPatientProfileState> {
  GetPatientProfileCubit({required this.useCase})
      : super(GetPatientProfileState.intial());
  final ProfileBaseUseCase useCase;
  getPatientProfile() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.getPatientProfile();
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
            entitey: done,
            status: DeafultBlocStatus.done,
          ),
        );
      },
    );
  }
}
