import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? helperText;
  final TextInputType? keyboaedType;
  final void Function(String text)? onChanged;
  final String? errorText;
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.helperText,
    this.keyboaedType,
    required this.onChanged,
    required this.errorText,
  }) : super(key: key);
/*
 labelText: 'Phone number',
        helperText: '',
         errorText: (state) =>
          state.phoneNumber.invalid ? 'invalid phone number' : null,*/
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
      ),
    );
  }
}
