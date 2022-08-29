import 'package:flutter/material.dart';

class ReceiptItemWidget extends StatelessWidget {
  const ReceiptItemWidget({
    Key? key,
    required this.item,
    required this.unit,
    required this.quantity,
    required this.price,
    this.onRemove,
  }) : super(key: key);
  final String item;
  final String unit;

  final String quantity;
  final String price;
  final VoidCallback? onRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: LayoutBuilder(builder: (context, constrains) {
        return Row(
          children: [
            SizedBox(
              width: constrains.maxWidth * .225,
              child: Center(
                child: FittedBox(
                  child: Text(
                    item,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: constrains.maxWidth * .225,
              child: Center(
                child: FittedBox(
                  child: Text(
                    unit,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: constrains.maxWidth * .225,
              child: Center(
                child: FittedBox(
                  child: Text(
                    quantity,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: constrains.maxWidth * .225,
              child: Center(
                child: FittedBox(
                  child: Text(
                    price,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            if (onRemove != null)
              GestureDetector(
                onTap: onRemove,
                child: SizedBox(
                  width: constrains.maxWidth * .1,
                  child: const Center(
                    child: FittedBox(
                      child: Icon(
                        Icons.remove,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
