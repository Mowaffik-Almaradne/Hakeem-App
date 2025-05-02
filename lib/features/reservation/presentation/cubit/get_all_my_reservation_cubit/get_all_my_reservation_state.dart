part of 'get_all_my_reservation_cubit.dart';

class GetAllMyReservationState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<MyReservationItem> itemsListIsEnded;
  final List<MyReservationItem> itemsListIsWatting;
  final bool haseReachedMax;
  final PaginationEntity paginationEntity;
  final bool isRefresh;
  final bool hasTapped;
  const GetAllMyReservationState({
    required this.hasTapped,
    required this.paginationEntity,
    required this.itemsListIsEnded,
    required this.itemsListIsWatting,
    required this.isRefresh,
    required this.haseReachedMax,
    required this.failureMessage,
    required this.status,
  });

  factory GetAllMyReservationState.intial() {
    List<MyReservationItem> itemsListIsEnded = [];
    List<MyReservationItem> itemsListIsWatting = [];
    return GetAllMyReservationState(
      hasTapped: false,
      paginationEntity: PaginationEntity.initial(),
      haseReachedMax: false,
      isRefresh: false,
      itemsListIsEnded: itemsListIsEnded,
      itemsListIsWatting: itemsListIsWatting,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllMyReservationState copyWith({
    bool? hasTapped,
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<MyReservationItem>? itemsListIsEnded,
    List<MyReservationItem>? itemsListIsWatting,
    bool? haseReachedMax,
    bool? isRefresh,
    PaginationEntity? paginationEntity,
  }) {
    return GetAllMyReservationState(
      hasTapped: hasTapped ?? this.hasTapped,
      paginationEntity: paginationEntity ?? this.paginationEntity,
      haseReachedMax: haseReachedMax ?? this.haseReachedMax,
      isRefresh: isRefresh ?? this.isRefresh,
      itemsListIsEnded: itemsListIsEnded ?? this.itemsListIsEnded,
      itemsListIsWatting: itemsListIsWatting ?? this.itemsListIsWatting,
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
        itemsListIsEnded,
        itemsListIsWatting,
        hasTapped,
        paginationEntity
      ];
}
