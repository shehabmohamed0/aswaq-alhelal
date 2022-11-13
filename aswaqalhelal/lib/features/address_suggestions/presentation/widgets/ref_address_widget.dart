import 'package:aswaqalhelal/core/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/params/address_suggestion/params.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../institution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../domain/entities/ref_address.dart';
import '../bloc/address_suggestions_bloc.dart';

class RefAddressWidget<
    T extends RefAddress,
    SP extends GetRefAddressParams,
    AP extends AddRefAddressParams,
    B extends AddressSuggestionsBloc<T, SP, AP>> extends StatelessWidget {
  const RefAddressWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.label,
    required this.searchAddress,
    required this.addNewAddress,
    required this.onAddressSelected,
    required this.onAddressUnSelected,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final Function(B b) addNewAddress;
  final Function(B b) searchAddress;
  final VoidCallback onAddressSelected;
  final VoidCallback onAddressUnSelected;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, AddressSuggestionsState<T>>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case AddressSuggestionsStatus.initial:
            break;
          case AddressSuggestionsStatus.initEdit:
            controller.text = state.addressSearch;
            break;
          case AddressSuggestionsStatus.addressSelected:
            focusNode.unfocus();
            controller.text = state.addressOrNull.toNullable()!.name;
            onAddressSelected();
            break;
          case AddressSuggestionsStatus.addressUnSelected:
            controller.clear();
            onAddressUnSelected();
            FocusScope.of(context).unfocus();

            break;
          case AddressSuggestionsStatus.loading:
            showLoadingDialog();
            break;
          case AddressSuggestionsStatus.addingAddressSucess:
            focusNode.unfocus();
            dismissLoadingDialog();
            onAddressSelected();
            break;
          case AddressSuggestionsStatus.failure:
            dismissLoadingDialog();
            showErrorSnackBar(context, state.errorMessage!);
            break;
        }
      },
      buildWhen: (p, c) =>
          p.addressSearch != c.addressSearch ||
          p.addressOrNull != c.addressOrNull ||
          p.suggestionState != c.suggestionState ||
          p.suggestions != c.suggestions ||
          p.enabled != c.enabled,
      builder: (context, state) {
        final bloc = context.read<B>();

        return AutoSuggestTextField<T>(
          controller: controller,
          focusNode: focusNode,
          labelText: label,
          onChanged: (searctText) {
            searchAddress(bloc);
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
          onSuggestionSelected: (refAddress) {
            bloc.add(AddressSuggestionsEvent<T, SP, AP>.selectRefAddress(
                refAddress));
          },
          onEmptyWidgetClicked: () {
            addNewAddress(bloc);
          },
          enabled: state.addressOrNull.isNone() && state.enabled,
          showRemoveButton: state.addressOrNull.isSome(),
          onRemoveSelection: () {
            bloc.add(AddressSuggestionsEvent<T, SP, AP>.unSelectRefAddress());
          },
        );
      },
    );
  }
}
