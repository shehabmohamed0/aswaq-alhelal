import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/font_awesome_flutter.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../../home/presentation/cubit/items_widget/items_widget_cubit.dart';
import '../../../../home/presentation/pages/widgets/items_widget.dart';
import '../../../../user_institutions/domain/entities/institution.dart';
import '../../../../widgets/check_internet_connection_widget.dart';
import '../../../domain/entities/cart_item.dart';
import '../../../domain/entities/institution_item.dart';
import '../../bloc/add_item/add_item_bloc.dart';
import '../../cubit/institution_cart/institution_cart_cubit.dart';
import '../../cubit/institution_items/institution_items_cubit.dart';
import '../add_item/add_items_page.dart';
import '../../../../client_institutions/presentation/widgets/item_add_to_cart_dialog.dart';

class InstitutionItemsPage extends StatelessWidget {
  const InstitutionItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstitutionItemsCubit>();
    final user = context.read<AppBloc>().state.profile;

    final institution =
        (ModalRoute.of(context)!.settings.arguments as Institution);
    return BlocBuilder<InstitutionItemsCubit, InstitutionItemsState>(
      builder: (context, state) {
        if (state is InstitutionsItemsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is InstitutionItemsLoaded) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ItemsWidgetCubit>(
                create: (context) => locator()..initialized(state.items),
              ),
              BlocProvider<InstitutionCartCubit>(
                create: (context) => locator(),
              ),
            ],
            child: _InstitutionsLoadedWidget(
                state: state, institution: institution, userId: user.id),
          );
        } else if (state is InstitutionItemsEmpty) {
          return BlocProvider<ItemsWidgetCubit>(
              create: (context) => locator()..initialized([]),
              child: _InstitutionItemsEmptyWidget(
                institution: institution,
                userId: user.id,
              ));
        } else if (state is InstitutionsItemsError) {
          return CheckInternetConnection(
            onPressed: () {
              cubit.getInstitutionsItems(institution.id);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstitutionsLoadedWidget extends StatefulWidget {
  final InstitutionItemsLoaded state;
  final Institution institution;
  final String userId;
  const _InstitutionsLoadedWidget({
    Key? key,
    required this.state,
    required this.institution,
    required this.userId,
  }) : super(key: key);

  @override
  State<_InstitutionsLoadedWidget> createState() =>
      _InstitutionsLoadedWidgetState();
}

class _InstitutionsLoadedWidgetState extends State<_InstitutionsLoadedWidget> {
  GlobalKey<ExpandableBottomSheetState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final items = widget.state.items;
    final cubit = context.read<InstitutionCartCubit>();
    return Scaffold(
      backgroundColor: const Color(0xFFFAFFFF),
      appBar: AppBar(
        title: const Text('items'),
        actions: widget.userId != widget.institution.userId
            ? null
            : [
                TextButton(
                  child: const Text('Add'),
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    _navigateToAddItem(context);
                  },
                )
              ],
      ),
      body: ExpandableBottomSheet(
        key: key,
        background: Padding(
          padding: const EdgeInsets.all(8),
          child: ItemsWidget.withoutProvider(
            items: items,
            onItemPressed: (item) async {
              if (widget.userId == widget.institution.userId) {
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
            onItemLongPressed: (item) {
              if (widget.userId == widget.institution.userId) {
                _navigateToEditItem(context, item);
              }
            },
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

            log(state.totalPrice.toString());
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
                          imageUrl: state.cartItems[index].item.imageUrl,
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
                                state.cartItems[index].selectedUnit.name,
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
                                      onPressed: () {
                                        cubit.add(state.cartItems[index]);
                                      },
                                      icon: const Icon(Icons.add)),
                                  Text('${state.cartItems[index].quantity}'),
                                  IconButton(
                                      onPressed: () {
                                        cubit.reduce(state.cartItems[index]);
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
      ),
    );
  }

  void _navigateToEditItem(BuildContext context, InstitutionItem item) {
    Navigator.of(context).push(MaterialPageRoute(
      settings:
          RouteSettings(name: Routes.addItem, arguments: widget.institution.id),
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider<AddItemBloc>(
            create: (context) => locator()..add(InitEdit(item)),
          ),
          BlocProvider.value(
            value: context.read<ItemsWidgetCubit>(),
          ),
        ],
        child: const AddItemPage(),
      ),
    ));
  }

  void _navigateToAddItem(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: RouteSettings(
            name: Routes.addItem, arguments: widget.institution.id),
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<AddItemBloc>(
              create: (context) => locator(),
            ),
            BlocProvider.value(
              value: context.read<ItemsWidgetCubit>(),
            ),
            BlocProvider.value(
              value: context.read<InstitutionItemsCubit>(),
            ),
          ],
          child: const AddItemPage(),
        ),
      ),
    );
  }
}

class _InstitutionItemsEmptyWidget extends StatelessWidget {
  const _InstitutionItemsEmptyWidget({
    Key? key,
    required this.institution,
    required this.userId,
  }) : super(key: key);
  final Institution institution;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(userId == institution.userId
            ? 'You have no items'
            : 'Their is no items'),
        const SizedBox(height: 8),
        if (userId == institution.userId)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: const Text('Add item'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                settings: RouteSettings(
                    name: Routes.addItem, arguments: institution.id),
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<AddItemBloc>(
                      create: (context) => locator(),
                    ),
                    BlocProvider.value(
                      value: context.read<ItemsWidgetCubit>(),
                    ),
                    BlocProvider.value(
                      value: context.read<InstitutionItemsCubit>(),
                    ),
                  ],
                  child: const AddItemPage(),
                ),
              ));
            },
          )
      ],
    );
  }
}
