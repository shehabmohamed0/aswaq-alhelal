import 'package:aswaqalhelal/features/instutution_items/domain/entities/institution_item.dart';
import 'package:flutter/material.dart';
import 'package:geo_presentation/features/presentation/widgets/normal_text_field.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_hooks.dart';

import '../../cubit/items_widget/items_widget_cubit.dart';
import 'item_grid_widget.dart';
import 'item_list_tile.dart';

class ItemsWidget extends StatelessWidget {
  factory ItemsWidget.withoutProvider({
    Key? key,
    required List<InstitutionItem> items,
  }) =>
      ItemsWidget._(
        items: items,
        hasItsOwnProvider: false,
      );
  factory ItemsWidget({
    Key? key,
    required List<InstitutionItem> items,
  }) =>
      ItemsWidget._(
        items: items,
        hasItsOwnProvider: true,
      );

  const ItemsWidget._({
    Key? key,
    required this.items,
    this.hasItsOwnProvider = true,
  }) : super(key: key);
  final List<InstitutionItem> items;
  final bool hasItsOwnProvider;
  @override
  Widget build(BuildContext context) {
    if (hasItsOwnProvider) {
      return BlocProvider<ItemsWidgetCubit>(
        create: (context) => locator()..initialized(items),
        child: BlocBuilder<ItemsWidgetCubit, ItemsWidgetState>(
          builder: (context, state) {
            return _LoadedWidget(state: state);
          },
        ),
      );
    }

    return BlocBuilder<ItemsWidgetCubit, ItemsWidgetState>(
        builder: (context, state) {
      return _LoadedWidget(
        state: state,
      );
    });
  }
}

class PresistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final _HeaderOptions _headerOptions;
  PresistentHeaderDelegate(
    this._headerOptions,
  );
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(child: _headerOptions);
  }

  @override
  double get maxExtent => 42;

  @override
  double get minExtent => 42;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _LoadedWidget extends HookWidget {
  const _LoadedWidget({
    Key? key,
    required this.state,
  }) : super(key: key);
  final ItemsWidgetState state;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ItemsWidgetCubit>();
    final TextEditingController controller = useTextEditingController();
    final focusNode = useFocusNode();
    final ScrollController scrollController = useScrollController();
    final usedList = (state.isSearching && state.searchValue.isNotEmpty)
        ? state.searchItems
        : state.items;

    return BlocListener<ItemsWidgetCubit, ItemsWidgetState>(
      listenWhen: (previous, current) {
        return previous.isSearching != current.isSearching;
      },
      listener: (context, state) {
        if (state.isSearching == true) {
          focusNode.requestFocus();
        }
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: PresistentHeaderDelegate(
              _HeaderOptions(
                  state: state,
                  cubit: cubit,
                  searchController: controller,
                  focusNode: focusNode),
            ),
          ),
          if (_isEmptySearch(state))
            const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'No Items',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          else if (state.displayItem.isGridView)
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => ItemGridWidget(item: usedList[index]),
                childCount: usedList.length,
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ItemListTile(item: usedList[index]),
                childCount: usedList.length,
              ),
            )
        ],
      ),
    );
  }

  bool _isEmptySearch(ItemsWidgetState state) {
    return state.isSearching &&
        state.searchItems.isEmpty &&
        state.searchValue.isNotEmpty;
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

  final ItemsWidgetState state;
  final ItemsWidgetCubit cubit;
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

  final ItemsWidgetState state;
  final ItemsWidgetCubit cubit;

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
            items: const [
              DropdownMenuItem<SortType>(
                child: Text('Creation time'),
                value: SortType.creationTime,
              ),
              DropdownMenuItem<SortType>(
                child: Text('Alphabetically'),
                value: SortType.alphabetically,
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
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () => cubit.displayChanged(
                    state.displayItem.isGridView
                        ? DisplayItems.listView
                        : DisplayItems.gridView),
                icon: Icon(state.displayItem.isGridView
                    ? Icons.grid_view
                    : Icons.list)),
          ],
        ),
      ],
    );
  }
}
