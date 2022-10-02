import 'package:flutter/material.dart';

class ItemsSliverListView2<T> extends StatelessWidget {
  const ItemsSliverListView2({
    Key? key,
    required this.onItemPressed,
    required this.institutions,
    required this.onItemLongPressed,
    required this.widgetBuilder,
  }) : super(key: key);

  final Function(T institution)? onItemPressed;
  final List<T> institutions;
  final Function(T institution)? onItemLongPressed;
  final Widget Function(T) widgetBuilder;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => InkWell(
            onTap: () {
              onItemPressed?.call(institutions[index]);
            },
            onLongPress: () {
              onItemLongPressed?.call(institutions[index]);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: widgetBuilder(institutions[index]),
            )),
        childCount: institutions.length,
      ),
    );
  }
}
