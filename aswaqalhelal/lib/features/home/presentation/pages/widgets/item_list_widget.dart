import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../institution_items/domain/entities/institution_item.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final InstitutionItem item;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffECEDF1),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: item.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 4,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(item.units[0].name),
                  const Spacer(),
                  Text('${item.units[0].price}' ' EGP',
                      style: theme.textTheme.titleMedium!
                          .copyWith(color: Colors.green)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
