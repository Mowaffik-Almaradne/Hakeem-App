import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/usecases/base_use_profile.dart';

part 'confirm_edit_phone_number_state.dart';

class ConfirmEditPhoneNumberCubit extends Cubit<ConfirmEditPhoneNumberState> {
  ConfirmEditPhoneNumberCubit({required this.useCase})
      : super(ConfirmEditPhoneNumberState.intial());
  final ProfileBaseUseCase useCase;
  Future<void> confirmEditPhoneNumber({
    required String phoneNumber,
    required String code,
  }) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.confirmEditPhoneNumber(
        phoneNumber: phoneNumber, code: code);
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
