import 'package:flutter/material.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';

class ListViewWithPagenationWidget<T> extends StatefulWidget {
  const ListViewWithPagenationWidget({
    super.key,
    required this.haseReachedMax,
    required this.item,
    required this.loading,
    required this.childListView,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
    this.maxCount = 5,
    this.separator,
    this.reFrach = false,
    this.scrollDirection = Axis.vertical,
    required this.onNotification,
  });
  final bool haseReachedMax;
  final List<T> item;
  final bool loading;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;
  final int maxCount;
  final bool reFrach;
  final Widget? separator;
  final Widget Function(
    T t,
    int index,
  ) childListView;
  final Function(PaginationEntity paginationEntite) onNotification;

  @override
  State<ListViewWithPagenationWidget<T>> createState() =>
      _ListViewWithPagenationWidgetState<T>();
}

class _ListViewWithPagenationWidgetState<T>
    extends State<ListViewWithPagenationWidget<T>> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if ((_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100) &&
          !widget.haseReachedMax &&
          !widget.loading) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    if (widget.reFrach) {
      skip = max;
    } else {
      skip += max;
    }
    widget.onNotification(PaginationEntity.pagination(max: max, skip: skip));
  }

  int skip = 0;
  int max = 5;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          widget.separator ?? const SizedBox.shrink(),
      controller: _scrollController,
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      padding: widget.padding,
      scrollDirection: widget.scrollDirection,
      itemCount: widget.item.length + ((widget.loading) ? 1 : 0),
      itemBuilder: (context, index) {
        //? Loading End :

        if (widget.loading && index == widget.item.length) {
          return const MainLoadignWidget();
        } else {
          final T item = widget.item[index];

          return widget.childListView(item, index);
        }
      },
    );
  }
}
