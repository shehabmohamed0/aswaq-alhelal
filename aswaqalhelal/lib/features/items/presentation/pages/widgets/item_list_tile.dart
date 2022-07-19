import 'package:flutter/material.dart';

import '../../../../instutution_items/domain/entities/institution_item.dart';

class ItemListTile extends StatelessWidget {
  const ItemListTile({
    Key? key,
    required this.item,
  }) : super(key: key);
  final InstitutionItem item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/commodity_black.png',
        width: 32,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(item.name,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              Text('${item.units.first.price}')
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
      isThreeLine: true,
      subtitle: const Text('asd'),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
