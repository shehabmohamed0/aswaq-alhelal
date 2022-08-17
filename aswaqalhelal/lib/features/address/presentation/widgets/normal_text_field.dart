import 'package:flutter/material.dart';
import 'package:root_package/core/resources/values_manager.dart';

class NormalTextFormField extends StatelessWidget {
  const NormalTextFormField(
      {Key? key,
      this.controller,
      this.focusNode,
      this.labelText,
      this.errorText,
      this.hint,
      this.onChanged,
      this.initialValue,
      this.suffixIcon,
      this.enabled = true,
      this.textArea = false})
      : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? errorText;
  final String? initialValue;
  final String? hint;
  final Widget? suffixIcon;
  final bool textArea;
  final bool enabled;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textButtonTheme: TextButtonThemeData(
            style:
                TextButton.styleFrom(primary: Theme.of(context).primaryColor)),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Theme.of(context).primaryColor,
          hintStyle: const TextStyle(color: Colors.black38),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          errorStyle: const TextStyle(color: Colors.red),
          iconColor: Theme.of(context).primaryColor,
        ),
      ),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        initialValue: initialValue,
        enabled: enabled,
        onChanged: onChanged,
        readOnly: !enabled,
        cursorColor: Theme.of(context).primaryColor,
        maxLines: textArea ? null : 1,
        keyboardType: textArea ? TextInputType.multiline : null,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: AppSize.s18,
            color: enabled ? Colors.black87 : Colors.black87),
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffixIcon,
          labelText: labelText,
          errorText: errorText,
          labelStyle: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
            fontSize: AppSize.s14,
          ),
        ),
      ),
    );
  }
}
