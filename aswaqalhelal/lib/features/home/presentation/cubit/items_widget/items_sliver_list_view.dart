import 'package:flutter/material.dart';

class ItemsSliverListView2<T> extends StatelessWidget {
  const ItemsSliverListView2({
    Key? key,
    required this.institutions,
    required this.widgetBuilder,
  }) : super(key: key);

  final List<T> institutions;
  final Widget Function(T) widgetBuilder;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          child: widgetBuilder(institutions[index]),
        ),
        childCount: institutions.length,
      ),
    );
  }
}
