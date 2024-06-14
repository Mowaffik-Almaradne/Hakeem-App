import 'package:bloc/bloc.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/create_Account/create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit({required this.useCase})
      : super(CreateAccountState.intial());
  final AuthBaseUseCase useCase;
  Future<void> createAccount(
      {required CreateAccoutRequestEntite request}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.createAccount(request: request);
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
