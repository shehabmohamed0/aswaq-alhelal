import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';

import '../../../institution_items/presentation/cubit/institution_cart/institution_cart_cubit.dart';
import '../../../orders/domain/entities/order_item.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  final OrderItem cartItem;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstitutionCartCubit>();
    return Container(
      height: 120,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: cartItem.item.imageUrl,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          cartItem.item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        visualDensity: VisualDensity.compact,
                        splashRadius: 16,
                        onPressed: () {
                          cubit.remove(cartItem);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
                Flexible(
                    child: FittedBox(
                  child: Text(
                    cartItem.unit.name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400),
                  ),
                )),
                Flexible(
                  child: FittedBox(
                    child: Text(
                      '${cartItem.unit.price}'
                      ' EGP',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () => cubit.add(cartItem),
                          icon: const Icon(Icons.add)),
                      Text('${cartItem.quantity}'),
                      IconButton(
                          onPressed: cartItem.quantity > 0
                              ? () => cubit.reduce(cartItem)
                              : null,
                          icon: const Icon(Icons.remove)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
