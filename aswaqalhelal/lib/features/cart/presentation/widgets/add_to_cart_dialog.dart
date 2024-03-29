import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:aswaqalhelal/locator/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../l10n/l10n.dart';
import '../../../home/presentation/pages/widgets/custom_drop_down_button.dart';
import '../../../institution_items/domain/entities/institution_item.dart';
import '../../../institution_items/domain/entities/unit.dart';
import '../../../orders/domain/entities/order_item.dart';
import '../cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart';

class ItemAddToCartDialog extends StatelessWidget {
  const ItemAddToCartDialog({Key? key, required this.item}) : super(key: key);
  final InstitutionItem item;
  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
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
              Navigator.of(context).pop(OrderItem(
                  item: item,
                  unit: state.selectedUnit!,
                  quantity: state.quantity,
                  price: state.selectedUnit!.price));
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (item.imageUrl == null) const Spacer(),
                      item.imageUrl == null
                          ? const Expanded(
                              flex: 2,
                              child: FittedBox(
                                  child: FaIcon(FontAwesomeIcons.box)))
                          : CachedNetworkImage(
                              imageUrl: item.imageUrl!,
                            ),
                      if (item.imageUrl == null) const Spacer(),
                    ],
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
                        .map((e) => CustomDropdownMenuItem<Unit>(
                              value: e,
                              child: Text(e.name),
                            ))
                        .toList(),
                    hintText: intl.selectMeasureUnit,
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
                              text: intl.egp,
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
                        icon: const Icon(Icons.add),
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
                        onPressed: state.quantity > 0 ? cubit.removeItem : null,
                        icon: Icon(
                          Icons.remove,
                          color:
                              state.quantity > 0 ? Colors.black : Colors.grey,
                        ),
                        splashRadius: 22,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Total price ', style: theme.textTheme.titleLarge),
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
                                    text: intl.egp,
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
                          child: Text(intl.addToCart)))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
