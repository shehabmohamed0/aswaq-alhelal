import '../../bloc/bloc/add_item_bloc.dart';
import '../add_item/add_items_page.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../widgets/check_internet_connection_widget.dart';
import '../../cubit/institution_items/instutution_items_cubit.dart';
import '../../widgets/item_widget.dart';

class InstitutionItemsPage extends StatelessWidget {
  const InstitutionItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstitutionItemsCubit>();

    final institutionId = ModalRoute.of(context)!.settings.arguments as String;
    return BlocBuilder<InstitutionItemsCubit, InstitutionItemsState>(
      builder: (context, state) {
        if (state is InstitutionsItemsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is InstitutionItemsLoaded) {
          return _InstitutionsLoadedWidget(
            state: state,
            institutionId: institutionId,
          );
        } else if (state is InstitutionItemsEmpty) {
          return _InstitutionItemsEmptyWidget(
            institutionId: institutionId,
          );
        } else if (state is InstitutionsItemsError) {
          return CheckInternetConnection(
            onPressed: () {
              cubit.getInstitutionsItems(institutionId);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
/*
AppBar(
        title: const Text('items'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(primary: Colors.black),
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.addItem,
                arguments: institutionId,
              );
            },
            child: const Text('Add'),
          )
        ],
      ),
    
 */

class _InstitutionItemsEmptyWidget extends StatelessWidget {
  const _InstitutionItemsEmptyWidget({Key? key, required this.institutionId})
      : super(key: key);
  final String institutionId;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('You have no items'),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: const Text('Add item'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              settings:
                  RouteSettings(name: Routes.addItem, arguments: institutionId),
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

class _InstitutionsLoadedWidget extends StatelessWidget {
  final InstitutionItemsLoaded state;
  final String institutionId;
  const _InstitutionsLoadedWidget({
    Key? key,
    required this.state,
    required this.institutionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = state.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('items'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(primary: Colors.black),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                settings: RouteSettings(
                    name: Routes.addItem, arguments: institutionId),
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
            child: const Text('Add'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(items.length, (index) {
            return ItemWidget(item: items[index]);
          }),
        ),
      ),
    );
  }
}
