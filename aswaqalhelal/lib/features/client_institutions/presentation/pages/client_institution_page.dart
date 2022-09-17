import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/font_awesome_flutter.dart';

import '../../../../core/request_state.dart';
import '../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../home/presentation/pages/widgets/items_widget.dart';
import '../../../institution_items/domain/entities/cart_item.dart';
import '../../../institution_items/presentation/cubit/institution_cart/institution_cart_cubit.dart';
import '../../../institution_items/presentation/pages/institution_items/widgets/item_add_to_cart_dialog.dart';
import '../../../user_institutions/domain/entities/institution.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/loading_widget.dart';
import '../cubit/client_institutions_cubit.dart';

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
                expandableContent:
                    BlocBuilder<InstitutionCartCubit, InstitutionCartState>(
                  builder: (context, state) {
                    return Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(8),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          height: 120,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      state.cartItems[index].item.imageUrl,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: FittedBox(
                                        child: Text(
                                          state.cartItems[index].item.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        child: FittedBox(
                                      child: Text(
                                        state
                                            .cartItems[index].selectedUnit.name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade400),
                                      ),
                                    )),
                                    Flexible(
                                      child: FittedBox(
                                        child: Text(
                                          '${state.cartItems[index].selectedUnit.price}'
                                          ' EGP',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                cubit.add(
                                                    state.cartItems[index]);
                                              },
                                              icon: const Icon(Icons.add)),
                                          Text(
                                              '${state.cartItems[index].quantity}'),
                                          IconButton(
                                              onPressed: () {
                                                cubit.reduce(
                                                    state.cartItems[index]);
                                              },
                                              icon: Icon(Icons.remove)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        itemCount: state.cartItems.length,
                      ),
                    );
                  },
                ),
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
                          const Spacer(),
                          Flexible(
                            child: FittedBox(
                              child: Text(
                                'Total price: ${state.totalPrice} EGP',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          const Spacer(),
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
