import 'package:aswaqalhelal/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:root_package/core/resources/color_manager.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../cubit/currency_cubit.dart';

class CurrencyPage extends HookWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = locator<AppLocalizations>();
    final fromController = useTextEditingController();
    final toController = useTextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(intl.currencyConverter),
        elevation: 0,
      ),
      body: BlocConsumer<CurrencyCubit, CurrencyState>(
        listener: (context, state) {
          switch (state.status) {
            case FormzStatus.submissionSuccess:
              toController.text = '${state.currency?.amount ?? 0}';
              break;

            case FormzStatus.submissionFailure:
              showErrorSnackBar(
                  context, state.errorMessage ?? intl.somethingWentWrong);
              break;

            default:
          }
        },
        builder: (context, state) {
          return Theme(
            data: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: ColorManager.primary)),
            child: Column(
              children: [
                if (state.status.isSubmissionInProgress)
                  LinearProgressIndicator(),
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3)),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: CustomDropDown(
                              value: state.from.value,
                              onChanged:
                                  context.read<CurrencyCubit>().fromChanged,
                            ),
                          ),
                          TextField(
                            controller: fromController,
                            keyboardType: TextInputType.number,
                            onChanged:
                                context.read<CurrencyCubit>().amountChanged,
                            style: TextStyle(fontSize: 26),
                            decoration: InputDecoration(
                              errorText: state.status.isInvalid
                                  ? intl.incorrectNumber
                                  : null,
                              hintStyle: TextStyle(
                                  fontSize: 26, color: Colors.grey.shade400),
                              hintText: '0.0',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3)),
                              ]),
                          child: TextButton(
                            onPressed: () {
                              context.read<CurrencyCubit>().covertCurrency();
                            },
                            child: Text(
                              '=',
                              style: TextStyle(
                                  fontSize: 32, color: ColorManager.primary),
                            ),
                          ),
                        ),
                        Ink(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: ColorManager.primary.withOpacity(0.1),
                              border: Border.all(
                                  color: ColorManager.primary, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: InkWell(
                            onTap: context.read<CurrencyCubit>().swap,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.swap_vert,
                                  size: 28,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  intl.switchCurrencies,
                                  style: TextStyle(
                                    color: ColorManager.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3)),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: CustomDropDown(
                              value: state.to.value,
                              onChanged:
                                  context.read<CurrencyCubit>().toChanged,
                            ),
                          ),
                          TextField(
                            enabled: false,
                            controller: toController,
                            style: const TextStyle(fontSize: 26),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 26, color: Colors.grey.shade400),
                              hintText: '0.0',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.onChanged,
    required this.value,
  }) : super(key: key);
  final String value;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: ColorManager.primary.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3)),
          ]),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(15),
        value: value,
        underline: const SizedBox.shrink(),
        alignment: Alignment.center,
        elevation: 1,
        dropdownColor: Colors.white,
        items: currencies.map((val) {
          return DropdownMenuItem(
            child: Text(val),
            value: val,
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

const List<String> currencies = ['USD', 'EUR', 'EGP'];
