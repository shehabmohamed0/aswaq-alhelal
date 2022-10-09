import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../institution_items/domain/entities/unit.dart';

class ItemListWidget2 extends StatefulWidget {
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
    required void Function(Unit unit)? onUnitChanged,
    required void Function(int counter)? onCounterChanged,
    bool isCart = false,
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
          onRemove: onRemove,
          onUnitChanged: onUnitChanged,
          onCounterChanged: onCounterChanged,
          isCart: isCart);
  factory ItemListWidget2.owner(
          {required String imageURL,
          required String itemName,
          required String unitName,
          required double unitPrice,
          required VoidCallback onLongPressed}) =>
      ItemListWidget2._(
        imageURL: imageURL,
        itemName: itemName,
        unitName: unitName,
        unitPrice: unitPrice,
        onPressed: onLongPressed,
        isClient: false,
        isCart: false,
      );

  const ItemListWidget2._(
      {Key? key,
      required this.imageURL,
      required this.itemName,
      required this.unitName,
      required this.unitPrice,
      required this.isClient,
      this.onPressed,
      this.quantity,
      this.totalPrice,
      this.units,
      this.selectedUnit,
      this.onAdd,
      this.onRemove,
      this.onUnitChanged,
      this.onCounterChanged,
      this.isCart = false})
      : super(key: key);

  final String imageURL;
  final String itemName;
  final String unitName;
  final double unitPrice;
  final bool isClient;
  final bool isCart;
  final VoidCallback? onPressed;
  final int? quantity;
  final double? totalPrice;
  final List<Unit>? units;
  final Unit? selectedUnit;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final Function(int counter)? onCounterChanged;
  final void Function(Unit unit)? onUnitChanged;
  @override
  State<ItemListWidget2> createState() => _ItemListWidget2State();
}

class _ItemListWidget2State extends State<ItemListWidget2> {
  bool enabled = false;
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    controller.text = widget.quantity.toString();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ItemListWidget2 oldWidget) {
    if (controller.text != widget.quantity.toString()) {
      controller.text = widget.quantity.toString();
      controller.selection = TextSelection.fromPosition(TextPosition(
        offset: controller.text.length,
      ));
    } else {
      if (focusNode.hasFocus) {
        focusNode.unfocus();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: InkWell(
            onLongPress: () {
              widget.onPressed?.call();
            },
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.imageURL,
                    width: 140,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: SizedBox(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.itemName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(height: 4),
                          if (widget.isClient)
                            if (widget.isCart)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: FittedBox(
                                      child: Text(
                                        '${widget.selectedUnit!.price} EGP \\ ',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: FittedBox(
                                      child: Text(
                                        widget.selectedUnit!.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            else
                              DropdownButtonFormField<Unit>(
                                isExpanded: true,
                                alignment: AlignmentDirectional.bottomStart,
                                decoration: const InputDecoration(
                                  isCollapsed: true,
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(4),
                                ),
                                items: widget.units!
                                    .map(
                                      (e) => DropdownMenuItem<Unit>(
                                        value: e,
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: FittedBox(
                                                child: Text(
                                                  '${e.price} \\ ',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: FittedBox(
                                                child: Text(
                                                  e.name,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.green),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (unit) {
                                  if (unit != null) {
                                    widget.onUnitChanged?.call(unit);
                                  }
                                },
                                isDense: true,
                                value: widget.selectedUnit,
                              )
                          else
                            Text(
                              widget.unitName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          const SizedBox(height: 4),
                          if (widget.isClient)
                            Text(
                              'Total Price: ${widget.selectedUnit!.price * widget.quantity!}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            )
                          else
                            Text(
                              '${widget.unitPrice}' ' EGP',
                              style: const TextStyle(color: Colors.green),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (widget.isClient)
          Positioned.directional(
              textDirection: TextDirection.ltr,
              bottom: 0,
              end: 0,
              child: Container(
                height: 40,
                width: 140,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Color(0xffECEDF1),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ]),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed:
                          (widget.quantity ?? 0) > 0 ? widget.onRemove : null,
                    ),
                    Flexible(
                      child: Material(
                        child: TextField(
                          focusNode: focusNode,
                          controller: controller,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.top,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: false,
                            signed: true,
                          ),
                          onChanged: (text) {
                            final number = int.tryParse(text);
                            log(number.toString());
                            if (number != null && number >= 0) {
                              widget.onCounterChanged?.call(number);
                            }
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: widget.onAdd,
                    ),
                  ],
                ),
              ))
      ]),
    );
  }
}
