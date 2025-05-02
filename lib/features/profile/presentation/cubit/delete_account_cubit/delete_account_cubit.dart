import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/usecases/base_use_profile.dart';
part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit({required this.useCase})
      : super(DeleteAccountState.intial());
  final ProfileBaseUseCase useCase;
  Future<void> deleteAccount() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.deleteAccount();
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
