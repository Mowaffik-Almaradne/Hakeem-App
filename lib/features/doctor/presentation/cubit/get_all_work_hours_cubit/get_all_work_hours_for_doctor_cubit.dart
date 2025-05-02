import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/doctor/domain/usecases/about_doctor_base_case.dart';
import 'package:hosptel_app/features/doctor/presentation/cubit/get_all_work_hours_cubit/get_all_work_hours_for_doctor_state.dart';

class GetAllWorkHoursForDoctorCubit
    extends Cubit<GetAllWorkHoursForDoctorState> {
  GetAllWorkHoursForDoctorCubit({required this.useCase})
      : super(GetAllWorkHoursForDoctorState.intial());
  final AboutDoctorBaseUseCase useCase;
  Future<void> getAllWorkHoursForDoctor() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.getAllWorkHoursForDoctor();
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
            entitie: done,
            status: DeafultBlocStatus.done,
          ),
        );
      },
    );
  }
}
