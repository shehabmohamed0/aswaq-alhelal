import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../../l10n/l10n.dart';
import '../../../domain/entities/unit.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';

import '../../bloc/add_unit/add_unit_bloc.dart';
import 'widgets/auto_suggest_text_field.dart';

class AddUnitBottomSheet extends StatefulWidget {
  const AddUnitBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddUnitBottomSheet> createState() => _AddUnitBottomSheetState();
}

class _AddUnitBottomSheetState extends State<AddUnitBottomSheet> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final nameFocusNode = FocusNode();
  final quantityController = TextEditingController();
  final quantityFocusNode = FocusNode();
  final priceController = TextEditingController();
  final priceFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);

    return BlocProvider<AddUnitBloc>(
      create: (context) => locator(),
      child: BlocConsumer<AddUnitBloc, AddUnitState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          switch (state.status) {
            case AddUnitStatus.initial:
              break;
            case AddUnitStatus.loading:
              EasyLoading.show(
                status: 'loading',
                indicator: const FittedBox(
                  child: SpinKitRipple(
                    duration: Duration(milliseconds: 1200),
                    color: Colors.white,
                  ),
                ),
              );
              break;
            case AddUnitStatus.loaded:
              EasyLoading.dismiss();
              Navigator.of(context).pop(state.finalUnit);
              break;
            case AddUnitStatus.failure:
              showErrorSnackBar(context, state.errorMessage!);
              break;
            case AddUnitStatus.referenceUnitSelected:
              final selectedUnit = state.selectedReferenceUnit.toNullable()!;
              nameController.text = selectedUnit.name;
              quantityController.text = selectedUnit.quantity.toString();
              priceController.text = selectedUnit.price.toString();
              priceFocusNode.requestFocus();
              break;
            case AddUnitStatus.referenceUnitUnselected:
              nameController.clear();

              break;
          }
        },
        builder: (context, state) {
          final bloc = context.read<AddUnitBloc>();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      intl.unitName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    AutoSuggestTextField<Unit>(
                      controller: nameController,
                      focusNode: nameFocusNode,
                      onChanged: (searctText) {
                        bloc.add(SearchName(searctText));
                      },
                      suggestionState: state.suggestionState,
                      suggestions: state.suggestions,
                      suggestionBuilder: (context, governate) => ListTile(
                        leading: const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        title: Text(governate.name),
                      ),
                      onSuggestionSelected: (unit) {
                        bloc.add(UnitSelected(unit));
                      },
                      onEmptyWidgetClicked: () {
                        bloc.add(UnitNameChanged(nameController.text));
                        nameFocusNode.unfocus();
                      },
                      enabled:
                          state.selectedReferenceUnit.isNone() && state.enabled,
                      showRemoveButton: state.selectedReferenceUnit.isSome() ||
                          !state.enabled,
                      onRemoveSelection: () {
                        bloc.add(UnitUnSelected());
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        value = value ?? '';
                        if (value.trim().isEmpty) {
                          return intl.required;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    // Text('Quantity',
                    //     style: Theme.of(context).textTheme.titleLarge),
                    // TextFormField(
                    //   controller: quantityController,
                    //   focusNode: quantityFocusNode,
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   keyboardType: TextInputType.number,
                    //   validator: _numberValidator,
                    //   onChanged: (s) {
                    //     bloc.add(UnitQuantityChanged(s));
                    //   },
                    //   decoration: const InputDecoration(),
                    // ),
                    // const SizedBox(height: 8),
                    Text(
                      intl.price,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextFormField(
                      controller: priceController,
                      focusNode: priceFocusNode,
                      keyboardType: TextInputType.number,
                      validator: _numberValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          suffix: Text(
                        intl.egp,
                        style: const TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      )),
                      onChanged: (s) {
                        bloc.add(UnitPriceChanged(s));
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          bloc.add(FormSubmitted());
                        }
                      },
                      child: Text(intl.add),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String? _numberValidator(s) {
    if (s != null) {
      final quantity = double.tryParse(s);
      if (quantity == null) {
        return AppLocalizations.of(context).invalid;
      } else {
        if (quantity <= 0) {
          return AppLocalizations.of(context).invalid;
        }
      }
    }
    return null;
  }
}
