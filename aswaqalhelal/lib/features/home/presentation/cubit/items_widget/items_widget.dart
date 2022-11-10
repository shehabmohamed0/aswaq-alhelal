import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../address/presentation/widgets/normal_text_field.dart';
import 'items_sliver_grid_view.dart';
import 'items_sliver_list_view.dart';
import 'items_widget_cubit.dart';

class ItemsWidget2<T> extends StatefulWidget {
  const ItemsWidget2({
    Key? key,
    required this.items,
    required this.dateTimeValue,
    required this.stringValue,
    required this.gridBuilder,
    required this.listBuilder,
  }) : super(key: key);

  final List<T> items;
  final DateTime Function(T) dateTimeValue;
  final String Function(T) stringValue;
  final Widget Function(T) gridBuilder;
  final Widget Function(T) listBuilder;

  @override
  State<ItemsWidget2<T>> createState() => _ItemsWidget2State<T>();
}

class _ItemsWidget2State<T> extends State<ItemsWidget2<T>> {
  late final ItemsWidgetCubit2<T> cubit;
  final TextEditingController controller = TextEditingController();
  final focusNode = FocusNode();
  final scrollController = ScrollController();

  @override
  void initState() {
    cubit = ItemsWidgetCubit2<T>(
      dateTimeValue: widget.dateTimeValue,
      stringValue: widget.stringValue,
    )..initialized(widget.items);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ItemsWidget2<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    cubit.initialized(widget.items);
  }

  @override
  void didChangeDependencies() {
    // cubit.initialized(widget.items);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<ItemsWidgetCubit2<T>, ItemsWidgetState2<T>>(
          listenWhen: (previous, current) {
        return previous.isSearching != current.isSearching;
      }, listener: (context, state) {
        if (state.isSearching == true) {
          focusNode.requestFocus();
        }
      }, builder: (context, state) {
        final cubit = context.read<ItemsWidgetCubit2<T>>();

        final usedList = (state.isSearching && state.searchValue.isNotEmpty)
            ? state.searchItems
            : state.items;
        return CustomScrollView(
          controller: scrollController,
          clipBehavior: Clip.none,
          slivers: [
            SliverPersistentHeader(
              floating: true,
              delegate: PresistentHeaderDelegate(
                _HeaderOptions(
                  state: state,
                  cubit: cubit,
                  searchController: controller,
                  focusNode: focusNode,
                ),
              ),
            ),
            if (_isEmptySearch(state))
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).thereIsNoItems,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black45,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            else if (state.displayItem.isGridView)
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: ItemsSliverGridView2<T>(
                  institutions: usedList,
                  widgetBuilder: widget.gridBuilder,
                ),
              )
            else
              ItemsSliverListView2<T>(
                institutions: usedList,
                widgetBuilder: widget.listBuilder,
              )
          ],
        );
      }),
    );
  }

  bool _isEmptySearch(ItemsWidgetState2 state) {
    return state.isSearching &&
        state.searchItems.isEmpty &&
        state.searchValue.isNotEmpty;
  }
}

class PresistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final _HeaderOptions _headerOptions;
  PresistentHeaderDelegate(
    // ignore: library_private_types_in_public_api
    this._headerOptions,
  );
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(child: _headerOptions);
  }

  @override
  double get maxExtent => 46;

  @override
  double get minExtent => 46;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _HeaderOptions extends StatelessWidget {
  const _HeaderOptions({
    Key? key,
    required this.state,
    required this.cubit,
    required this.searchController,
    required this.focusNode,
  }) : super(key: key);

  final ItemsWidgetState2 state;
  final ItemsWidgetCubit2 cubit;
  final TextEditingController searchController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(4),
      child: state.isSearching
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: NormalTextFormField(
                focusNode: focusNode,
                controller: searchController,
                suffixIcon: GestureDetector(
                    onTap: () {
                      cubit.endSearch();
                    },
                    child: const Icon(Icons.close)),
                onChanged: cubit.search,
              ),
            )
          : _OptionsWidgets(state: state, cubit: cubit),
    );
  }
}

class _OptionsWidgets extends StatelessWidget {
  const _OptionsWidgets({
    Key? key,
    required this.state,
    required this.cubit,
  }) : super(key: key);

  final ItemsWidgetState2 state;
  final ItemsWidgetCubit2 cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: DropdownButton<SortType>(
            underline: const SizedBox.shrink(),
            icon: IconButton(
              splashRadius: 20,
              icon: Icon(
                state.sortDirection.isAscending
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                color: Colors.black45,
              ),
              onPressed: () => cubit.sort(
                state.sortType,
                state.sortDirection.isAscending
                    ? SortDirection.descending
                    : SortDirection.ascending,
              ),
              visualDensity: VisualDensity.compact,
            ),
            value: state.sortType,
            items: [
              DropdownMenuItem<SortType>(
                value: SortType.creationTime,
                child: Text(AppLocalizations.of(context).creationTime),
              ),
              DropdownMenuItem<SortType>(
                value: SortType.alphabetically,
                child: Text(AppLocalizations.of(context).alphabetically),
              ),
            ],
            onChanged: (sortType) {
              if (sortType != null) {
                cubit.sort(sortType, state.sortDirection);
              }
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => cubit.startSearch(),
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => cubit.displayChanged(
                state.displayItem.isGridView
                    ? DisplayItems.listView
                    : DisplayItems.gridView,
              ),
              icon: Icon(
                  state.displayItem.isGridView ? Icons.grid_view : Icons.list),
            ),
          ],
        ),
      ],
    );
  }
}
