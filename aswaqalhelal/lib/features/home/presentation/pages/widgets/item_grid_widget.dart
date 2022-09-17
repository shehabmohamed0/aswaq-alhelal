import 'package:flutter/material.dart';

import '../../../../institution_items/domain/entities/institution_item.dart';

class ItemGridWidget extends StatelessWidget {
  const ItemGridWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final InstitutionItem item;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 2,
          color: Colors.grey.shade200,
        ),
      ]),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (context, constrains) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(
                    item.imageUrl,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                item.units.first.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text('${item.units.first.price}' ' EGP',
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: Colors.green))
            ],
          );
        },
      ),
    );
  }
}
