part of 'get_all_prescription_details_cubit.dart';

class GetAllPrescriptionDetailsState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<PrescriptionDetailsItem> itemsList;
  final bool haseReachedMax;
  final PaginationEntity paginationEntity;
  final bool isRefresh;
  final bool isLoading;
  const GetAllPrescriptionDetailsState({
    required this.paginationEntity,
    required this.itemsList,
    required this.isLoading,
    required this.isRefresh,
    required this.haseReachedMax,
    required this.failureMessage,
    required this.status,
  });

  factory GetAllPrescriptionDetailsState.intial() {
    List<PrescriptionDetailsItem> items = [];
    return GetAllPrescriptionDetailsState(
      isLoading: false,
      paginationEntity: PaginationEntity.initial(),
      haseReachedMax: false,
      isRefresh: false,
      itemsList: items,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllPrescriptionDetailsState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<PrescriptionDetailsItem>? itemsList,
    bool? haseReachedMax,
    bool? isRefresh,
    bool? isLoading,
    PaginationEntity? paginationEntity,
  }) {
    return GetAllPrescriptionDetailsState(
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
