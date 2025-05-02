import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/notification/domain/entities/get_all_notification_entities.dart';
import 'package:hosptel_app/features/notification/domain/usecases/notification_base_use_case.dart';
part 'get_all_patient_notification_state.dart';

class GetAllPatientNotificationCubit
    extends Cubit<GetAllPatientNotificationState> {
  final NotificationBaseUseCase usecase;
  List<PatientNotification> items = [];
  GetAllPatientNotificationCubit({required this.usecase})
      : super(GetAllPatientNotificationState.intial());
  //? Get Recent Job :
  void getAllPatientNotification({
    PaginationEntity? paginationEntite,
    bool? isRefresh,
  }) async {
    if (isRefresh == true) {
      state.itemsList.clear();
      emit(state.copyWith(
        status: DeafultBlocStatus.loading,
        isRefresh: false,
        haseReachedMax: false,
      ));
    }

    if (!state.haseReachedMax) {
      emit(state.copyWith(
        status: DeafultBlocStatus.loading,
      ));
      final result = await usecase.getAllPatientNotification(
        paginationEntity: PaginationEntity.pagination(
          max: paginationEntite?.maxResultCount,
          skip: paginationEntite?.skipCount,
        ),
      );
      if (isClosed) {
        return;
      }
      result.fold((failure) {
        emit(
          state.copyWith(
            isRefresh: isRefresh ?? false,
            status: DeafultBlocStatus.error,
            paginationEntity: paginationEntite,
            failureMessage: mapFailureToMessage(
              failure: failure,
            ),
          ),
        );
      }, (data) {
        items.addAll(data.result.items);
        for (var element in data.result.items) {
          if (element.isReaded == false) {
            state.itemsIsReaded.add(element.id);
          }
        }
        emit(state.copyWith(
          isRefresh: isRefresh ?? false,
          haseReachedMax: items.length == data.result.totalCount,
          status: DeafultBlocStatus.done,
          itemsList: items,
        ));
      });
    }
  }
}
