import 'package:flutter/material.dart';

class UnitWidget extends StatelessWidget {
  const UnitWidget({
    Key? key,
    required this.name,
    required this.quantity,
    required this.price,
     this.color,
    this.onRemove,
  }) : super(key: key);
  final String name;
  final String quantity;
  final String price;
  final Color? color;
  final VoidCallback? onRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: color),
      child: LayoutBuilder(builder: (context, constrains) {
        return Row(
          children: [
            SizedBox(
              width: constrains.maxWidth * .3,
              child: Center(
                child: FittedBox(
                  child: Text(
                    name,
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
              width: constrains.maxWidth * .3,
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
              width: constrains.maxWidth * .3,
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
