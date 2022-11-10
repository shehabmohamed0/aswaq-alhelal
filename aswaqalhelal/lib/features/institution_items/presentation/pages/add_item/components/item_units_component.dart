part of '../add_items_page.dart';

typedef BuildWhen = bool Function(
    ItemUnitsState previous, ItemUnitsState current);

const cellHeight = kTextTabBarHeight;
const cellMargin = 4.0;

class _ItemUnitsComponent extends StatefulWidget {
  const _ItemUnitsComponent({Key? key}) : super(key: key);

  @override
  State<_ItemUnitsComponent> createState() => _ItemUnitsComponentState();
}

class _ItemUnitsComponentState extends State<_ItemUnitsComponent> {
  late final List<List<TextEditingController>> textControllers;
  late final List<List<FocusNode>> focusNodes;
  late final ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    textControllers = [
      List.generate(8, (index) => TextEditingController()),
    ];
    focusNodes = [
      List.generate(8, (index) => FocusNode()),
    ];

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final screenWidth = MediaQuery.of(context).size.width;
      final cellWidth = screenWidth / 4;
      scrollController.animateTo(cellWidth + (cellWidth / 1.5) + 8,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInCirc);
    });
  }

  @override
  void dispose() {
    for (int i = 0; i < textControllers.length; i++) {
      final textControls = textControllers[i];
      final focusNods = focusNodes[i];
      for (int j = 0; j < textControllers[i].length; j++) {
        textControls[j].dispose();
        focusNods[j].dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final cellWidth = screenWidth / 4;
    final intl = AppLocalizations.of(context);
    final bloc = context.read<ItemUnitsBloc>();
    return BlocConsumer<ItemUnitsBloc, ItemUnitsState>(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.units.length != current.units.length,
      listener: (context, state) {
        switch (state.status) {
          case UnitsStatus.unitEntryAdded:
            _setControllersTextToEntriesData(state);
            textControllers
                .add(List.generate(8, (index) => TextEditingController()));
            focusNodes.add(List.generate(8, (index) => FocusNode()));
            break;
          case UnitsStatus.unitEntrySorted:
            _setControllersTextToEntriesData(state);
            break;
          case UnitsStatus.initial:
            break;
          case UnitsStatus.loading:
            showLoadingDialog();
            break;
          case UnitsStatus.success:
            dismissLoadingDialog();
            break;
          case UnitsStatus.failure:
            dismissLoadingDialog();
            showErrorSnackBar(context, state.errorMessage);
            break;
          case UnitsStatus.unitSelected:
            textControllers[state.index][0].text =
                state.units[state.index].name.value;
            focusNodes[state.index][1].requestFocus();
            textControllers[state.index][1].selection = TextSelection(
                baseOffset: 0,
                extentOffset: textControllers[state.index][1].text.length);
            break;
          case UnitsStatus.unitUnselected:
            textControllers[state.index][0].clear();
            focusNodes[state.index][0].unfocus();
            break;
          case UnitsStatus.fromUnitChanged:
            break;

          case UnitsStatus.unitAddedAndSelected:
            dismissLoadingDialog();
            textControllers[state.index][0].text =
                state.units[state.index].name.value;
            focusNodes[state.index][1].requestFocus();
            textControllers[state.index][1].selection = TextSelection(
                baseOffset: 0,
                extentOffset: textControllers[state.index][1].text.length);

            break;
          case UnitsStatus.firstUnitAddedAndSelected:
            dismissLoadingDialog();
            textControllers[state.index][0].text =
                state.units[state.index].name.value;
            textControllers[state.index][1].text =
                state.units[state.index].quantity.value.toString();
            focusNodes[state.index][3].requestFocus();

            break;
          case UnitsStatus.firstUnitSelected:
            textControllers[state.index][0].text =
                state.units[state.index].name.value;

            textControllers[state.index][1].text =
                state.units[state.index].quantity.value.toString();
            focusNodes[state.index][3].requestFocus();
            break;
          case UnitsStatus.unitRowRemoved:
            for (var element in textControllers.last) {
              element.dispose();
            }
            for (var element in focusNodes.last) {
              element.dispose();
            }
            textControllers.removeLast();
            focusNodes.removeLast();
            _setControllersTextToEntriesData(state);
            break;
          case UnitsStatus.newUnitsInit:
            final int difference = state.units.length - textControllers.length;
            if (difference > 0) {
              for (int i = 0; i < difference; i++) {
                textControllers
                    .add(List.generate(8, (index) => TextEditingController()));
                focusNodes.add(List.generate(8, (index) => FocusNode()));
              }
            } else if (difference < 0) {
              final int numberToRemove = difference * -1;
              for (int i = 0; i < numberToRemove; i++) {
                for (int j = 0; j < textControllers[i].length; j++) {
                  textControllers[textControllers.length - 1][j].dispose();
                  focusNodes[textControllers.length - 1][j].dispose();
                }
                textControllers.removeLast();
                focusNodes.removeLast();
              }
            }
            _setControllersTextToEntriesData(state);

            break;

          case UnitsStatus.reset:
            for (int i = textControllers.length - 1; i > 0; i--) {
              for (int j = 0; j < textControllers[i].length; j++) {
                textControllers[i][j].dispose();
                focusNodes[i][j].dispose();
              }
              textControllers.removeLast();
              focusNodes.removeLast();
            }
            _setControllersTextToEntriesData(state);
            break;
        }
      },
      buildWhen: (previous, current) =>
          previous.units.length != current.units.length,
      builder: (context, state) {
        final tableHeight =
            state.units.length * (kTextTabBarHeight + (cellMargin * 2));
        return SliverPadding(
          padding: const EdgeInsets.all(4),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: tableHeight,
              child: CustomScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                slivers: [
                  TablePersistentColumn(
                    cellWidth: cellWidth,
                    rebuildWhen: (_, current) =>
                        current.columnsNeedsRebuild.containsName(),
                    itemBuilder: (index, unitEntry) =>
                        AutoSuggestTextField<Unit>(
                      controller: textControllers[index][0],
                      focusNode: focusNodes[index][0],
                      labelText: intl.unitName,
                      enabled: unitEntry.selectedUnit.invalid ||
                          unitEntry.selectedUnit.pure,
                      suggestions: unitEntry.unitSuggestions,
                      suggestionState: unitEntry.suggestionState,
                      onChanged: (name) => bloc.add(
                        ItemUnitsEvent.unitNameChanged(
                          name: name,
                          index: index,
                        ),
                      ),
                      suggestionBuilder: (context, unit) => ListTile(
                        title: FittedBox(
                          alignment: AlignmentDirectional.centerStart,
                          fit: BoxFit.scaleDown,
                          child: Text(unit.name),
                        ),
                      ),
                      onEmptyWidgetClicked: () => bloc.add(
                        ItemUnitsEvent.unitAdded(
                          textControllers[index][0].text,
                          index,
                        ),
                      ),
                      emptyWidget: Stack(
                        children: [
                          ListTile(
                            title: Text(textControllers[index][0].text),
                          ),
                          Positioned.directional(
                            end: 2,
                            top: 2,
                            bottom: 2,
                            textDirection:
                                Localizations.localeOf(context).languageCode ==
                                        'ar'
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                            child: const Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      onRemoveSelection: () => bloc.add(
                        ItemUnitsEvent.unitUnselected(
                          index: index,
                        ),
                      ),
                      onSuggestionSelected: (unit) => bloc.add(
                        ItemUnitsEvent.unitSelected(
                          unit: unit,
                          index: index,
                        ),
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.transparent,
                        fontSize: 0.001,
                      ),
                      errorText: unitEntry.selectedUnit.validationMessage,
                    ),
                  ),
                  TableColumn(
                    cellWidth: cellWidth / 1.5,
                    rebuildWhen: (_, current) =>
                        current.columnsNeedsRebuild.containsQuantity(),
                    itemBuilder: (index, state) {
                      return QuantityTextField(
                        index: index,
                        isFractional: state.units[index].isFractionQuantity,
                        enabled: !state.units[index].disableQuantity,
                        controller: textControllers[index][1],
                        focusNode: focusNodes[index][1],
                        bloc: bloc,
                        onChanged: (isFraction, quantity) {
                          bloc.add(
                            ItemUnitsEvent.quantityChanged(
                              quantity: quantity,
                              isFraction: isFraction,
                              index: index,
                            ),
                          );
                        },
                        onToggle: () {
                          bloc.add(ItemUnitsEvent.toggleQuantityClicked(
                              index: index));
                        },
                        errorMessage:
                            state.units[index].quantity.validationMessage(),
                      );
                    },
                  ),
                  TableColumn(
                    cellWidth: cellWidth,
                    rebuildWhen: (previous, current) =>
                        current.columnsNeedsRebuild.containsBaseUnit() ||
                        current.columnsNeedsRebuild.containsName() ||
                        previous.baseUnit != current.baseUnit,
                    itemBuilder: (index, state) =>
                        DropdownButtonFormField<Unit>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: intl.fromUnit,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        errorText: state.baseUnit.validationMessage,
                        errorStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0.001,
                        ),
                      ),
                      value: state.baseUnit.value,
                      items: [
                        if (state.baseUnit.valid)
                          DropdownMenuItem<Unit>(
                            value: state.baseUnit.value,
                            child: FittedBox(
                              child: Text(state.baseUnit.value!.name),
                            ),
                          ),
                      ],
                      onChanged: (unit) {
                        if (unit != null) {
                          bloc.add(
                            ItemUnitsEvent.baseUnitChanged(
                              unit: unit,
                              index: index,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  TableColumn(
                    cellWidth: cellWidth / 2,
                    rebuildWhen: (_, current) =>
                        current.columnsNeedsRebuild.containsPrice(),
                    itemBuilder: (index, state) => TextField(
                      focusNode: focusNodes[index][3],
                      controller: textControllers[index][3],
                      keyboardType: TextInputType.number,
                      onChanged: (price) {
                        bloc.add(
                          ItemUnitsEvent.priceChanged(
                            price: price,
                            index: index,
                            priceIndex: 0,
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        labelText: 'p0',
                        errorStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0.001,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        errorText: state.units[index].price.validationMessage(),
                      ),
                    ),
                  ),
                  TableColumn(
                    cellWidth: cellWidth / 2,
                    rebuildWhen: (_, current) =>
                        current.columnsNeedsRebuild.containsP1(),
                    itemBuilder: (index, state) => TextField(
                      focusNode: focusNodes[index][4],
                      controller: textControllers[index][4],
                      keyboardType: TextInputType.number,
                      onChanged: (price) {
                        bloc.add(
                          ItemUnitsEvent.priceChanged(
                            price: price,
                            index: index,
                            priceIndex: 1,
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        labelText: 'p1',
                        errorStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0.001,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        errorText: state.units[index].p1.validationMessage(),
                      ),
                    ),
                  ),
                  TableColumn(
                    cellWidth: cellWidth / 2,
                    rebuildWhen: (_, current) =>
                        current.columnsNeedsRebuild.containsP2(),
                    itemBuilder: (index, state) => TextField(
                      focusNode: focusNodes[index][5],
                      controller: textControllers[index][5],
                      keyboardType: TextInputType.number,
                      onChanged: (price) {
                        bloc.add(
                          ItemUnitsEvent.priceChanged(
                            price: price,
                            index: index,
                            priceIndex: 2,
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        labelText: 'p2',
                        errorStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0.001,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        errorText: state.units[index].p2.validationMessage(),
                      ),
                    ),
                  ),
                  TableColumn(
                    cellWidth: cellWidth / 2,
                    rebuildWhen: (_, current) =>
                        current.columnsNeedsRebuild.containsP3(),
                    itemBuilder: (index, state) => TextField(
                      focusNode: focusNodes[index][6],
                      controller: textControllers[index][6],
                      keyboardType: TextInputType.number,
                      onChanged: (price) {
                        bloc.add(
                          ItemUnitsEvent.priceChanged(
                            price: price,
                            index: index,
                            priceIndex: 3,
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        labelText: 'p3',
                        errorStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0.001,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        errorText: state.units[index].p3.validationMessage(),
                      ),
                    ),
                  ),
                  TableColumn(
                    cellWidth: cellWidth / 2,
                    rebuildWhen: (_, current) =>
                        current.columnsNeedsRebuild.containsP4(),
                    itemBuilder: (index, state) => TextField(
                      focusNode: focusNodes[index][7],
                      controller: textControllers[index][7],
                      keyboardType: TextInputType.number,
                      onChanged: (price) {
                        bloc.add(
                          ItemUnitsEvent.priceChanged(
                            price: price,
                            index: index,
                            priceIndex: 4,
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        labelText: 'p4',
                        errorStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0.001,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        errorText: state.units[index].p4.validationMessage(),
                      ),
                    ),
                  ),
                  TableColumn(
                    cellWidth: cellWidth / 2,
                    rebuildWhen: (_, current) => true,
                    itemBuilder: (index, state) => IconButton(
                      splashRadius: 22,
                      onPressed: state.units.length - 1 == index
                          ? () {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                context
                                    .read<ItemUnitsBloc>()
                                    .add(const ItemUnitsEvent.addUnitEntry());
                              });
                            }
                          : () {
                              bloc.add(UnitEntryRowRemoved(index: index));
                            },
                      icon: Icon(
                        state.units.length - 1 == index
                            ? Icons.add
                            : Icons.remove,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _setControllersTextToEntriesData(ItemUnitsState state) {
    for (int i = 0; i < textControllers.length; i++) {
      final textControls = textControllers[i];
      textControls[0].text =
          state.units[i].selectedUnit.value?.name ?? state.units[i].name.value;
      textControls[1].text = state.units[i].quantity.value.toInt().toString();
      textControls[2].text =
          state.units[i].selectedUnit.value?.name ?? state.units[i].name.value;
      textControls[3].text = state.units[i].price.value.toString();
      textControls[4].text = state.units[i].p1.stringValue();
      textControls[5].text = state.units[i].p2.stringValue();
      textControls[6].text = state.units[i].p3.stringValue();
      textControls[7].text = state.units[i].p4.stringValue();
    }
  }
}

class ColumnPersistentDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double extent;
  ColumnPersistentDelegate({
    required this.child,
    required this.extent,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class TablePersistentColumn extends StatelessWidget {
  const TablePersistentColumn({
    Key? key,
    required this.itemBuilder,
    required this.rebuildWhen,
    required this.cellWidth,
  }) : super(key: key);

  final Widget Function(int index, UnitEntryRow unitEntry) itemBuilder;
  final BuildWhen rebuildWhen;
  final double cellWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemUnitsBloc, ItemUnitsState>(
      buildWhen: rebuildWhen,
      builder: (context, state) {
        return SliverPersistentHeader(
          pinned: true,
          delegate: ColumnPersistentDelegate(
            extent: cellWidth + (cellMargin * 2),
            child: ColoredBox(
                color: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.units.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(cellMargin),
                    width: cellWidth,
                    height: kTextTabBarHeight,
                    child: itemBuilder(index, state.units[index]),
                  ),
                )),
          ),
        );
      },
    );
  }
}

class TableColumn extends StatelessWidget {
  const TableColumn({
    Key? key,
    required this.itemBuilder,
    required this.rebuildWhen,
    required this.cellWidth,
  }) : super(key: key);
  final Widget Function(int index, ItemUnitsState state) itemBuilder;
  final BuildWhen rebuildWhen;
  final double cellWidth;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemUnitsBloc, ItemUnitsState>(
      buildWhen: rebuildWhen,
      builder: (context, state) {
        final units = state.units;
        return SliverToBoxAdapter(
          child: Column(
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              for (int i = 0; i < units.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: cellMargin, horizontal: cellMargin / 2),
                  width: cellWidth,
                  height: kTextTabBarHeight,
                  child: itemBuilder(i, state),
                )
            ],
          ),
        );
      },
    );
  }
}

class QuantityTextField extends StatelessWidget {
  const QuantityTextField({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.bloc,
    required this.index,
    required this.onChanged,
    required this.errorMessage,
    required this.enabled,
    required this.isFractional,
    required this.onToggle,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;
  final ItemUnitsBloc bloc;
  final int index;
  final String? errorMessage;
  final Function(bool, String) onChanged;
  final bool enabled;
  final bool isFractional;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: (quantity) {
          onChanged(isFractional, quantity);
        },
        keyboardType: TextInputType.number,
        enabled: enabled,
        decoration: InputDecoration(
          prefix: !isFractional ? const Text('   ') : const Text('     '),
          // labelText: 'Containda   ss',
          errorStyle: const TextStyle(
            color: Colors.transparent,
            fontSize: 0.001,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          errorText: errorMessage,
        ),
      ),
      Positioned.fill(
        top: -7,
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: onToggle,
                      child: Material(
                        color: Colors.white,
                        child: Text(
                          AppLocalizations.of(context).contains,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .inputDecorationTheme
                              .labelStyle
                              ?.copyWith(
                                fontSize: 12,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      if (isFractional)
        Positioned(
          left: isFractional ? 6 : 0,
          bottom: 0,
          top: 0,
          child: const FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              child: Text(
                '1 / ',
              ),
            ),
          ),
        ),
    ]);
  }
}
