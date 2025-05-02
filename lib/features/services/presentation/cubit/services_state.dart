part of 'services_cubit.dart';

class GetAllServicesState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<ItemListServices> itemsList;
  final bool haseReachedMax;
  final PaginationEntity paginationEntity;
  final bool isRefresh;

  const GetAllServicesState({
    required this.paginationEntity,
    required this.itemsList,
    required this.isRefresh,
    required this.haseReachedMax,
    required this.failureMessage,
    required this.status,
  });

  factory GetAllServicesState.intial() {
    List<ItemListServices> items = [];
    return GetAllServicesState(
      paginationEntity: PaginationEntity.initial(),
      haseReachedMax: false,
      isRefresh: false,
      itemsList: items,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllServicesState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<ItemListServices>? itemsList,
    bool? haseReachedMax,
    bool? isRefresh,
    PaginationEntity? paginationEntity,
  }) {
    return GetAllServicesState(
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
        paginationEntity
      ];
}
