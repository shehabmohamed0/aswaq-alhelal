import 'dart:developer';

import 'package:aswaqalhelal/features/institution_items/domain/entities/unit.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../auth/domain/entities/institution_profile.dart';
import '../../../../home/presentation/cubit/items_widget/item_grid_widget.dart';
import '../../../../home/presentation/cubit/items_widget/item_list_widget.dart';
import '../../../../home/presentation/cubit/items_widget/items_widget.dart';
import '../../../../widgets/check_internet_connection_widget.dart';
import '../../../domain/entities/institution_item.dart';
import '../../bloc/add_item/add_item_bloc.dart';
import '../../bloc/item_units/units_bloc.dart';
import '../../cubit/institution_items/institution_items_cubit.dart';
import '../add_item/add_items_page.dart';

class InstitutionItemsPage extends StatelessWidget {
  const InstitutionItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstitutionItemsCubit>();
    final institution =
        (ModalRoute.of(context)!.settings.arguments as InstitutionProfile);
    return BlocBuilder<InstitutionItemsCubit, InstitutionItemsState>(
      builder: (context, state) {
        if (state is InstitutionsItemsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is InstitutionItemsLoaded) {
          return _InstitutionsLoadedWidget(
              state: state, institution: institution);
        } else if (state is InstitutionItemsEmpty) {
          return _InstitutionItemsEmptyWidget(
            institution: institution,
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
  const _InstitutionsLoadedWidget({
    Key? key,
    required this.state,
    required this.institution,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = state.items;
    final intl = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFFFF),
      appBar: AppBar(
        title: Text(intl.items),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: () {
              _navigateToAddItem(context);
            },
            child: Text(intl.add),
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
            unitPrice: item.units.first.price,
            onPressed: () {},
            onLongPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  settings: RouteSettings(
                      arguments: institution.id, name: Routes.addItem),
                  builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: context.read<InstitutionItemsCubit>(),
                      ),
                      BlocProvider<AddItemBloc>(
                        create: (context) => locator()..add(InitEdit(item)),
                      ),
                      BlocProvider<ItemUnitsBloc>(
                        create: (context) => locator()
                          ..add(ItemUnitsEvent.initForEdit(units: item.units)),
                      ),
                    ],
                    child: const AddItemPage(),
                  ),
                ),
              );
            },
          );
        },
        listBuilder: (item) {
          return ItemListWidget2.owner(
            imageURL: item.imageUrl,
            itemName: item.name,
            unitName: item.units.first.name,
            unitPrice: item.units.first.price,
            
            onLongPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  settings: RouteSettings(
                      arguments: institution.id, name: Routes.addItem),
                  builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: context.read<InstitutionItemsCubit>(),
                      ),
                      BlocProvider<AddItemBloc>(
                        create: (context) => locator()..add(InitEdit(item)),
                      ),
                      BlocProvider<ItemUnitsBloc>(
                        create: (context) => locator()
                          ..add(ItemUnitsEvent.initForEdit(units: item.units)),
                      ),
                    ],
                    child: const AddItemPage(),
                  ),
                ),
              );
            },
          );
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
            BlocProvider<ItemUnitsBloc>(
              create: (context) => locator(),
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
  }) : super(key: key);
  final InstitutionProfile institution;
  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(intl.thereIsNoItems),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text(intl.addItem),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                settings: RouteSettings(
                    name: Routes.addItem, arguments: institution.id),
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<AddItemBloc>(
                      create: (context) => locator(),
                    ),
                    BlocProvider<ItemUnitsBloc>(
                      create: (context) => locator(),
                    ),
                    BlocProvider.value(
                      value: context.read<InstitutionItemsCubit>(),
                    ),
                  ],
                  child: const AddItemPage(),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
