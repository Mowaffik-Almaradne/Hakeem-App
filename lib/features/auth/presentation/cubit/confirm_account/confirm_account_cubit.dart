import 'package:bloc/bloc.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/confirm_account/confirm_account_state.dart';

class ConfirmAccountCubit extends Cubit<ConfirmAccountState> {
  ConfirmAccountCubit({required this.useCase})
      : super(ConfirmAccountState.intial());
  final AuthBaseUseCase useCase;
  Future<void> confirmAccount({
    required String phoneNumber,
    required String code,
  }) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data =
        await useCase.confirmAccount(phoneNumber: phoneNumber, code: code);
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
