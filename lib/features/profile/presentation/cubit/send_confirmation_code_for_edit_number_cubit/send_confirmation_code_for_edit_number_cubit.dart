import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/usecases/base_use_profile.dart';

part 'send_confirmation_code_for_edit_number_state.dart';

class SendConfirmationCodeForEditNumberCubit
    extends Cubit<SendConfirmationCodeForEditNumberState> {
  SendConfirmationCodeForEditNumberCubit({required this.useCase})
      : super(SendConfirmationCodeForEditNumberState.intial());
  final ProfileBaseUseCase useCase;
  sendConfirmationCodeForEditNumber({required String phoneNumber}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.sendConfirmationCodeForEditNumber(
        phoneNumber: phoneNumber);
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
