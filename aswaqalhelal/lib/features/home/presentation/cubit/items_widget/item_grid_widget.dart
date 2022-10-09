import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemGridWidget2 extends StatelessWidget {
  const ItemGridWidget2({
    Key? key,
    required this.imageURL,
    required this.itemName,
    required this.unitName,
    required this.unitPrice,
    required this.onPressed,
    this.onLongPressed,
  }) : super(key: key);
  final String imageURL;
  final String itemName;
  final String unitName;
  final double unitPrice;
  final VoidCallback onPressed;
  final VoidCallback? onLongPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPressed,
      child: Container(
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
                Flexible(
                  child: CachedNetworkImage(
                    imageUrl: imageURL,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  itemName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  unitName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text('$unitPrice' ' EGP',
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: Colors.green))
              ],
            );
          },
        ),
      ),
    );
  }
}


/*

class ItemGridWidget extends StatefulWidget {
  const ItemGridWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final InstitutionItem item;

  @override
  State<ItemGridWidget> createState() => _ItemGridWidgetState();
}

class _ItemGridWidgetState extends State<ItemGridWidget> {
  num number = 0;
  final TextEditingController controller = TextEditingController(text: '0');
  final FocusNode focusNode = FocusNode();

  Unit? unit;
  @override
  void initState() {
    unit = widget.item.units.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        log('message');
        focusNode.unfocus();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey.shade200,
            ),
          ],
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: LayoutBuilder(
          builder: (context, constrains) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: widget.item.imageUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: DropdownButtonFormField<Unit>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      isCollapsed: true,
                      isDense: true,
                      contentPadding: EdgeInsets.all(4),
                    ),
                    items: widget.item.units
                        .map((e) => DropdownMenuItem<Unit>(
                            value: e,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: FittedBox(
                                    child: Text(
                                      '${e.price}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: FittedBox(
                                    child: Text(
                                      ' \\ ${e.name}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            )))
                        .toList(),
                    onChanged: (unit) {
                      setState(() {
                        this.unit = unit;
                      });
                    },
                    isDense: true,
                    value: unit,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact),
                          onPressed: number > 0
                              ? () {
                                  setState(() {
                                    number = number - 1;
                                    controller.text = number.toString();
                                  });
                                }
                              : null,
                          onLongPress: number > 0
                              ? () {
                                  setState(() {
                                    if (number <= 10) {
                                      number = 0;
                                      controller.text = '0';
                                    } else {
                                      number = number - 10;
                                      controller.text = number.toString();
                                    }
                                  });
                                }
                              : null,
                          child: const Text(
                            '-',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onLongPress: () {
                            focusNode.requestFocus();

                            controller.selection = TextSelection(
                                baseOffset: 0,
                                extentOffset: controller.text.length);
                          },
                          child: AbsorbPointer(
                            absorbing: true,
                            child: TextFormField(
                              controller: controller,
                              onChanged: (value) {
                                final n = num.tryParse(value);
                                if (n != null) {
                                  setState(() {
                                    number = n;
                                  });
                                }
                              },
                              focusNode: focusNode,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.green,
                              visualDensity: VisualDensity.compact),
                          onPressed: () {
                            setState(() {
                              number = number + 1;
                              controller.text = number.toString();
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              number = number + 10;
                              controller.text = number.toString();
                            });
                          },
                          child: const Text(
                            '+',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

*/