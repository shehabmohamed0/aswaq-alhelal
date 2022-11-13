import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InternationalPhoneTextField extends StatefulWidget {
  const InternationalPhoneTextField(
      {Key? key,
      this.controller,
      this.focusNode,
      this.hintText,
      this.initialNumber,
      this.errorText,
      this.countries,
      this.suffixIcon,
      required this.onInputChanged,
      this.isEnabled,
      this.validator})
      : super(key: key);
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? initialNumber;
  final String? Function()? errorText;
  final List<String>? countries;
  final bool? isEnabled;
  final void Function(PhoneNumber)? onInputChanged;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  @override
  State<InternationalPhoneTextField> createState() =>
      _InternationalPhoneTextFieldState();
}

class _InternationalPhoneTextFieldState
    extends State<InternationalPhoneTextField> {
  Future<PhoneNumber>? future;

  @override
  void initState() {
    if (widget.initialNumber != null) {
      future = PhoneNumber.getRegionInfoFromPhoneNumber(widget.initialNumber!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.initialNumber != null
        ? FutureBuilder<PhoneNumber>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return InternationalPhoneNumberInput(
                  focusNode: widget.focusNode,
                  locale: Localizations.localeOf(context).scriptCode,
                  initialValue: snapshot.data,
                  textFieldController: widget.controller,
                  hintText: widget.hintText,
                  inputDecoration: InputDecoration(
                    errorText: widget.errorText?.call(),
                    suffixIcon: widget.suffixIcon,
                  ),
                  onInputChanged: widget.onInputChanged,
                  keyboardType: TextInputType.number,
                  spaceBetweenSelectorAndTextField: 8,
                  selectorConfig: const SelectorConfig(
                    setSelectorButtonAsPrefixIcon: true,
                    leadingPadding: 16,
                  ),
                  formatInput: true,
                  isEnabled: widget.isEnabled ?? true,
                  selectorTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  countries: widget.countries,
                  validator: widget.validator,
                );
              } else {
                return Container();
              }
            },
          )
        : InternationalPhoneNumberInput(
          focusNode: widget.focusNode,
            locale: Localizations.localeOf(context).languageCode,
            textFieldController: widget.controller,
            hintText: widget.hintText,
            inputDecoration: InputDecoration(
              errorText: widget.errorText?.call(),
              suffixIcon: widget.suffixIcon,
            ),
            validator: widget.validator,
            onInputChanged: widget.onInputChanged,
            keyboardType: TextInputType.number,
            spaceBetweenSelectorAndTextField: 8,
            selectorConfig: const SelectorConfig(
              setSelectorButtonAsPrefixIcon: true,
              leadingPadding: 16,
            ),
            formatInput: true,
            isEnabled: widget.isEnabled ?? true,
            selectorTextStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            countries: widget.countries,
          );
  }
}
/*
if (widget.initialNumber != null) {
      return FutureBuilder<PhoneNumber>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InternationalPhoneNumberInput(
              locale: 'ar',
              initialValue: snapshot.data,
              textFieldController: widget.controller,
              hintText: widget.hintText,
              inputDecoration:
                  InputDecoration(errorText: widget.errorText?.call()),
              onInputChanged: widget.onInputChanged,
              keyboardType: TextInputType.number,
              spaceBetweenSelectorAndTextField: 8,
              selectorConfig: const SelectorConfig(
                setSelectorButtonAsPrefixIcon: true,
                leadingPadding: 16,
              ),
              formatInput: true,
              isEnabled: widget.isEnabled ?? true,
              selectorTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              countries: widget.countries,
            );
          } else {
            return Container();
          }
        },
      );
    }
    return InternationalPhoneNumberInput(
      locale: Localizations.localeOf(context).languageCode,
      textFieldController: widget.controller,
      hintText: widget.hintText,
      inputDecoration: InputDecoration(errorText: widget.errorText?.call()),
      onInputChanged: widget.onInputChanged,
      keyboardType: TextInputType.number,
      spaceBetweenSelectorAndTextField: 8,
      selectorConfig: const SelectorConfig(
        setSelectorButtonAsPrefixIcon: true,
        leadingPadding: 16,
      ),
      formatInput: true,
      isEnabled: widget.isEnabled ?? true,
      selectorTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      countries: widget.countries,
    );
 */