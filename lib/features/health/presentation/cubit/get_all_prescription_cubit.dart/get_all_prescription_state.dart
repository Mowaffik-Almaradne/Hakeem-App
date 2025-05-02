part of 'get_all_prescription_cubit.dart';

class GetAllPrescriptionState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<PrescriptionItem> itemsList;
  final bool haseReachedMax;
  final PaginationEntity paginationEntity;
  final bool isRefresh;
  final bool isLoading;
  const GetAllPrescriptionState({
    required this.paginationEntity,
    required this.itemsList,
    required this.isLoading,
    required this.isRefresh,
    required this.haseReachedMax,
    required this.failureMessage,
    required this.status,
  });

  factory GetAllPrescriptionState.intial() {
    List<PrescriptionItem> items = [];
    return GetAllPrescriptionState(
      isLoading: false,
      paginationEntity: PaginationEntity.initial(),
      haseReachedMax: false,
      isRefresh: false,
      itemsList: items,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllPrescriptionState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<PrescriptionItem>? itemsList,
    bool? haseReachedMax,
    bool? isRefresh,
    bool? isLoading,
    PaginationEntity? paginationEntity,
  }) {
    return GetAllPrescriptionState(
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
