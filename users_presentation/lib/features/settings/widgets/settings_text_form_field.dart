import 'package:flutter/material.dart';
import 'package:root_package/core/resources/values_manager.dart';

class SettingTextFormField extends StatelessWidget {
  const SettingTextFormField({
    Key? key,
    this.controller,
    required this.labelText,
    this.onChanged,
    this.initialValue,
    this.suffixIcon,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController? controller;
  final String labelText;
  final Icon? suffixIcon;
  final String? initialValue;
  final bool enabled;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      enabled: enabled,
      onChanged: onChanged,
      readOnly: !enabled,
      style:
          const TextStyle(fontWeight: FontWeight.w600, fontSize: AppSize.s18),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500,
          fontSize: AppSize.s14,
        ),
      ),
    );
  }
}
