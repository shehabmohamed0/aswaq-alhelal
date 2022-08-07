import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';

import '../../../../../home/presentation/pages/widgets/custom_drop_down_button.dart';
import '../../../../domain/entities/cart_item.dart';
import '../../../../domain/entities/institution_item.dart';
import '../../../../domain/entities/unit.dart';
import '../../../cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart';

class ItemAddToCartDialog extends StatelessWidget {
  const ItemAddToCartDialog({Key? key, required this.item}) : super(key: key);
  final InstitutionItem item;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<ItemAddToCartDialogCubit>(
      create: (context) => locator(),
      child: Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: BlocConsumer<ItemAddToCartDialogCubit, ItemAddToCartDialogState>(
          listener: (context, state) {
            if (state.cartSubmitted) {
              Navigator.of(context).pop(CartItem(
                  item: item,
                  selectedUnit: state.selectedUnit!,
                  quantity: state.quantity));
            }
          },
          builder: (context, state) {
            final cubit = context.read<ItemAddToCartDialogCubit>();
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.name,
                    style: theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  CustDropDown<Unit>(
                    defaultSelectedIndex: 0,
                    items: item.units
                        .map((e) => CustDropdownMenuItem<Unit>(
                              child: Text(e.name),
                              value: e,
                            ))
                        .toList(),
                    hintText: "Select measure unit",
                    borderRadius: 5,
                    onChanged: (unit) {
                      cubit.changeUnit(unit);
                    },
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    flex: 0,
                    child: FittedBox(
                        child: RichText(
                      text: TextSpan(
                          text: '${item.units.first.price}',
                          style: theme.textTheme.titleLarge!
                              .copyWith(color: Colors.green),
                          children: [
                            TextSpan(
                              text: ' EGP',
                              style: theme.textTheme.titleSmall!
                                  .copyWith(color: Colors.green),
                            ),
                          ]),
                    )),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          cubit.addItem();
                        },
                        icon: Icon(Icons.add),
                        splashRadius: 22,
                      ),
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            '${state.quantity}',
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cubit.removeItem();
                        },
                        icon: Icon(Icons.remove),
                        splashRadius: 22,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Total price ',
                        style: theme.textTheme.titleLarge,
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: FittedBox(
                              child: RichText(
                            text: TextSpan(
                                text: '${state.totalPrice}',
                                style: theme.textTheme.titleLarge!
                                    .copyWith(color: Colors.green),
                                children: [
                                  TextSpan(
                                    text: ' EGP',
                                    style: theme.textTheme.titleSmall!
                                        .copyWith(color: Colors.green),
                                  ),
                                ]),
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            cubit.submit();
                          },
                          child: const Text('Add to cart')))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}