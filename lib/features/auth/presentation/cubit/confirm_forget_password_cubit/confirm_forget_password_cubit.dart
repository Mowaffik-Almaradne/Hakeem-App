import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';

part 'confirm_forget_password_state.dart';

class ConfirmForgetPasswordCubit extends Cubit<ConfirmForgetPasswordState> {
  ConfirmForgetPasswordCubit({required this.useCase})
      : super(ConfirmForgetPasswordState.intial());
  final AuthBaseUseCase useCase;
  Future<void> confirmForgetPassword({
    required String phoneNumber,
    required String code,
  }) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.confirmForgetPassword(
        phoneNumber: phoneNumber, code: code);
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
