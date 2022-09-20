import 'dart:developer';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/font_awesome_flutter.dart';

import '../../../../core/request_state.dart';
import '../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../home/presentation/pages/widgets/items_widget.dart';
import '../../../institution_items/domain/entities/cart_item.dart';
import '../../../institution_items/presentation/cubit/institution_cart/institution_cart_cubit.dart';
import '../../../user_institutions/domain/entities/institution.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/loading_widget.dart';
import '../cubit/client_institution/client_institutions_cubit.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/item_add_to_cart_dialog.dart';

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
        ModalRoute.of(context)!.settings.arguments as Institution;
    final user = context.select((AppBloc element) => element.state.user);
    return Scaffold(
      appBar: AppBar(
        title: Text(institution.nickName),
      ),
      body: BlocBuilder<ClientInstitutionsCubit, ClientInstitutionsState>(
        builder: (context, state) {
          switch (state.itemsState) {
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
                  child: ItemsWidget(
                    items: state.items,
                    onItemPressed: (item) async {
                      if (user.id == institution.userId) {
                        log('message');
                      } else {
                        final cartItem = await showDialog<CartItem>(
                          context: context,
                          builder: (context) {
                            return ItemAddToCartDialog(
                              item: item,
                            );
                          },
                        );
                        if (cartItem != null) {
                          cubit.addCartItem(cartItem);
                        }
                      }
                    },
                    onItemLongPressed: (item) {},
                  ),
                ),
                expandableContent:
                    BlocBuilder<InstitutionCartCubit, InstitutionCartState>(
                        builder: (context, state) {
                  return state.cartItems.isEmpty
                      ? kEmptyWidget
                      : Container(
                          color: Colors.grey.shade200,
                          padding: const EdgeInsets.all(8),
                          child: CustomScrollView(shrinkWrap: true, slivers: [
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) => CartItemWidget(
                                        cartItem: state.cartItems[index]),
                                    childCount: state.cartItems.length)),
                            const SliverToBoxAdapter(
                                child: SizedBox(height: 8)),
                            SliverToBoxAdapter(
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        CartConfirmationDialog(),
                                  );
                                },
                                child: const Text('Order now'),
                              ),
                            )
                          ]),
                        );
                }),
                persistentHeader:
                    BlocConsumer<InstitutionCartCubit, InstitutionCartState>(
                  listener: (context, state) {
                    key.currentState!.setState(() {});
                  },
                  builder: (context, state) {
                    if (state.cartItems.isEmpty) {
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
                                style: Theme.of(context).textTheme.titleMedium,
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
