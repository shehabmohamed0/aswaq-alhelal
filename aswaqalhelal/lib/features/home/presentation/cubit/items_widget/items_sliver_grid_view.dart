import 'package:aswaqalhelal/features/home/presentation/cubit/items_widget/item_grid_widget.dart';
import 'package:flutter/material.dart';

class ItemsSliverGridView2<T> extends StatelessWidget {
  const ItemsSliverGridView2(
      {Key? key,
      required this.onItemPressed,
      required this.institutions,
      required this.onItemLongPressed,
      required this.widgetBuilder})
      : super(key: key);

  final Function(T institution)? onItemPressed;
  final List<T> institutions;
  final Function(T institution)? onItemLongPressed;
  final Widget Function(T) widgetBuilder;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 4),
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
            onTap: () {
              onItemPressed?.call(institutions[index]);
            },
            onLongPress: () {
              onItemLongPressed?.call(institutions[index]);
            },
            child: widgetBuilder(institutions[index])),
        childCount: institutions.length,
      ),
    );
  }
}
