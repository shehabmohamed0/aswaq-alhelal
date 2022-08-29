import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

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

import '../../../instutution_items/domain/entities/institution_item.dart';
import '../../../instutution_items/domain/entities/unit.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../domain/entities/receipt_item.dart';
import '../cubit/institution_receipts_cubit.dart';
import '../widgets/receipt_item_widget.dart';

class InstitutionReceiptPage extends HookWidget {
  const InstitutionReceiptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstitutionReceiptsCubit>();
    final quantityController = useTextEditingController();
    final priceController = useTextEditingController();
    final quantityFocusNode = useFocusNode();
    final priceFocusNode = useFocusNode();
    final itemKey = GlobalKey<DropdownSearchState<InstitutionItem>>();
    final unitKey = GlobalKey<DropdownSearchState<Unit>>();
    return Theme(
      data: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black54,
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Theme.of(context).primaryColor,
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(primary: Theme.of(context).primaryColor),
          inputDecorationTheme:
              const InputDecorationTheme(border: OutlineInputBorder())),
      child: BlocBuilder<InstitutionReceiptsCubit, InstitutionReceiptsState>(
        buildWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType,
        builder: (context, state) => state.map(
          initial: (initial) => const SizedBox.shrink(),
          loading: (loading) => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error) => CheckInternetConnection(onPressed: () {}),
          itemsLoaded: (state) {
            return Scaffold(
              appBar: AppBar(title: const Text('Receipt')),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: BlocConsumer<InstitutionReceiptsCubit,
                    InstitutionReceiptsState>(
                  listenWhen: (previous, current) {
                    if (previous is ItemsLoaded && current is ItemsLoaded) {
                      return previous.status != current.status;
                    }
                    return false;
                  },
                  listener: (context, state) {
                    state.mapOrNull(
                      itemsLoaded: (state) {
                        switch (state.status) {
                          case InstitutionReceiptStatus.initial:
                            break;
                          case InstitutionReceiptStatus.itemSelected:
                            break;
                          case InstitutionReceiptStatus.itemUnselected:
                            quantityController.clear();
                            priceController.clear();
                            FocusScope.of(context).unfocus();
                            break;
                          case InstitutionReceiptStatus.unitSelected:
                            priceController.text =
                                state.selectedUnit.value!.price.toString();

                            quantityFocusNode.requestFocus();
                            break;
                          case InstitutionReceiptStatus.unitUnselected:
                            quantityController.clear();
                            priceController.clear();
                            FocusScope.of(context).unfocus();
                            break;
                          case InstitutionReceiptStatus.invalidItem:
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => InvalidDialog(
                                message: 'Must select an item',
                                onClicked: () {
                                  itemKey.currentState?.openDropDownSearch();
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
                                  unitKey.currentState?.openDropDownSearch();
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
                                      baseOffset: 0,
                                      extentOffset:
                                          priceController.text.length);
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
                                      baseOffset: 0,
                                      extentOffset:
                                          quantityController.text.length);
                                  Navigator.pop(context);
                                },
                              ),
                            );
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
                            break;
                          case InstitutionReceiptStatus.failure:
                            EasyLoading.dismiss();

                            break;
                        }
                      },
                    );
                  },
                  buildWhen: (previous, current) {
                    if (previous is ItemsLoaded && current is ItemsLoaded) {
                      return previous.selectedItem != current.selectedItem ||
                          previous.selectedUnit != current.selectedUnit ||
                          previous.quantity != current.quantity ||
                          previous.unitPrice != current.unitPrice ||
                          previous.receiptItems != current.receiptItems;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    state as ItemsLoaded;
                    log(state.quantity.toString());
                    log(state.unitPrice.toString());
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Item',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        const SizedBox(height: 4),
                        DropdownSearch<InstitutionItem>(
                          key: itemKey,
                          mode: Mode.MENU,
                          showClearButton: true,
                          selectedItem: state.selectedItem.value,
                          items: state.items,
                          itemAsString: (item) => item!.name,
                          onChanged: (item) {
                            if (item != null) {
                              cubit.itemSelected(item);
                            } else {
                              cubit.itemUnselected();
                            }
                          },
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Unit',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        const SizedBox(height: 4),
                        DropdownSearch<Unit>(
                          key: unitKey,
                          mode: Mode.MENU,
                          showClearButton: true,
                          enabled: state.selectedItem.valid,
                          selectedItem: state.selectedUnit.value,
                          items: state.selectedItem.valid
                              ? state.selectedItem.value!.units
                              : [],
                          itemAsString: (unit) => unit!.name,
                          onChanged: (unit) {
                            if (unit != null) {
                              cubit.unitSelected(unit);
                            } else {
                              cubit.unitUnselected();
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'quantity',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 4),
                                  TextField(
                                    controller: quantityController,
                                    focusNode: quantityFocusNode,
                                    onChanged: cubit.quantityChanged,
                                    onSubmitted: (string) {
                                      priceFocusNode.requestFocus();
                                    },
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Price',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 4),
                                  TextField(
                                    controller: priceController,
                                    focusNode: priceFocusNode,
                                    onChanged: cubit.unitPriceChanged,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  cubit.submit();
                                },
                                child: const Text('Add'))),
                        const SizedBox(height: 24),
                        if (state.receiptItems.isNotEmpty)
                          Container(
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
                                    itemCount: state.receiptItems.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        ReceiptItemWidget(
                                          item: state
                                              .receiptItems[index].item.name,
                                          unit: state.receiptItems[index]
                                              .selectedUnit.name,
                                          quantity: state
                                              .receiptItems[index].quantity
                                              .toString(),
                                          price: state
                                              .receiptItems[index].selectedPrice
                                              .toString(),
                                          onRemove: () {
                                            cubit.removeReceiptItem(index);
                                          },
                                        )),
                              ],
                            ),
                          ),
                        const SizedBox(height: 8),
                        if (state.receiptItems.isNotEmpty)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  log('message');
                                  savePdfFile('fileName',
                                      await createPdf(state.receiptItems));
                                },
                                child: Text('Save and print')),
                          )
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<Uint8List> createPdf(List<ReceiptItem> items) {
  final totalPrice = items
      .map((e) => e.quantity * e.selectedPrice)
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
                                                  items[index]
                                                      .selectedUnit
                                                      .name,
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
                                                  items[index]
                                                      .selectedPrice
                                                      .toString(),
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
