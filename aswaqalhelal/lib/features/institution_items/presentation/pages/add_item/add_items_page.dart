import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:root_package/core/form_inputs/number.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/packages/image_picker.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../../l10n/l10n.dart';
import '../../../domain/entities/institution_item.dart';
import '../../../domain/entities/reference_item.dart';
import '../../../domain/entities/unit.dart';
import '../../bloc/add_item/add_item_bloc.dart';
import '../../bloc/unit_entry/unit_entry_bloc.dart';
import '../../cubit/institution_items/institution_items_cubit.dart';
import 'widgets/auto_suggest_text_field.dart';
import 'widgets/image_bottom_sheet_widget.dart';

class AddItemPage extends HookWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final bloc = context.read<AddItemBloc>();
    final institutionId = ModalRoute.of(context)!.settings.arguments as String;
    final cubit = context.read<InstitutionItemsCubit>();

    return MultiBlocListener(
      listeners: [
        BlocListener<AddItemBloc, AddItemState>(
          listenWhen: (previous, current) => previous.isEdit != current.isEdit,
          listener: (context, state) {
            if (state.isEdit) {
              controller.text = state.itemName.value;
              focusNode.unfocus();
            }
          },
        ),
        BlocListener<AddItemBloc, AddItemState>(
          listenWhen: (p, c) =>
              (p.status != c.status &&
                  p.suggestionState != c.suggestionState) ||
              p.status != c.status && p.suggestionState == c.suggestionState,
          listener: (context, state) {
            if (state.status.isSubmissionFailure) {
              EasyLoading.dismiss();
              showErrorSnackBar(context, state.errorMessage ?? '');
            }
          },
        ),
        BlocListener<AddItemBloc, AddItemState>(
          listener: (context, state) {
            if (state.status.isSubmissionInProgress) {
              EasyLoading.show(
                status: intl.loading,
                indicator: const FittedBox(
                  child: SpinKitRipple(
                    duration: Duration(milliseconds: 1200),
                    color: Colors.white,
                  ),
                ),
              );
            } else if (state.status.isSubmissionSuccess) {
              EasyLoading.dismiss();

              if (state.isEdit) {
                cubit.updateInstitution(state.institutionItem!);
                Navigator.pop(context);
                showSuccessSnackBar(context, intl.itemUpdatedSuccefully);
                return;
              }

              cubit.addItem(state.institutionItem!);
              Navigator.pop(context);
            }
          },
        ),
        BlocListener<AddItemBloc, AddItemState>(
          listenWhen: (previous, current) =>
              previous.itemFromReference != current.itemFromReference,
          listener: (context, state) {
            if (!state.itemFromReference) {
              controller.clear();
              Future.delayed(const Duration(milliseconds: 50)).then((value) {
                focusNode.requestFocus();
              });
            }
          },
        ),
        BlocListener<AddItemBloc, AddItemState>(
          listenWhen: (previous, current) =>
              previous.unitStatus != current.unitStatus,
          listener: (context, state) {
            switch (state.unitStatus) {
              case UnitStatus.initial:
                break;
              case UnitStatus.exsists:
                showErrorSnackBar(context, intl.unitExsistsBefore);

                break;
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(intl.addItem)),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            SliverToBoxAdapter(
              child: Center(
                child: SizedBox.square(
                  dimension: MediaQuery.of(context).size.width / 2,
                  child: Material(
                    color: Colors.grey.shade200,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => ImageBottomSheetWidget(
                                  onCameraPressed: () {
                                    bloc.add(
                                      SelectImagePressed(
                                        ImageSource.camera,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  onGalleryPressed: () {
                                    bloc.add(
                                      SelectImagePressed(
                                        ImageSource.gallery,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                ));
                      },
                      child: BlocBuilder<AddItemBloc, AddItemState>(
                        buildWhen: ((p, c) =>
                            p.imageFile != c.imageFile ||
                            p.imageUrl != c.imageUrl),
                        builder: (context, state) {
                          if (state.imageFile.value != null) {
                            return Stack(children: [
                              Positioned.fill(
                                child: Image.file(
                                  state.imageFile.value!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 4,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                  ),
                                  child: GestureDetector(
                                      onTap: () {
                                        bloc.add(DeleteImageFile());
                                      },
                                      child: const Icon(Icons.close,
                                          size: 18, color: Colors.red)),
                                ),
                              ),
                            ]);
                          } else if (state.imageFile.value == null &&
                              state.imageUrl.value != null) {
                            return Stack(children: [
                              Positioned.fill(
                                child: CachedNetworkImage(
                                  imageUrl: state.imageUrl.value!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                  top: 4,
                                  right: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade200,
                                    ),
                                    child: GestureDetector(
                                        onTap: () {
                                          bloc.add(DeleteImageUrl());
                                        },
                                        child: const Icon(Icons.close,
                                            color: Colors.red)),
                                  ))
                            ]);
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(4),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  intl.tapTonselectItemImage,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            BlocBuilder<AddItemBloc, AddItemState>(
              buildWhen: (previous, current) =>
                  previous.suggestionState != current.suggestionState ||
                  previous.itemFromReference != current.itemFromReference ||
                  previous.addingNewItem != current.addingNewItem,
              builder: (context, state) {
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  sliver: SliverToBoxAdapter(
                    child: AutoSuggestTextField<ReferenceItem>(
                      labelText: intl.name,
                      controller: controller,
                      autoFocus: true,
                      focusNode: focusNode,
                      enabled: !state.itemFromReference && !state.addingNewItem,
                      showRemoveButton: !state.isEdit,
                      onRemoveSelection: () {
                        bloc.add(RemoveSelectionPressed());
                        controller.clear();
                      },
                      suggestions: state.suggestions,
                      onSuggestionSelected: (item) {
                        controller.text = item.name;
                        focusNode.unfocus();
                        bloc.add(AddItemSelectedEvent(item));
                      },
                      suggestionBuilder: (context, item) {
                        return ListTile(
                          title: Text(item.name),
                          leading: const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      },
                      suggestionState: state.suggestionState,
                      onEmptyWidgetClicked: () {
                        focusNode.unfocus();
                        bloc.add(AddNewItem(controller.text));
                      },
                      errorWidget: ListTile(title: Text(intl.error)),
                      loadingWidget: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      onChanged: (text) => bloc.add(AddItemSearch(text)),
                    ),
                  ),
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      //todo: translation
                      'Measure units',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      splashRadius: 18,
                      visualDensity: VisualDensity.compact,
                    )
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            BlocBuilder<AddItemBloc, AddItemState>(
              buildWhen: (previous, current) =>
                  previous.selectedItem != current.selectedItem ||
                  previous.itemFromReference != current.itemFromReference ||
                  previous.units != current.units,
              builder: (context, state) {
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => BlocProvider<UnitEntryBloc>(
                        create: (context) => locator(),
                        child: UnitEntry(
                          onChanged: (unit) {},
                          units: const [
                            Unit(
                                referenceId: 'asdasdad1',
                                name: 'Test unit1',
                                quantity: 10,
                                price: 105.0),
                            Unit(
                                referenceId: 'asdasdad2',
                                name: 'Test unit2',
                                quantity: 5,
                                price: 67.0)
                          ],
                        ),
                      ),
                      childCount: 1,
                    ),
                  ),
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<AddItemBloc, AddItemState>(
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
                                  ),
                                );
                              }
                            : null,
                        child: Text(state.isEdit ? intl.update : intl.add),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: MediaQuery.of(context).viewInsets,
            ))
          ],
        ),
      ),
    );
  }
}

class UnitEntry extends StatefulWidget {
  const UnitEntry({
    Key? key,
    required this.units,
    required this.onChanged,
  }) : super(key: key);
  final List<Unit> units;
  final void Function(Unit unit) onChanged;
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
          price: state.price.value.toDouble()));
    }
  }

  @override
  void initState() {
    super.initState();
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
                EasyLoading.show(
                    indicator: const FittedBox(
                  child: SpinKitRipple(
                      duration: Duration(milliseconds: 1200),
                      color: Colors.white),
                ));
                break;
              case UnitEntryStatus.success:
                EasyLoading.dismiss();
                nameFocusNode.unfocus();
                break;
              case UnitEntryStatus.failure:
                showErrorSnackBar(context, state.errorMessage);
                EasyLoading.dismiss();
                break;
              case UnitEntryStatus.unitSelected:
                nameFocusNode.unfocus();
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
                  onEmptyWidgetClicked: () =>
                      bloc.add(const UnitEntryEvent.unitAdded()),
                  onRemoveSelection: () =>
                      bloc.add(const UnitEntryEvent.unitUnselected()),
                  enabled: state.unit.value == null,
                  showRemoveButton: state.unit.valid,
                  emptyWidget: ListTile(
                    onTap: () => bloc.add(const UnitEntryEvent.unitAdded()),
                    title: FittedBox(
                        alignment: AlignmentDirectional.centerStart,
                        fit: BoxFit.scaleDown,
                        child: Text(
                          nameController.text,
                        )),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Flexible(
                  child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                    labelText: 'From unit',
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: '1',
                    child: FittedBox(child: Text('aasd asds')),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: FittedBox(child: Text('asd')),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: FittedBox(child: Text('asd')),
                  ),
                ],
                value: '1',
                onChanged: (unit) {},
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
                    errorText: state.quantity.validationMessage(),
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
    return previous.unit != current.unit ||
        previous.fromUnit != current.fromUnit ||
        previous.price != current.price ||
        previous.quantity != current.quantity;
  }
}
