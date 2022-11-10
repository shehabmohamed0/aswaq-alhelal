import 'package:aswaqalhelal/features/home/presentation/cubit/items_widget/item_grid_widget.dart';
import 'package:flutter/material.dart';

class ItemsSliverGridView2<T> extends StatelessWidget {
  const ItemsSliverGridView2(
      {Key? key,
      required this.institutions,
      required this.widgetBuilder})
      : super(key: key);

  final List<T> institutions;
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
        (context, index) => widgetBuilder(institutions[index]),
        childCount: institutions.length,
      ),
    );
  }
}
