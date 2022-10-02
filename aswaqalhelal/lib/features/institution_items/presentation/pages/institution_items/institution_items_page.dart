import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../auth/domain/entities/institution_profile.dart';
import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../../home/presentation/cubit/items_widget/item_grid_widget.dart';
import '../../../../home/presentation/cubit/items_widget/item_list_widget.dart';
import '../../../../home/presentation/cubit/items_widget/items_widget_2.dart';
import '../../../../home/presentation/cubit/items_widget/items_widget_cubit.dart';
import '../../../../widgets/check_internet_connection_widget.dart';
import '../../../domain/entities/institution_item.dart';
import '../../bloc/add_item/add_item_bloc.dart';
import '../../cubit/institution_items/institution_items_cubit.dart';
import '../add_item/add_items_page.dart';

class InstitutionItemsPage extends StatelessWidget {
  const InstitutionItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstitutionItemsCubit>();
    final user = context.read<AppBloc>().state.profile;

    final institution =
        (ModalRoute.of(context)!.settings.arguments as InstitutionProfile);
    return BlocBuilder<InstitutionItemsCubit, InstitutionItemsState>(
      builder: (context, state) {
        log(state.runtimeType.toString());
        if (state is InstitutionsItemsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is InstitutionItemsLoaded) {
          return _InstitutionsLoadedWidget(
              state: state, institution: institution, userId: user.userId);
        } else if (state is InstitutionItemsEmpty) {
          return _InstitutionItemsEmptyWidget(
            institution: institution,
            userId: user.id,
          );
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

class _InstitutionsLoadedWidget extends StatelessWidget {
  final InstitutionItemsLoaded state;
  final InstitutionProfile institution;
  final String userId;
  const _InstitutionsLoadedWidget({
    Key? key,
    required this.state,
    required this.institution,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = state.items;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFFFF),
      appBar: AppBar(
        title: const Text('items'),
        actions: userId != institution.userId
            ? null
            : [
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    _navigateToAddItem(context);
                  },
                  child: const Text('Add'),
                )
              ],
      ),
      body: ItemsWidget2<InstitutionItem>(
        items: items,
        dateTimeValue: (item) => item.creationTime,
        stringValue: (item) => item.name,
        gridBuilder: (item) {
          return ItemGridWidget2(
              imageURL: item.imageUrl,
              itemName: item.name,
              unitName: item.units.first.name,
              unitPrice: item.units.first.price);
        },
        listBuilder: (item) {
          return ItemListWidget2.owner(
              imageURL: item.imageUrl,
              itemName: item.name,
              unitName: item.units.first.name,
              unitPrice: item.units.first.price);
        },
        onItemPressed: (item) async {
          if (userId == institution.userId) {
          } else {
            // final cartItem = await showDialog<OrderItem>(
            //   context: context,
            //   builder: (context) {
            //     return ItemAddToCartDialog(
            //       item: item,
            //     );
            //   },
            // );
            // if (cartItem != null) {
            //   cubit.addCartItem(cartItem);
            // }
          }
        },
        onItemLongPressed: (item) {
          if (userId == institution.userId) {
            // _navigateToEditItem(context, item);
          }
        },
      ),
    );
  }

  void _navigateToAddItem(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings:
            RouteSettings(name: Routes.addItem, arguments: institution.id),
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
  final InstitutionProfile institution;
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
