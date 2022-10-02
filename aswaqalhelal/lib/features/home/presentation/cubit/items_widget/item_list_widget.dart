import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../institution_items/domain/entities/unit.dart';

class ItemListWidget2 extends StatelessWidget {
  factory ItemListWidget2.client({
    required String imageURL,
    required String itemName,
    required String unitName,
    required double unitPrice,
    required int? quantity,
    required double? totalPrice,
    required List<Unit>? units,
    required Unit? selectedUnit,
    required VoidCallback? onAdd,
    required VoidCallback? onRemove,
  }) =>
      ItemListWidget2._(
          imageURL: imageURL,
          itemName: itemName,
          unitName: unitName,
          unitPrice: unitPrice,
          isClient: true,
          quantity: quantity,
          totalPrice: totalPrice,
          units: units,
          selectedUnit: selectedUnit,
          onAdd: onAdd,
          onRemove: onRemove);
  factory ItemListWidget2.owner({
    required String imageURL,
    required String itemName,
    required String unitName,
    required double unitPrice,
  }) =>
      ItemListWidget2._(
        imageURL: imageURL,
        itemName: itemName,
        unitName: unitName,
        unitPrice: unitPrice,
        isClient: false,
      );

  const ItemListWidget2._({
    Key? key,
    required this.imageURL,
    required this.itemName,
    required this.unitName,
    required this.unitPrice,
    required this.isClient,
    this.quantity,
    this.totalPrice,
    this.units,
    this.selectedUnit,
    this.onAdd,
    this.onRemove,
  }) : super(key: key);

  final String imageURL;
  final String itemName;
  final String unitName;
  final double unitPrice;
  final bool isClient;
  final int? quantity;
  final double? totalPrice;
  final List<Unit>? units;
  final Unit? selectedUnit;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
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
                  child: CachedNetworkImage(
                    imageUrl: imageURL,
                    width: 140,
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.amber,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          itemName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        if (isClient)
                          DropdownButtonFormField<Unit>(
                            isExpanded: true,
                            alignment: AlignmentDirectional.bottomStart,
                            decoration: const InputDecoration(
                              isCollapsed: true,
                              isDense: true,
                              contentPadding: EdgeInsets.all(4),
                            ),
                            items: units!
                                .map((e) => DropdownMenuItem<Unit>(
                                    value: e,
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: FittedBox(
                                            child: Text(
                                              '${e.price} \\ ',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: FittedBox(
                                            child: Text(
                                              e.name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )))
                                .toList(),
                            onChanged: (unit) {},
                            isDense: true,
                            value: selectedUnit,
                          ),
                        const Text(
                          'Total Price: 0.0',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.directional(
            textDirection: TextDirection.ltr,
            bottom: 0,
            end: 0,
            child: Container(
              height: 40,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0xffECEDF1),
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
              ]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: onRemove,
                  ),
                   Text('$quantity'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}

/*
    Flexible(
                flex: 3,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact),
                          onPressed: () {},
                          onLongPress: () {},
                          child: const Text(
                            '-',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Material(
                          color: Colors.red,
                          child: GestureDetector(
                            onLongPress: () {},
                            child: AbsorbPointer(
                              absorbing: true,
                              child: TextFormField(
                                initialValue: '0.00',
                                onChanged: (value) {},
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.green,
                              visualDensity: VisualDensity.compact),
                          onPressed: () {},
                          onLongPress: () {},
                          child: const Text(
                            '+',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
         
 */