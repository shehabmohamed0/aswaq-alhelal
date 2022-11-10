import 'dart:io';

import 'package:aswaqalhelal/features/orders/domain/entities/order.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/packages/path_provider.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../core/request_state.dart';
import '../../../../l10n/l10n.dart';
import '../../../auth/domain/entities/base_profile.dart';
import '../../../auth/domain/entities/institution_profile.dart';
import '../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../institution_items/data/datasources/units_api_service.dart';
import '../../../institution_items/domain/entities/institution_item.dart';
import '../../../institution_items/domain/entities/unit.dart';
import '../../../institution_items/domain/repositories/units_repository.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../cubit/institution_receipts_cubit.dart';
import '../widgets/compo_box_widget.dart';
import '../widgets/receipt_item_widget.dart';

class TypeAheadTestPage extends StatelessWidget {
  const TypeAheadTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Type Ahead'),
      ),
      body: Column(
        children: [
          TypeAheadField<Unit>(
            suggestionsCallback: (pattern) async {
              return locator<UnitsApiService>().getUnitSuggestions(
                GetUnitSuggestionsParams(
                  pattern.toLowerCase(),
                ),
              );
            },
            itemBuilder: (context, itemData) => ListTile(
              title: Text(itemData.name),
            ),
            onSuggestionSelected: (suggestion) {},
            keepSuggestionsOnSuggestionSelected: true,
            minCharsForSuggestions: 1,
            loadingBuilder: (context) => const SizedBox(
              height: kTextTabBarHeight,
              child: Center(
                child: SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            keepSuggestionsOnLoading: false,
            debounceDuration: const Duration(milliseconds: 300),
          )
        ],
      ),
    );
  }
}

class InstitutionReceiptPage extends HookWidget {
  const InstitutionReceiptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final cubit = context.read<InstitutionReceiptsCubit>();
    final userId =
        context.select((AppBloc element) => element.state.profile.id);
    final institution =
        ModalRoute.of(context)!.settings.arguments as InstitutionProfile;
    final itemController = useTextEditingController();
    final itemFocusNode = useFocusNode();

    final quantityController = useTextEditingController();
    final quantityFocusNode = useFocusNode();
    final priceController = useTextEditingController();
    final priceFocusNode = useFocusNode();

    return BlocBuilder<InstitutionReceiptsCubit, InstitutionReceiptsState>(
      buildWhen: (previous, current) =>
          previous.itemsState != current.itemsState,
      builder: (context, state) {
        switch (state.itemsState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.error:
            return CheckInternetConnection(onPressed: () {});
          default:
            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: Text(intl.receipt),
                elevation: 0,
                actions: [
                  BlocBuilder<InstitutionReceiptsCubit,
                      InstitutionReceiptsState>(
                    buildWhen: (previous, current) =>
                        previous.savedOrder != current.savedOrder,
                    builder: (context, state) {
                      return IconButton(
                        style: IconButton.styleFrom(
                          foregroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: state.savedOrder.isSome()
                            ? () async {
                                savePdfFile(
                                  'fileName',
                                  await createPdf(
                                    state.savedOrder.toNullable()!,
                                  ),
                                );
                              }
                            : null,
                        splashRadius: 24,
                        icon: Icon(
                          Icons.print,
                          color: state.savedOrder.isSome()
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 4),
                  BlocBuilder<InstitutionReceiptsCubit,
                      InstitutionReceiptsState>(
                    buildWhen: (previous, current) =>
                        previous.totalPrice != current.totalPrice ||
                        previous.savedOrder != current.savedOrder ||
                        previous.receiptItems != current.receiptItems,
                    builder: (context, state) {
                      return IconButton(
                        onPressed: state.receiptItems.isNotEmpty &&
                                state.savedOrder.isNone()
                            ? () => cubit.saveReceipt(
                                  institution,
                                  userId,
                                )
                            : null,
                        splashRadius: 24,
                        icon: Icon(
                          Icons.save,
                          color: state.receiptItems.isNotEmpty &&
                                  state.savedOrder.isNone()
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                      );
                    },
                  ),
                  BlocBuilder<InstitutionReceiptsCubit,
                      InstitutionReceiptsState>(
                    builder: (context, state) {
                      return TextButton(
                        onPressed: () async {
                          if (state.savedOrder.isSome()) {
                            cubit.reset();
                            return;
                          }
                          final reset = await showDialog<bool>(
                                context: context,
                                builder: (context) => SimpleDialog(
                                  title: Text(intl
                                      .areYouSureToAddANewReceiptPreviousData),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      4.0, 12.0, 4.0, 16.0),
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, true);
                                            },
                                            child: Text(intl.yes)),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, false);
                                            },
                                            child: Text(intl.cancel)),
                                      ],
                                    )
                                  ],
                                ),
                              ) ??
                              false;
                          if (reset) {
                            cubit.reset();
                          }
                        },
                        child: Text(intl.new_),
                      );
                    },
                  ),
                ],
              ),
              body: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: BlocListener<InstitutionReceiptsCubit,
                    InstitutionReceiptsState>(
                  listenWhen: (previous, current) {
                    return previous.status != current.status ||
                        previous.selectedItem != current.selectedItem ||
                        previous.selectedUnit != current.selectedUnit;
                  },
                  listener: (context, state) {
                    _onListener(
                        state,
                        itemController,
                        itemFocusNode,
                        quantityController,
                        priceController,
                        context,
                        quantityFocusNode,
                        priceFocusNode);
                  },
                  child: BlocBuilder<InstitutionReceiptsCubit,
                      InstitutionReceiptsState>(
                    buildWhen: (previous, current) =>
                        previous.savedOrder != current.savedOrder,
                    builder: (context, state) {
                      return IgnorePointer(
                        ignoring: state.savedOrder.isSome(),
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: [
                            BlocBuilder<InstitutionReceiptsCubit,
                                InstitutionReceiptsState>(
                              buildWhen: (previous, current) =>
                                  previous.filteredItems !=
                                      current.filteredItems ||
                                  previous.selectedItem !=
                                      current.selectedItem ||
                                  previous.selectedUnit !=
                                      current.selectedUnit ||
                                  previous.quantity != current.quantity ||
                                  previous.unitPrice != current.unitPrice ||
                                  previous.savedOrder != current.savedOrder ||
                                  current.status ==
                                      InstitutionReceiptStatus.loading,
                              builder: (context, state) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 4),
                                    DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        labelText: intl.client,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      items: [
                                        DropdownMenuItem<BaseProfile>(
                                          value: state.purchaseClient,
                                          child: Text(
                                            Localizations.localeOf(context)
                                                        .languageCode ==
                                                    'ar'
                                                ? state
                                                    .purchaseClient.arabicName
                                                : state.purchaseClient.name,
                                          ),
                                        )
                                      ],
                                      onChanged: (d) {},
                                      value: state.purchaseClient,
                                    ),
                                    const SizedBox(height: 8),
                                    ComboBoxWidget<InstitutionItem>(
                                      controller: itemController,
                                      focusNode: itemFocusNode,
                                      labelText: intl.item,
                                      suggestions: state.filteredItems,
                                      suggestionBuilder: (context, item) =>
                                          ListTile(title: Text(item.name)),
                                      onSuggestionSelected: cubit.itemSelected,
                                      onChanged: cubit.searchItem,
                                      onRemoveSelection:
                                          state.selectedItem.isSome()
                                              ? cubit.itemUnselected
                                              : null,
                                      enabled: state.selectedItem.isNone() &&
                                          state.savedOrder.isNone(),
                                    ),
                                    const SizedBox(height: 8),
                                    const SizedBox(height: 4),
                                    DropdownSearch<Unit>(
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                              dropdownSearchDecoration:
                                                  InputDecoration(
                                                      labelText: intl.unit,
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always)),
                                      popupProps: PopupProps.menu(
                                        constraints: BoxConstraints(
                                          maxHeight: state.selectedItem.fold(
                                              () => 0,
                                              (item) => item.units.length == 1
                                                  ? 56
                                                  : item.units.length == 2
                                                      ? 112
                                                      : item.units.length == 4
                                                          ? 168
                                                          : 224),
                                        ),
                                      ),
                                      enabled: state.selectedItem.isSome() &&
                                          !state.savedOrder.isSome(),
                                      selectedItem:
                                          state.selectedUnit.toNullable(),
                                      items: state.selectedItem.isSome()
                                          ? state.selectedItem
                                              .toNullable()!
                                              .units
                                          : [],
                                      itemAsString: (unit) => unit.name,
                                      onChanged: (unit) {
                                        if (unit != null) {
                                          cubit.unitSelected(unit);
                                        } else {
                                          cubit.unitUnselected();
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            controller: quantityController,
                                            focusNode: quantityFocusNode,
                                            enabled: state.savedOrder.isNone(),
                                            onChanged: cubit.quantityChanged,
                                            onSubmitted: (string) {
                                              priceFocusNode.requestFocus();
                                            },
                                            decoration: InputDecoration(
                                              labelText: intl.quantity,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                            ),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 14.0,
                                        ),
                                        Flexible(
                                            child: SizedBox(
                                          child: TextField(
                                            controller: priceController,
                                            focusNode: priceFocusNode,
                                            enabled: state.savedOrder.isNone(),
                                            onChanged: cubit.unitPriceChanged,
                                            decoration: InputDecoration(
                                                labelText: intl.price,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                                suffix: Text(
                                                  intl.egp,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                              signed: false,
                                              decimal: true,
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            onPressed: state.savedOrder
                                                        .isSome() ||
                                                    state.status ==
                                                        InstitutionReceiptStatus
                                                            .loading
                                                ? null
                                                : cubit.submit,
                                            child: Text(intl.add))),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            BlocBuilder<InstitutionReceiptsCubit,
                                InstitutionReceiptsState>(
                              buildWhen: (previous, current) =>
                                  previous.totalPrice != current.totalPrice ||
                                  previous.savedOrder != current.savedOrder ||
                                  previous.receiptItems != current.receiptItems,
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    if (state.receiptItems.isNotEmpty)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              child: Text(
                                                '${intl.totalPrice}\n${state.totalPrice} ${intl.egp}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (state.receiptItems.isNotEmpty)
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ReceiptItemWidget(
                                                item: intl.item,
                                                unit: intl.unit,
                                                quantity: intl.quantity,
                                                price: intl.price),
                                            ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  state.receiptItems.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  ReceiptItemWidget(
                                                item: state.receiptItems[index]
                                                    .item.name,
                                                unit: state.receiptItems[index]
                                                    .unit.name,
                                                quantity: state
                                                    .receiptItems[index]
                                                    .quantity
                                                    .toString(),
                                                price: state
                                                    .receiptItems[index].price
                                                    .toString(),
                                                onRemove: () {
                                                  cubit
                                                      .removeReceiptItem(index);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
        }
      },
    );
  }

  void _onListener(
      InstitutionReceiptsState state,
      TextEditingController itemController,
      FocusNode itemFocusNode,
      TextEditingController quantityController,
      TextEditingController priceController,
      BuildContext context,
      FocusNode quantityFocusNode,
      FocusNode priceFocusNode) {
    switch (state.status) {
      case InstitutionReceiptStatus.initial:
        break;
      case InstitutionReceiptStatus.itemSelected:
        itemController.text = state.selectedItem.toNullable()!.name;
        quantityController.text = state.quantity.toString();
        priceController.text = state.unitPrice.toString();
        quantityFocusNode.requestFocus();
        quantityController.selection = TextSelection(
            baseOffset: 0, extentOffset: quantityController.text.length);

        break;
      case InstitutionReceiptStatus.itemUnselected:
        itemController.clear();
        quantityController.clear();
        priceController.clear();
        itemFocusNode.requestFocus();
        break;
      case InstitutionReceiptStatus.unitSelected:
        priceController.text =
            state.selectedUnit.toNullable()!.price.toString();

        quantityFocusNode.requestFocus();
        break;
      case InstitutionReceiptStatus.unitUnselected:
        quantityController.clear();
        priceController.clear();
        quantityFocusNode.requestFocus();
        quantityController.selection = TextSelection(
            baseOffset: 0, extentOffset: quantityController.text.length);
        break;
      case InstitutionReceiptStatus.invalidItem:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => InvalidDialog(
            message: AppLocalizations.of(context).mustSelectAnItem,
            onClicked: () {
              Navigator.pop(context);
            },
          ),
        );
        break;
      case InstitutionReceiptStatus.invalidUnit:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => InvalidDialog(
            message: AppLocalizations.of(context).mustSelectAUnit,
            onClicked: () {
              Navigator.pop(context);
            },
          ),
        );
        break;
      case InstitutionReceiptStatus.invalidPrice:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => InvalidDialog(
            message: AppLocalizations.of(context).invalidPrice,
            onClicked: () {
              priceFocusNode.requestFocus();
              priceController.selection = TextSelection(
                  baseOffset: 0, extentOffset: priceController.text.length);
              Navigator.pop(context);
            },
          ),
        );
        break;
      case InstitutionReceiptStatus.invalidQuantity:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => InvalidDialog(
            message: AppLocalizations.of(context).invalidQuantity,
            onClicked: () {
              quantityFocusNode.requestFocus();
              quantityController.selection = TextSelection(
                  baseOffset: 0, extentOffset: quantityController.text.length);
              Navigator.pop(context);
            },
          ),
        );
        break;
      case InstitutionReceiptStatus.receiptItemAdded:
        itemController.clear();
        quantityController.clear();
        priceController.clear();
        itemFocusNode.requestFocus();

        break;
      case InstitutionReceiptStatus.loading:
        EasyLoading.show(
          indicator: const FittedBox(
            child: SpinKitRipple(
              duration: Duration(milliseconds: 1200),
              color: Colors.white,
            ),
          ),
          dismissOnTap: false,
        );
        break;

      case InstitutionReceiptStatus.success:
        FocusScope.of(context).unfocus();
        EasyLoading.dismiss();
        showSuccessSnackBar(
            context, AppLocalizations.of(context).receiptSavedSuccessfully);
        break;
      case InstitutionReceiptStatus.failure:
        showErrorSnackBar(context, state.errorMessage!);
        EasyLoading.dismiss();
        break;

      case InstitutionReceiptStatus.reset:
        itemController.clear();
        priceController.clear();
        quantityController.clear();
        itemFocusNode.requestFocus();
    }
  }
}

Future<Uint8List> createPdf(Order order) async {
  final theme = pw.ThemeData.withFont(
    base: pw.Font.ttf(await rootBundle.load('fonts/Cairo-Regular.ttf')),
    bold: pw.Font.ttf(await rootBundle.load('fonts/Cairo-Bold.ttf')),
  );
  final totalPrice = order.items
      .map((e) => e.quantity * e.price)
      .reduce((value, element) => value + element);
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.landscape,
      theme: theme,
      build: (context) => pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
        children: [
          pw.Expanded(child: _buildReceipt(order, totalPrice)),
          pw.SizedBox(width: 16),
          pw.Expanded(child: _buildReceipt(order, totalPrice)),
        ],
      ),
    ),
  );
  return pdf.save();
}

pw.Column _buildReceipt(Order order, double totalPrice) {
  return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
    pw.Text('Sale receipt : ${order.orderNumber}',
        style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
    pw.Container(
      decoration: pw.BoxDecoration(
          border: pw.Border.all(width: 1, color: const PdfColor(0, 0, 0))),
      child: pw.LayoutBuilder(
        builder: (context, constraints) => pw.ListView.builder(
          itemCount: order.items.length,
          itemBuilder: (context, index) {
            return pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisSize: pw.MainAxisSize.max,
              children: [
                pw.SizedBox(
                  width: constraints!.maxWidth * .25,
                  child: pw.Center(
                    child: pw.FittedBox(
                      child: pw.Directionality(
                        textDirection: pw.TextDirection.rtl,
                        child: pw.Text(
                          order.items[index].item.name,
                          style: const pw.TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                pw.SizedBox(
                  width: constraints.maxWidth * .25,
                  child: pw.Center(
                    child: pw.FittedBox(
                      child: pw.Directionality(
                        textDirection: pw.TextDirection.rtl,
                        child: pw.Text(
                          order.items[index].unit.name,
                          style: const pw.TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                pw.SizedBox(
                  width: constraints.maxWidth * .25,
                  child: pw.Center(
                    child: pw.FittedBox(
                      child: pw.Text(
                        order.items[index].quantity.toString(),
                        style: const pw.TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                pw.SizedBox(
                  width: constraints.maxWidth * .25,
                  child: pw.Center(
                    child: pw.FittedBox(
                      child: pw.Text(
                        order.items[index].price.toString(),
                        style: const pw.TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
    pw.SizedBox(height: 16),
    pw.Row(
      children: [
        pw.Text(
          'Total Price',
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(width: 8),
        pw.Text(
          '$totalPrice',
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
      ],
    )
  ]);
}

Future<void> savePdfFile(String fileName, Uint8List byteList) async {
  final output = await getTemporaryDirectory();
  var filePath = "${output.path}/$fileName.pdf";
  final file = File(filePath);
  await file.writeAsBytes(byteList);
  OpenFile.open(filePath);
}

class InvalidDialog extends StatelessWidget {
  const InvalidDialog(
      {Key? key, required this.message, required this.onClicked})
      : super(key: key);
  final String message;
  final VoidCallback onClicked;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: onClicked, child: const Text('OK')),
            )
          ],
        ),
      ),
    );
  }
}
