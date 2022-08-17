import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../core/params/address_suggestion/add_address_new_governate_params.dart';
import '../../../../core/params/address_suggestion/get_governates_suggestions_params.dart';
import '../../../instutution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../domain/entities/ref_address.dart';
import '../../domain/usecases/interfaces.dart';
import '../bloc/address_suggestions2_bloc.dart';

class RefAddressWidget<
    T extends RefAddress,
    B extends AddressSuggestions2Bloc<
        T,
        GetRefAddressSuggestionsUsecase<T, GetRefAddressParams>,
        GetRefAddressParams,
        AddRefAddressUsecase<T, AddRefAddressParams>,
        AddRefAddressParams>> extends StatelessWidget {
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
    return BlocConsumer<B, AddressSuggestions2State<T>>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case AddressSuggestionsStatus.initial:
            break;
          case AddressSuggestionsStatus.addressSelected:
            onAddressSelected();
            break;
          case AddressSuggestionsStatus.addressUnSelected:
            controller.clear();
            focusNode.unfocus();
            onAddressUnSelected();
            break;
          case AddressSuggestionsStatus.loading:
            EasyLoading.show(
                indicator: const FittedBox(
              child: SpinKitRipple(
                duration: Duration(milliseconds: 1200),
                color: Colors.white,
              ),
            ));
            break;
          case AddressSuggestionsStatus.addingAddressSucess:
            EasyLoading.dismiss();
            onAddressSelected();
            break;
          case AddressSuggestionsStatus.failure:
            EasyLoading.dismiss();
            showErrorSnackBar(context, state.errorMessage!);
            break;
        }
      },
      buildWhen: (p, c) =>
          p.addressSearch != c.addressSearch ||
          p.addressOrNull != c.addressOrNull ||
          p.suggestionState != c.suggestionState ||
          p.suggestions != c.suggestions,
      builder: (context, state) {
        final bloc = context.read<B>();

        return AutoSuggestTextField<T>(
          controller: controller,
          focusNode: focusNode,
          labelText: 'Governate',
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
            bloc.add(AddressSuggestions2Event.selectRefAddress(refAddress));
          },
          onEmptyWidgetClicked: () {
            addNewAddress(bloc);
          },
          enabled: state.addressOrNull.isNone(),
          showRemoveButton: state.addressOrNull.isSome(),
          onRemoveSelection: () {
            bloc.add(const AddressSuggestions2Event.unSelectRefAddress());
          },
        );
      },
    );
  }
}
