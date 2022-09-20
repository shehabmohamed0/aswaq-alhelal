import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:aswaqalhelal/features/auth/presentation/bloc/app_status/app_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/packages/path_provider.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../core/request_state.dart';
import '../../../institution_items/domain/entities/institution_item.dart';
import '../../../institution_items/domain/entities/unit.dart';
import '../../../user_institutions/domain/entities/institution.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../domain/entities/receipt_item.dart';
import '../cubit/institution_receipts_cubit.dart';
import '../widgets/compo_box_widget.dart';
import '../widgets/receipt_item_widget.dart';

class InstitutionReceiptPage extends HookWidget {
  const InstitutionReceiptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstitutionReceiptsCubit>();
    final userId = context.select((AppBloc element) => element.state.user.id);
    final institution =
        ModalRoute.of(context)!.settings.arguments as Institution;
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
        log(state.receiptSaved.toString());
        switch (state.itemsState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.error:
            return CheckInternetConnection(onPressed: () {});
          default:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Receipt'),
                elevation: 0,
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
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      BlocBuilder<InstitutionReceiptsCubit,
                          InstitutionReceiptsState>(
                        buildWhen: (previous, current) =>
                            previous.filteredItems != current.filteredItems ||
                            previous.selectedItem != current.selectedItem ||
                            previous.selectedUnit != current.selectedUnit ||
                            previous.quantity != current.quantity ||
                            previous.unitPrice != current.unitPrice ||
                            previous.receiptSaved != current.receiptSaved,
                        builder: (context, state) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 4),
                              ComboBoxWidget<InstitutionItem>(
                                controller: itemController,
                                focusNode: itemFocusNode,
                                labelText: 'Item',
                                suggestions: state.filteredItems,
                                suggestionBuilder: (context, item) =>
                                    ListTile(title: Text(item.name)),
                                onSuggestionSelected: cubit.itemSelected,
                                onChanged: cubit.searchItem,
                                onRemoveSelection: state.selectedItem.isSome()
                                    ? cubit.itemUnselected
                                    : null,
                                enabled: state.selectedItem.isNone() &&
                                    !state.receiptSaved,
                              ),
                              const SizedBox(height: 8),
                              const SizedBox(height: 4),
                              DropdownSearch<Unit>(
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                labelText: 'Unit',
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
                                    !state.receiptSaved,
                                selectedItem: state.selectedUnit.toNullable(),
                                items: state.selectedItem.isSome()
                                    ? state.selectedItem.toNullable()!.units
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
                                      enabled: !state.receiptSaved,
                                      onChanged: cubit.quantityChanged,
                                      onSubmitted: (string) {
                                        priceFocusNode.requestFocus();
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Quantity',
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
                                      enabled: !state.receiptSaved,
                                      onChanged: cubit.unitPriceChanged,
                                      decoration: const InputDecoration(
                                          labelText: 'Price',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          suffix: Text(
                                            'EGP',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
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
                                      onPressed: state.receiptSaved
                                          ? null
                                          : cubit.submit,
                                      child: const Text('Add'))),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      BlocBuilder<InstitutionReceiptsCubit,
                          InstitutionReceiptsState>(
                        buildWhen: (previous, current) =>
                            previous.totalPrice != current.totalPrice ||
                            previous.receiptSaved != current.receiptSaved ||
                            previous.receiptItems != current.receiptItems,
                        builder: (context, state) {
                          return Column(
                            children: [
                              if (state.receiptItems.isNotEmpty)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Text(
                                          'Total price\n${state.totalPrice} EGP',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: !state.receiptSaved
                                            ? null
                                            : () async {
                                                savePdfFile(
                                                    'fileName',
                                                    await createPdf(
                                                        state.receiptItems));
                                              },
                                        child: Icon(Icons.print)),
                                    SizedBox(width: 4),
                                    ElevatedButton(
                                        onPressed: state.receiptSaved
                                            ? null
                                            : () => cubit.saveReceipt(
                                                institution.id, userId),
                                        child: Icon(Icons.save))
                                  ],
                                ),
                              if (state.receiptItems.isNotEmpty)
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const ReceiptItemWidget(
                                        item: 'Item',
                                        unit: 'Unit',
                                        quantity: 'Quantity',
                                        price: 'Price',
                                      ),
                                      ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: state.receiptItems.length,
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
                                              )),
                                    ],
                                  ),
                                ),
                            ],
                          );
                        },
                      )
                    ],
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
            message: 'Must select an item',
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
            message: 'Must select a unit',
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
            message: 'Invalid price',
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
            message: 'Invalid quantity',
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
        EasyLoading.dismiss();
        showSuccessSnackBar(context, 'Receipt saved successfully');
        break;
      case InstitutionReceiptStatus.failure:
        showErrorSnackBar(context, state.errorMessage!);
        EasyLoading.dismiss();

        break;
    }
  }
}

Future<Uint8List> createPdf(List<ReceiptItem> items) {
  final totalPrice = items
      .map((e) => e.quantity * e.price)
      .reduce((value, element) => value + element);
  final pdf = pw.Document();
  pdf.addPage(pw.Page(
      build: (context) => pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
              children: [
                pw.Center(
                    child: pw.Text('Customer Receipt',
                        style: pw.TextStyle(
                            fontSize: 24, fontWeight: pw.FontWeight.bold))),
                pw.SizedBox(height: 16),
                pw.Text('Items',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.Container(
                  decoration: pw.BoxDecoration(
                      border:
                          pw.Border.all(width: 1, color: PdfColor(0, 0, 0))),
                  child: pw.LayoutBuilder(
                      builder: (context, constraints) => pw.ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) => pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.SizedBox(
                                      width: constraints!.maxWidth * .25,
                                      child: pw.Center(
                                          child: pw.FittedBox(
                                              child: pw.Text(
                                                  items[index].item.name,
                                                  style: pw.TextStyle(
                                                      fontSize: 18))))),
                                  pw.SizedBox(
                                      width: constraints.maxWidth * .25,
                                      child: pw.Center(
                                          child: pw.FittedBox(
                                              child: pw.Text(
                                                  items[index].unit.name,
                                                  style: pw.TextStyle(
                                                      fontSize: 18))))),
                                  pw.SizedBox(
                                      width: constraints.maxWidth * .25,
                                      child: pw.Center(
                                          child: pw.FittedBox(
                                              child: pw.Text(
                                                  items[index]
                                                      .quantity
                                                      .toString(),
                                                  style: pw.TextStyle(
                                                      fontSize: 18))))),
                                  pw.SizedBox(
                                      width: constraints.maxWidth * .25,
                                      child: pw.Center(
                                          child: pw.FittedBox(
                                              child: pw.Text(
                                                  items[index].price.toString(),
                                                  style: pw.TextStyle(
                                                      fontSize: 18))))),
                                ]),
                          )),
                ),
                pw.SizedBox(height: 16),
                pw.Row(children: [
                  pw.Text('Total Price',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(width: 8),
                  pw.Text('$totalPrice',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold))
                ])
              ])));
  return pdf.save();
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
