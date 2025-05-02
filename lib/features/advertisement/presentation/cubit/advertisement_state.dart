part of 'advertisement_cubit.dart';

class GetAllAdvertisementState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<AdvertisementItem> itemsList;
  final bool haseReachedMax;
  final PaginationEntity paginationEntity;
  final bool isRefresh;

  const GetAllAdvertisementState({
    required this.paginationEntity,
    required this.itemsList,
    required this.isRefresh,
    required this.haseReachedMax,
    required this.failureMessage,
    required this.status,
  });

  factory GetAllAdvertisementState.intial() {
    List<AdvertisementItem> items = [];
    return GetAllAdvertisementState(
      paginationEntity: PaginationEntity.initial(),
      haseReachedMax: false,
      isRefresh: false,
      itemsList: items,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllAdvertisementState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<AdvertisementItem>? itemsList,
    bool? haseReachedMax,
    bool? isRefresh,
    PaginationEntity? paginationEntity,
  }) {
    return GetAllAdvertisementState(
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
