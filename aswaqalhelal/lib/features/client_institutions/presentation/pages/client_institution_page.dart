import 'dart:developer';

import 'package:aswaqalhelal/features/home/presentation/cubit/items_widget/items_widget_cubit%20copy.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/font_awesome_flutter.dart';

import '../../../../core/request_state.dart';
import '../../../auth/domain/entities/institution_profile.dart';
import '../../../cart/presentation/cubit/institution_cart/institution_cart_cubit.dart';
import '../../../cart/presentation/widgets/add_to_cart_dialog.dart';
import '../../../cart/presentation/widgets/cart_item_widget.dart';
import '../../../home/presentation/cubit/items_widget/item_grid_widget.dart';
import '../../../home/presentation/cubit/items_widget/item_list_widget.dart';
import '../../../home/presentation/cubit/items_widget/items_widget_2.dart';
import '../../../orders/domain/entities/order_item.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/loading_widget.dart';
import '../cubit/client_institution/client_institutions_cubit.dart';

class ClientInstitutionPage extends StatefulWidget {
  const ClientInstitutionPage({Key? key}) : super(key: key);

  @override
  State<ClientInstitutionPage> createState() => _ClientInstitutionPageState();
}

class _ClientInstitutionPageState extends State<ClientInstitutionPage> {
  GlobalKey<ExpandableBottomSheetState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstitutionCartCubit>();
    final institution =
        ModalRoute.of(context)!.settings.arguments as InstitutionProfile;
    return BlocProvider<ItemsWidgetCubit2<OrderItem>>(
      create: (context) => ItemsWidgetCubit2<OrderItem>(
        dateTimeValue: (p0) => p0.item.creationTime,
        stringValue: (p0) => p0.item.name,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(institution.nickName),
        ),
        body: BlocConsumer<ClientInstitutionsCubit, ClientInstitutionsState>(
          listener: (context, state) {
            context
                .read<ItemsWidgetCubit2<OrderItem>>()
                .initialized(state.ordersItems);
          },
          builder: (context, state) {
            log('Rebuild');
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
                // return ItemsWidget(
                //   items: state.items,
                //   onItemPressed: (item) {},
                // );

                return ExpandableBottomSheet(
                  key: key,
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
                          onAdd: () {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              context
                                  .read<ClientInstitutionsCubit>()
                                  .add(orderItem);
                            });
                          },
                          onRemove: () {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              context
                                  .read<ClientInstitutionsCubit>()
                                  .reduce(orderItem);
                            });
                          },
                        );
                      },
                      onItemPressed: (orderItem) async {
                        // final cartItem = await showDialog<OrderItem>(
                        //   context: context,
                        //   builder: (context) {
                        //     return ItemAddToCartDialog(
                        //       item: orderItem.item,
                        //     );
                        //   },
                        // );
                        // if (cartItem != null) {
                        //   cubit.addCartItem(cartItem);
                        // }
                      },
                      onItemLongPressed: (item) {},
                    ),
                  ),
                  expandableContent: BlocBuilder<ClientInstitutionsCubit,
                      ClientInstitutionsState>(builder: (context, state) {
                    final cartItems = state.cartItems.entries.toList();
                    return state.cartItems.isEmpty
                        ? kEmptyWidget
                        : Container(
                            color: Colors.grey.shade200,
                            padding: const EdgeInsets.all(8),
                            child: CustomScrollView(shrinkWrap: true, slivers: [
                              SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) => CartItemWidget(
                                          cartItem: cartItems[index].value),
                                      childCount: cartItems.length)),
                              const SliverToBoxAdapter(
                                  child: SizedBox(height: 8)),
                              SliverToBoxAdapter(
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const CartConfirmationDialog(),
                                    );
                                  },
                                  child: const Text('Order now'),
                                ),
                              )
                            ]),
                          );
                  }),
                  persistentHeader: BlocConsumer<ClientInstitutionsCubit,
                      ClientInstitutionsState>(
                    listener: (context, state) {
                      log('listener');
                      key.currentState!.setState(() {});
                    },
                    builder: (context, state) {
                      log(state.cartItems.length.toString());
                      if (state.cartItems.isEmpty) {
                        log('empty');
                        return Container();
                      }

                      return Container(
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
                      );
                    },
                  ),
                  enableToggle: true,
                );
            }
          },
        ),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
