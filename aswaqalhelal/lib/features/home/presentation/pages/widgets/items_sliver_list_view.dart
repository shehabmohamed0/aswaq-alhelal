import 'package:flutter/material.dart';

import '../../../../institution_items/domain/entities/institution_item.dart';
import 'item_list_widget.dart';

class ItemsSliverListView extends StatelessWidget {
  const ItemsSliverListView({
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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => InkWell(
            onTap: () {
              onItemPressed?.call(institutions[index]);
            },
            onLongPress: () {
              onItemLongPressed?.call(institutions[index]);
            },
            child: ItemCard(item: institutions[index])),
        childCount: institutions.length,
      ),
    );
  }
}
