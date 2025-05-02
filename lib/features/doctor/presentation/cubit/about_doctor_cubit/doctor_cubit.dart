import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/doctor/domain/entities/res/get_about_doctor_entitie.dart';
import 'package:hosptel_app/features/doctor/domain/usecases/about_doctor_base_case.dart';
part 'doctor_state.dart';

class GetAboutDoctorCubit extends Cubit<GetAboutDoctorState> {
  GetAboutDoctorCubit({required this.useCase})
      : super(GetAboutDoctorState.intial());
  final AboutDoctorBaseUseCase useCase;
  Future<void> getAboutDoctor() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading, isLoading: false));
    final data = await useCase.getAboutDoctor();
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
            isLoading: true,
            entitie: done,
            status: DeafultBlocStatus.done,
          ),
        );
      },
    );
  }
}
