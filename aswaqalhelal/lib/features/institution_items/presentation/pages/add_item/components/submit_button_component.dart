part of '../add_items_page.dart';

class _SubmitButtonComponent extends StatelessWidget {
  const _SubmitButtonComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final bloc = context.read<AddItemBloc>();
    final institutionId = ModalRoute.of(context)!.settings.arguments as String;
    final cubit = context.read<InstitutionItemsCubit>();

    return BlocBuilder<AddItemBloc, AddItemState>(
      builder: (context, state) {
        return BlocBuilder<ItemUnitsBloc, ItemUnitsState>(
          buildWhen: (previous, current) => previous.units != current.units,
          builder: (context, state2) {
            return TextButton(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
              onPressed: _submissionIsNotInProgress(state) &&
                      _submissionIsNotSuccess(state) &&
                      _isValidItemData(state) &&
                      _isValidUnits(state2.units)
                  ? () {
                      final state = cubit.state;
                      late final List<InstitutionItem> items;
                      if (state is InstitutionItemsLoaded) {
                        items = state.items;
                      } else {
                        items = [];
                      }
                      bloc.add(
                        AddItemSubmit(
                          institutionId: institutionId,
                          currentItems: items,
                          units: state2.units
                              .where((element) => element.validRow())
                              .toList(),
                          baseUnit: state2.baseUnit.value!,
                        ),
                      );
                    }
                  : null,
              child: Text(
                state.isEdit ? intl.update : intl.save,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        );
      },
    );
  }

  bool _submissionIsNotInProgress(AddItemState state) =>
      state.status != AddItemStatus.loading;

  bool _submissionIsNotSuccess(AddItemState state) =>
      state.status != AddItemStatus.success;

  bool _isValidUnits(List<UnitEntryRow> units) {
    if (units.length == 1) {
      return units.first.validRow();
    }
    for (int i = 0; i < units.length - 1; i++) {
      if (!units[i].validRow()) {
        return false;
      }
    }
    return true;
  }

  bool _isValidItemData(AddItemState state) {
    return state.itemName.value.isNotEmpty && state.itemName.value.length > 2;
  }
}
