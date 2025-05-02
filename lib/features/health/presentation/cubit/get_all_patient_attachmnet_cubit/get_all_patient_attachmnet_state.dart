part of 'get_all_patient_attachmnet_cubit.dart';

class GetAllPatientAttachmnetState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<PatientAttachmnetItem> itemsList;
  final bool haseReachedMax;
  final PaginationEntity paginationEntity;
  final bool isRefresh;
  final bool isLoading;
  const GetAllPatientAttachmnetState({
    required this.paginationEntity,
    required this.itemsList,
    required this.isLoading,
    required this.isRefresh,
    required this.haseReachedMax,
    required this.failureMessage,
    required this.status,
  });

  factory GetAllPatientAttachmnetState.intial() {
    List<PatientAttachmnetItem> items = [];
    return GetAllPatientAttachmnetState(
      isLoading: false,
      paginationEntity: PaginationEntity.initial(),
      haseReachedMax: false,
      isRefresh: false,
      itemsList: items,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllPatientAttachmnetState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<PatientAttachmnetItem>? itemsList,
    bool? haseReachedMax,
    bool? isRefresh,
    bool? isLoading,
    PaginationEntity? paginationEntity,
  }) {
    return GetAllPatientAttachmnetState(
      isLoading: isLoading ?? this.isLoading,
      paginationEntity: paginationEntity ?? this.paginationEntity,
      haseReachedMax: haseReachedMax ?? this.haseReachedMax,
      isRefresh: isRefresh ?? this.isRefresh,
      itemsList: itemsList ?? this.itemsList,
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        failureMessage,
        status,
        haseReachedMax,
        isRefresh,
        itemsList,
        paginationEntity,
        isLoading,
      ];
}
