import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/form_inputs/nullable_number.dart';
import '../../../../../core/form_inputs/number.dart';
import '../../../../../core/form_inputs/required_object.dart';
import '../../../../../core/utils/dialogs.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../domain/entities/institution_item.dart';
import '../../../domain/entities/reference_item.dart';
import '../../../domain/entities/unit.dart';
import '../../DTOs/unit_entry_row.dart';
import '../../bloc/add_item/add_item_bloc.dart';
import '../../bloc/item_units/units_bloc.dart';
import '../../bloc/unit_entry/unit_entry_bloc.dart';
import '../../cubit/institution_items/institution_items_cubit.dart';
import 'widgets/auto_suggest_text_field.dart';
import 'widgets/image_bottom_sheet_widget.dart';

part 'components/item_image_component.dart';
part 'components/item_name_suggestiions_component.dart';
part 'components/item_units_component.dart';
part 'components/new_button_component.dart';
part 'components/submit_button_component.dart';
part 'widgets/unit_entry_widget.dart';

class AddItemPage extends HookWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
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
          listenWhen: (p, c) => p.status != c.status,
          listener: (context, state) {
            switch (state.status) {
              case AddItemStatus.initial:
                break;
              case AddItemStatus.loading:
                showLoadingDialog();
                break;
              case AddItemStatus.failed:
                dismissLoadingDialog();
                showErrorSnackBar(context, state.errorMessage ?? '');
                break;

              case AddItemStatus.success:
                dismissLoadingDialog();
                if (state.isEdit) {
                  cubit.updateInstitution(state.institutionItem!);
                  showSuccessSnackBar(context, intl.itemUpdatedSuccefully);
                  break;
                }
                FocusScope.of(context).unfocus();
                cubit.addItem(state.institutionItem!);
                // Navigator.pop(context);
                showSuccessSnackBar(
                  context,
                  state.isEdit
                      ? intl.itemUpdatedSuccessfully
                      : intl.itemAddedSuccessfully,
                );
                break;
              case AddItemStatus.reset:
                controller.clear();
                context.read<ItemUnitsBloc>().add(const ResetUnits());
                break;
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
              previous.itemFromReference != current.itemFromReference,
          listener: (context, state) {
            if (state.itemFromReference) {
              context.read<ItemUnitsBloc>().add(
                    ItemUnitsEvent.initForEdit(
                      units: state.selectedItem.value?.units ??
                          state.oldItem!.units,
                    ),
                  );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(intl.addItem),
          actions: const [
            _NewButtonComponent(),
            _SubmitButtonComponent(),
          ],
        ),
        body: BlocBuilder<AddItemBloc, AddItemState>(
          buildWhen: (previous, current) =>
              previous.status != current.status &&
              (current.status == AddItemStatus.reset ||
                  current.status == AddItemStatus.success),
          builder: (_, state) {
            log(state.status.toString());
            return IgnorePointer(
              ignoring: state.status == AddItemStatus.success,
              child: CustomScrollView(
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
                              _showImageBottomSheet(context);
                            },
                            child: const _ImageComponent(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  _ItemNameSuggestionsComponent(
                    controller: controller,
                    focusNode: focusNode,
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            intl.units,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const _ItemUnitsComponent(),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<dynamic> _showImageBottomSheet(
    BuildContext context,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => ImageBottomSheetWidget(
        onCameraPressed: () {
          context.read<AddItemBloc>().add(
                SelectImagePressed(
                  ImageSource.gallery,
                ),
              );
          Navigator.pop(context);
        },
        onGalleryPressed: () {
          context.read<AddItemBloc>().add(
                SelectImagePressed(
                  ImageSource.gallery,
                ),
              );
          Navigator.pop(context);
        },
      ),
    );
  }
}
