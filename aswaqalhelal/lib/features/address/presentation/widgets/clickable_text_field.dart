import 'package:flutter/material.dart';

import 'normal_text_field.dart';

class ClickableTextField extends StatelessWidget {
  const ClickableTextField({
    Key? key,
    this.controller,
    required this.onTap,
    this.initialValue,
    this.hint,
    this.label,
    this.errorText,
    this.onChanged,
  }) : super(key: key);
  final TextEditingController? controller;
  final VoidCallback onTap;
  final String? initialValue;
  final String? hint;
  final String? label;
  final String? errorText;
  final Function(String value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: NormalTextFormField(
        controller: controller,
        initialValue: initialValue,
        errorText: errorText,
        hint: hint,
        labelText: label,
        enabled: false,
        onChanged: onChanged,
      ),
    );
  }
}
