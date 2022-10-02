import 'package:flutter/material.dart';

import '../../../../institution_items/domain/entities/institution_item.dart';
import 'item_grid_widget.dart';

class ItemsSliverGridView extends StatelessWidget {
  const ItemsSliverGridView({
    Key? key,
    required this.onItemPressed,
    required this.institutions,
    required this.onItemLongPressed,
  }) : super(key: key);

  final Function(InstitutionItem institution)? onItemPressed;
  final List<InstitutionItem> institutions;
  final Function(InstitutionItem institution)? onItemLongPressed;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 9 / 16),
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
            onTap: () {
              onItemPressed?.call(institutions[index]);
            },
            onLongPress: () {
              onItemLongPressed?.call(institutions[index]);
            },
            child: ItemGridWidget(item: institutions[index])),
        childCount: institutions.length,
      ),
    );
  }
}
