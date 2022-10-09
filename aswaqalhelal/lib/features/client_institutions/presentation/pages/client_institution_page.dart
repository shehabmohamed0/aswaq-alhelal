import 'package:aswaqalhelal/features/auth/domain/entities/user_profile.dart';
import 'package:aswaqalhelal/features/auth/presentation/bloc/app_status/app_bloc.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/packages/font_awesome_flutter.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../core/request_state.dart';
import '../../../auth/domain/entities/institution_profile.dart';
import '../../../cart/presentation/widgets/add_to_cart_dialog.dart';
import '../../../home/presentation/cubit/items_widget/item_grid_widget.dart';
import '../../../home/presentation/cubit/items_widget/item_list_widget.dart';
import '../../../home/presentation/cubit/items_widget/items_widget.dart';
import '../../../orders/domain/entities/order_item.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/loading_widget.dart';
import '../cubit/client_institution/client_institutions_cubit.dart';

class ClientInstitutionPage extends StatelessWidget {
  const ClientInstitutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final institution =
        ModalRoute.of(context)!.settings.arguments as InstitutionProfile;
    final user = context.select((AppBloc element) => element.state.profile);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(institution.nickName)),
      body: BlocConsumer<ClientInstitutionsCubit, ClientInstitutionsState>(
        listener: (context, state) {
          switch (state.placeOrderState) {
            case RequestState.initial:
              break;
            case RequestState.loading:
              EasyLoading.show(
                  indicator: const FittedBox(
                child: SpinKitRipple(
                  duration: Duration(milliseconds: 1200),
                  color: Colors.white,
                ),
              ));
              break;
            case RequestState.loaded:
              EasyLoading.dismiss();
              showSuccessSnackBar(
                  context, 'You order has been placed sucessfully');
              Navigator.pop(context);

              break;
            case RequestState.error:
              showErrorSnackBar(context, state.errorMessage!);
              break;
          }
        },
        builder: (context, state) {
          final cubit = context.read<ClientInstitutionsCubit>();
          switch (state.ordersItemsState) {
            case RequestState.initial:
              return kEmptyWidget;
            case RequestState.loading:
              return const LoadingWidget();
            case RequestState.error:
              return CheckInternetConnection(onPressed: () {
                context.read<ClientInstitutionsCubit>().getItems(institution);
              });
            case RequestState.loaded:
              final keys = state.cartItems.keys.toList();
              final cartItems = state.cartItems;
              return ExpandableBottomSheet(
                key: key,
                enableToggle: true,
                animationDurationExtend: const Duration(milliseconds: 10),
                background: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ItemsWidget2<OrderItem>(
                      items: state.ordersItems,
                      dateTimeValue: (orderItem) => orderItem.item.creationTime,
                      stringValue: (orderItem) => orderItem.item.name,
                      gridBuilder: (orderItem) {
                        return ItemGridWidget2(
                          imageURL: orderItem.item.imageUrl,
                          itemName: orderItem.item.name,
                          unitName: orderItem.item.units.first.name,
                          unitPrice: orderItem.item.units.first.price,
                          onPressed: () async {
                            final cartItem = await showDialog<OrderItem>(
                              context: context,
                              builder: (context) {
                                return ItemAddToCartDialog(
                                  item: orderItem.item,
                                );
                              },
                            );
                            if (cartItem != null) {
                              cubit.update(cartItem, cartItem.quantity);
                            }
                          },
                        );
                      },
                      listBuilder: (orderItem) {
                        return ItemListWidget2.client(
                          imageURL: orderItem.item.imageUrl,
                          itemName: orderItem.item.name,
                          unitName: orderItem.item.units.first.name,
                          unitPrice: orderItem.item.units.first.price,
                          units: orderItem.item.units,
                          quantity: orderItem.quantity,
                          selectedUnit: orderItem.unit,
                          totalPrice: orderItem.quantity * orderItem.price,
                          onUnitChanged: (unit) {
                            cubit.changeItemUnit(orderItem, unit);
                          },
                          onCounterChanged: (counter) =>
                              cubit.update(orderItem, counter),
                          onAdd: () => WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            cubit.add(orderItem);
                          }),
                          onRemove: () => cubit.reduce(orderItem),
                        );
                      },
                      onItemPressed: (orderItem) {},
                      onItemLongPressed: (item) {},
                    )),
                persistentHeader: state.cartItems.isEmpty
                    ? kEmptyWidget
                    : Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        color: Theme.of(context).primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.cartShopping),
                            const Spacer(flex: 1),
                            Flexible(
                              flex: 2,
                              child: FittedBox(
                                child: Text(
                                  'Total price: ${state.totalPrice} EGP',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                            const Spacer(flex: 1),
                          ],
                        ),
                      ),
                expandableContent: state.cartItems.isEmpty
                    ? kEmptyWidget
                    : Container(
                        color: Colors.grey.shade200,
                        padding: const EdgeInsets.all(8),
                        child: CustomScrollView(shrinkWrap: true, slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final orderItem = cartItems[keys[index]]!;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: ItemListWidget2.client(
                                    isCart: true,
                                    imageURL: orderItem.item.imageUrl,
                                    itemName: orderItem.item.name,
                                    unitName: orderItem.item.units.first.name,
                                    unitPrice: orderItem.item.units.first.price,
                                    units: orderItem.item.units,
                                    quantity: orderItem.quantity,
                                    selectedUnit: orderItem.unit,
                                    totalPrice:
                                        orderItem.quantity * orderItem.price,
                                    onUnitChanged: (unit) {},
                                    onCounterChanged: (counter) =>
                                        cubit.update(orderItem, counter),
                                    onAdd: () => cubit.add(orderItem),
                                    onRemove: () => cubit.reduce(orderItem),
                                  ),
                                );
                              },
                              childCount: cartItems.length,
                            ),
                          ),
                          const SliverToBoxAdapter(child: SizedBox(height: 8)),
                          SliverToBoxAdapter(
                            child: ElevatedButton(
                              onPressed: () async {
                                final accepted = await showDialog<bool>(
                                  context: context,
                                  builder: (context) =>
                                      const CartConfirmationDialog(),
                                );

                                if (accepted ?? false) {
                                  cubit.placeOrder(
                                      institution, user as UserProfile);
                                }
                              },
                              child: const Text('Order now'),
                            ),
                          )
                        ]),
                      ),
              );
          }
        },
      ),
    );
  }
}

class CartConfirmationDialog extends StatelessWidget {
  const CartConfirmationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Are you sure you want to\norder now ?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Confirm'),
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.grey, elevation: 0),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
