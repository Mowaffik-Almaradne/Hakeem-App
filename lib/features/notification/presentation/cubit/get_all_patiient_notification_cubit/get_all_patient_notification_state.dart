part of 'get_all_patient_notification_cubit.dart';

class GetAllPatientNotificationState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<PatientNotification> itemsList;
  final List<int> itemsIsReaded;
  final bool haseReachedMax;
  final PaginationEntity paginationEntity;
  final bool isRefresh;

  const GetAllPatientNotificationState({
    required this.paginationEntity,
    required this.itemsList,
    required this.itemsIsReaded,
    required this.isRefresh,
    required this.haseReachedMax,
    required this.failureMessage,
    required this.status,
  });

  factory GetAllPatientNotificationState.intial() {
    List<PatientNotification> items = [];
    List<int> itemsIsReaded = [];
    return GetAllPatientNotificationState(
      paginationEntity: PaginationEntity.initial(),
      haseReachedMax: false,
      isRefresh: false,
      itemsIsReaded: itemsIsReaded,
      itemsList: items,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllPatientNotificationState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<int>? itemsIsReaded,
    List<PatientNotification>? itemsList,
    bool? haseReachedMax,
    bool? isRefresh,
    PaginationEntity? paginationEntity,
  }) {
    return GetAllPatientNotificationState(
      itemsIsReaded: itemsIsReaded ?? this.itemsIsReaded,
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
        itemsIsReaded,
        status,
        haseReachedMax,
        isRefresh,
        itemsList,
        paginationEntity
      ];
}
