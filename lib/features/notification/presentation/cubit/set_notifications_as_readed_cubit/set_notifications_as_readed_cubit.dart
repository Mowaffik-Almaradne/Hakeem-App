import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/notification/domain/usecases/notification_base_use_case.dart';
part 'set_notifications_as_readed_state.dart';

class SetNotificationsAsReadedCubit
    extends Cubit<SetNotificationsAsReadedState> {
  SetNotificationsAsReadedCubit({required this.usecase})
      : super(SetNotificationsAsReadedState.intial());
  final NotificationBaseUseCase usecase;
  Future<void> setNotificationsAsReaded({
    required List<int> asReadedNotification,
  }) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await usecase.setNotificationsAsReaded(
        asReadedNotification: asReadedNotification);
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
