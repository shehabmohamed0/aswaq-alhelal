import 'package:aswaqalhelal/features/widgets/check_internet_connection_widget.dart';
import 'package:flutter/material.dart';
import 'package:geo_presentation/features/presentation/widgets/normal_text_field.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_hooks.dart';

import '../../cubit/items/items_cubit.dart';
import 'item_grid_widget.dart';
import 'item_list_tile.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemsCubit>(
      create: (context) => locator()..getItems(),
      child: BlocBuilder<ItemsCubit, ItemsState>(
        buildWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType,
        builder: (context, state) {
          return state.map(
            initial: (initial) {
              return const SizedBox.shrink();
            },
            loading: (loading) {
              return const Center(child: CircularProgressIndicator());
            },
            error: (error) {
              return CheckInternetConnection(onPressed: () {
                context.read<ItemsCubit>().getItems();
              });
            },
            loaded: (loaded) {
              return BlocBuilder<ItemsCubit, ItemsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    loaded: (state) {
                      return _LoadedWidget(
                        state: state,
                      );
                    },
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class PresentantWidget extends SliverPersistentHeaderDelegate {
  final _HeaderOptions _headerOptions;
  PresentantWidget(
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

  final Loaded state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ItemsCubit>();
    final TextEditingController controller = useTextEditingController();
    final focusNode = useFocusNode();
    final ScrollController scrollController = useScrollController();
    final usedList = (state.isSearching && state.searchValue.isNotEmpty)
        ? state.searchItems
        : state.items;

    return BlocListener<ItemsCubit, ItemsState>(
      listenWhen: (previous, current) {
        if (previous is Loaded && current is Loaded) {
          return previous.isSearching != current.isSearching;
        }
        return false;
      },
      listener: (context, state) {
        state.mapOrNull(
          loaded: (state) {
            if (state.isSearching == true) {
              focusNode.requestFocus();
            }
          },
        );
      },
      child: RefreshIndicator(
        onRefresh: () async {
          await cubit.getItems();
        },
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPersistentHeader(
              floating: true,
              delegate: PresentantWidget(
                _HeaderOptions(
                    state: state,
                    cubit: cubit,
                    searchController: controller,
                    focusNode: focusNode),
              ),
            ),
            if (_isEmptySerch)
              const SliverToBoxAdapter(
                  child: Center(
                      child: Text(
                'No Items',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black45,
                    fontWeight: FontWeight.w600),
              )))
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
      ),
    );
  }

  bool get _isEmptySerch {
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

  final Loaded state;
  final ItemsCubit cubit;
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

  final Loaded state;
  final ItemsCubit cubit;

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
