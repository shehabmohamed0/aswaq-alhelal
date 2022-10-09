import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/packages/image_picker.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../domain/entities/institution_item.dart';
import '../../../domain/entities/reference_item.dart';
import '../../../domain/entities/unit.dart';
import '../../bloc/add_item/add_item_bloc.dart';
import '../../cubit/institution_items/institution_items_cubit.dart';
import 'add_unit_dialog.dart';
import 'widgets/auto_suggest_text_field.dart';
import 'widgets/image_bottom_sheet_widget.dart';
import 'widgets/unit_widget.dart';

class AddItemPage extends HookWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                status: 'loading',
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
                showSuccessSnackBar(context, 'Item Updated succefully');
                return;
              }
              final institutionItemsCubit =
                  context.read<InstitutionItemsCubit>();
              if (institutionItemsCubit.state is InstitutionItemsEmpty) {
                institutionItemsCubit.addItem(state.institutionItem!);
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
                showErrorSnackBar(context, 'Unit exsists before');

                break;
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Add item')),
        body: Padding(
          padding: const EdgeInsets.all(8) - const EdgeInsets.only(bottom: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Center(
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
                                    padding: EdgeInsets.all(2),
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
                              return const Padding(
                                padding: EdgeInsets.all(4),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Tap to\nSelect item image.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
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
                const SizedBox(height: 16),
                Text('Name', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 2),
                BlocBuilder<AddItemBloc, AddItemState>(
                  buildWhen: (previous, current) =>
                      previous.suggestionState != current.suggestionState ||
                      previous.itemFromReference != current.itemFromReference ||
                      previous.addingNewItem != current.addingNewItem,
                  builder: (context, state) {
                    return AutoSuggestTextField<ReferenceItem>(
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
                          leading: Icon(
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
                      errorWidget: const ListTile(title: Text('Error')),
                      loadingWidget: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      onChanged: (text) => bloc.add(AddItemSearch(text)),
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<AddItemBloc, AddItemState>(
                  buildWhen: (previous, current) =>
                      previous.selectedItem != current.selectedItem ||
                      previous.itemFromReference != current.itemFromReference ||
                      previous.units != current.units,
                  builder: (context, state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            'Units',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Spacer(),
                          IconButton(
                            visualDensity: VisualDensity.compact,
                            icon: const Icon(Icons.add),
                            splashRadius: 16,
                            onPressed: () async {
                              final unit = await showModalBottomSheet<Unit>(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                isScrollControlled: true,
                                builder: (context) => Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: const AddUnitBottomSheet(),
                                ),
                              );
                              if (unit != null) {
                                bloc.add(AddUnitEvent(unit));
                              }
                            },
                          )
                        ]),
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
                    );
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
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
                                !state.status.isSubmissionInProgress &&
                                (state.imageFile.value != null ||
                                    state.imageUrl.value != null)
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
                        child: const Text('add'),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
