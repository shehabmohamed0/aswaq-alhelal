part of '../add_items_page.dart';

class UnitEntry extends StatefulWidget {
  const UnitEntry(
      {Key? key,
      this.unit,
      required this.units,
      required this.onChanged,
      this.firstIndex = false})
      : super(key: key);
  final Unit? unit;
  final List<Unit> units;
  final void Function(Unit? unit) onChanged;
  final bool firstIndex;
  @override
  State<UnitEntry> createState() => _UnitEntryState();
}

class _UnitEntryState extends State<UnitEntry> {
  late final TextEditingController nameController;
  late final FocusNode nameFocusNode;
  late final TextEditingController quantityController;
  late final FocusNode quantityFocusNode;
  late final TextEditingController priceController;
  late final FocusNode priceFocusNode;

  void onValidUnitChanged(UnitEntryState state) {
    final status = Formz.validate(
        [state.unit, state.fromUnit, state.quantity, state.price]);

    if (status.isValid) {
      widget.onChanged(Unit(
        referenceId: state.unit.value!.referenceId,
        name: state.unit.value!.name,
        quantity: state.quantity.value.toDouble(),
        price: state.price.value.toDouble(),
        p0: 0,
        p1: 0,
        p2: 0,
        p3: 0,
        p4: 0,
      ));
    } else {
      widget.onChanged(null);
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.unit != null) {
      context
          .read<UnitEntryBloc>()
          .add(UnitEntryEvent.initForEdit(unit: widget.unit!));
      nameController.text = widget.unit!.name;
      quantityController.text = widget.unit!.quantity.toString();
      priceController.text = widget.unit!.price.toString();
    }
    nameController = TextEditingController();
    nameFocusNode = FocusNode();
    quantityController = TextEditingController();
    quantityFocusNode = FocusNode();
    priceController = TextEditingController();
    priceFocusNode = FocusNode();

    quantityController.text = '0';
    priceController.text = '0';

    nameFocusNode.addListener(_onHasFocus);
  }

  void _onHasFocus() {
    if (nameFocusNode.hasFocus) {
      Scrollable.ensureVisible(context,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          alignment: .45,
          alignmentPolicy: ScrollPositionAlignmentPolicy.explicit);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    nameFocusNode.removeListener(_onHasFocus);
    nameFocusNode.dispose();
    quantityController.dispose();
    quantityFocusNode.dispose();
    priceController.dispose();
    priceFocusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant UnitEntry oldWidget) {
    super.didUpdateWidget(oldWidget);
    // context.read<UnitEntryBloc>().add(UnitEntryEvent.)
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UnitEntryBloc>();

    return MultiBlocListener(
      listeners: [
        BlocListener<UnitEntryBloc, UnitEntryState>(
          listenWhen: _unitDataChanged,
          listener: (context, state) {
            onValidUnitChanged(state);
          },
        ),
        BlocListener<UnitEntryBloc, UnitEntryState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            switch (state.status) {
              case UnitEntryStatus.loading:
                showLoadingDialog();
                break;
              case UnitEntryStatus.success:
                dismissLoadingDialog();
                nameController.text = state.unit.value!.name;
                nameFocusNode.unfocus();
                if (widget.firstIndex &&
                    // widget.units.isEmpty &&
                    state.unit.valid) {
                  bloc.add(UnitEntryEvent.fromUnitChanged(
                      unit: state.unit.value!, quantity: 1));
                  quantityController.text = '1';
                }
                break;
              case UnitEntryStatus.failure:
                showErrorSnackBar(context, state.errorMessage);
                dismissLoadingDialog();
                break;
              case UnitEntryStatus.unitSelected:
                nameController.text = state.unit.value!.name;
                nameFocusNode.unfocus();

                if (widget.firstIndex &&
                    // widget.units.isEmpty &&
                    state.unit.valid) {
                  bloc.add(UnitEntryEvent.fromUnitChanged(
                      unit: state.unit.value!, quantity: 1));
                  quantityController.text = '1';
                }
                break;
              case UnitEntryStatus.unitUnselected:
                nameController.clear();

                break;
              case UnitEntryStatus.fromUnitChanged:
                quantityFocusNode.requestFocus();
                quantityController.selection = TextSelection.fromPosition(
                    TextPosition(offset: quantityController.text.length));
                break;

              default:
            }
          },
        ),
      ],
      child: BlocBuilder<UnitEntryBloc, UnitEntryState>(
        builder: (context, state) {
          return Row(
            children: [
              Flexible(
                child: AutoSuggestTextField<Unit>(
                  labelText: 'Unit name',
                  controller: nameController,
                  focusNode: nameFocusNode,
                  suggestions: state.unitSuggestions,
                  suggestionState: state.sugggestionStatus,
                  suggestionBuilder: (context, unit) =>
                      ListTile(title: Text(unit.name)),
                  onChanged: (name) =>
                      bloc.add(UnitEntryEvent.unitNameChanged(name: name)),
                  onSuggestionSelected: (unit) =>
                      bloc.add(UnitEntryEvent.unitSelected(unit: unit)),
                  onEmptyWidgetClicked: () => bloc.add(
                      UnitEntryEvent.unitAdded(nameController.text.trim())),
                  onRemoveSelection: () =>
                      bloc.add(const UnitEntryEvent.unitUnselected()),
                  enabled: state.unit.value == null,
                  showRemoveButton: state.unit.valid,
                  emptyWidget: ListTile(
                    onTap: () => bloc.add(
                        UnitEntryEvent.unitAdded(nameController.text.trim())),
                    title: FittedBox(
                      alignment: AlignmentDirectional.centerStart,
                      fit: BoxFit.scaleDown,
                      child: Text(nameController.text),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Flexible(
                  child: DropdownButtonFormField<Unit>(
                decoration: const InputDecoration(
                    labelText: 'Base unit',
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                isExpanded: true,
                items: widget.firstIndex && state.unit.valid
                    ? [
                        DropdownMenuItem<Unit>(
                          value: state.unit.value,
                          child: FittedBox(child: Text(state.unit.value!.name)),
                        )
                      ]
                    : widget.units
                        .map((e) => DropdownMenuItem<Unit>(
                              value: e,
                              child: FittedBox(child: Text(e.name)),
                            ))
                        .toList(),
                value: state.fromUnit.value,
                onChanged: (unit) {
                  if (unit != null) {
                    bloc.add(UnitEntryEvent.fromUnitChanged(unit: unit));
                  }
                },
              )),
              const SizedBox(width: 4),
              Flexible(
                child: TextField(
                  controller: quantityController,
                  focusNode: quantityFocusNode,
                  onChanged: (quantity) => bloc
                      .add(UnitEntryEvent.quantityChanged(quantity: quantity)),
                  decoration: InputDecoration(
                    //todo: translation
                    labelText: 'Quantity',
                    enabled: !(state.unit.valid &&
                        state.unit.value == state.fromUnit.value),
                    filled: (state.unit.valid &&
                        state.unit.value == state.fromUnit.value),
                    errorText: state.quantity.validationMessage(),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Flexible(
                child: TextField(
                  controller: priceController,
                  focusNode: priceFocusNode,
                  onChanged: (price) =>
                      bloc.add(UnitEntryEvent.priceChanged(price: price)),
                  decoration: InputDecoration(
                    //todo: translation
                    labelText: 'Price',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    errorText: state.price.validationMessage(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  bool _unitDataChanged(UnitEntryState previous, UnitEntryState current) {
    return previous.unit.value != current.unit.value ||
        previous.fromUnit.value != current.fromUnit.value ||
        previous.price.value != current.price.value ||
        previous.quantity.value != current.quantity.value;
  }
}
