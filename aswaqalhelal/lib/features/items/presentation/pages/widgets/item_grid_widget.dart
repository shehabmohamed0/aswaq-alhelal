import '../../../../instutution_items/domain/entities/institution_item.dart';
import 'package:flutter/material.dart';

class ItemGridWidget extends StatelessWidget {
  const ItemGridWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final InstitutionItem item;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (context, constrains) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.more_vert),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Image.asset(
                          'assets/images/commodity_black.png',
                          width: constrains.maxWidth / 1.8,
                        ),
                      ),
                    ),
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
