import 'package:aswaqalhelal/features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart';
import 'package:aswaqalhelal/features/instutution_items/presentation/pages/add_item/widgets/unit_widget.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../domain/entities/reference_item.dart';
import '../../../domain/entities/unit.dart';
import '../../bloc/bloc/add_item_bloc.dart';
import 'add_unit_bottom_sheet.dart';
import 'widgets/auto_suggest_text_field.dart';

class AddItemPage extends HookWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final bloc = context.read<AddItemBloc>();
    final institutionId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Add item')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item name',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            BlocBuilder<AddItemBloc, AddItemState>(
              buildWhen: (previous, current) =>
                  previous.suggestionState != current.suggestionState,
              builder: (context, state) {
                return AutoSuggestTextField<ReferenceItem>(
                  controller: controller,
                  focusNode: focusNode,
                  suggestionState: state.suggestionState,
                  suggestions: state.suggestions,
                  onSuggestionSelected: (item) {
                    controller.text = item.name;
                    bloc.add(AddItemSelectedEvent(item));
                  },
                  suggestionBuilder: (context, item) {
                    return ListTile(title: Text(item.name));
                  },
                  oneEmptyWidgetClicked: () {
                    bloc.add(AddNewItem(controller.text));
                  },
                  emptyWidget: const ListTile(
                    title: Text('No Item found, add as new item.'),
                  ),
                  errorWidget: const ListTile(title: Text('Error')),
                  loadingWidget: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  onChanged: (text) {
                    bloc.add(AddItemSearch(text));
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<AddItemBloc, AddItemState>(
              buildWhen: (previous, current) =>
                  previous.item != current.item ||
                  previous.isNewItem != current.isNewItem ||
                  previous.units != current.units,
              builder: (context, state) {
                return Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          'Measure units',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Spacer(),
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.add),
                          onPressed: () async {
                            final unit = await showModalBottomSheet<Unit>(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              builder: (context) => Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: const AddUnitBottomSheet(),
                              ),
                            );
                            if (unit != null) {
                              bloc.add(AddUnitEvent(unit));
                            }
                          },
                        )
                      ]),
                      const SizedBox(height: 8),
                      UnitWidget(
                        name: 'Name',
                        quantity: 'Quantity',
                        price: 'Price EGP',
                        color: Colors.grey.shade200,
                      ),
                      if (state.units.isNotEmpty)
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.units.length,
                            itemBuilder: (context, index) {
                              final unit = state.units[index];
                              return UnitWidget(
                                color: index % 2 == 0
                                    ? Colors.grey.shade100
                                    : Colors.grey.shade200,
                                name: unit.name,
                                quantity: '${unit.quantity}',
                                price: '${unit.price}',
                                onRemove: () {
                                  bloc.add(RemoveUnitEvent(index));
                                },
                              );
                            },
                          ),
                        )
                      else
                        UnitWidget(
                          name: ' ',
                          quantity: ' ',
                          price: ' ',
                          color: state.suggestions.length % 2 == 0
                              ? Colors.grey.shade100
                              : Colors.grey.shade200,
                        ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: BlocConsumer<AddItemBloc, AddItemState>(
                listener: (context, state) {
                  if (state.status.isSubmissionInProgress) {
                    EasyLoading.show(
                      status: 'loading',
                      indicator: const FittedBox(
                        child: SpinKitRipple(
                          duration: Duration(milliseconds: 1200),
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else if (state.status.isSubmissionFailure) {
                    EasyLoading.dismiss();
                    showErrorSnackBar(context, state.errorMessage ?? '');
                  } else if (state.status.isSubmissionSuccess) {
                    EasyLoading.dismiss();
                    final cubit = context.read<InstitutionItemsCubit>();
                    cubit.addItem(state.institutionItem!);
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: state.itemName.value.isNotEmpty &&
                            state.itemName.value.length > 2 &&
                            state.units.isNotEmpty &&
                            !state.status.isSubmissionInProgress
                        ? () {
                            bloc.add(AddItemSubmit(institutionId));
                          }
                        : null,
                    child: const Text('add'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
