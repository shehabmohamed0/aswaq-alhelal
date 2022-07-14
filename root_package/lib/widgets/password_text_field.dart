import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.onChanged,
    required this.errorText,
    this.labelText,
  }) : super(key: key);
  final void Function(String text)? onChanged;
  final String? errorText;
  final String? labelText;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      obscureText: !showPassword,
      
      decoration: InputDecoration(
        labelText: widget.labelText,
        errorText: widget.errorText,
        suffixIcon: GestureDetector(
          onTap: toggelPassword,
          child: Icon(
            showPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
        ),
      ),
    );
  }

  void toggelPassword() {
    setState(() => showPassword = !showPassword);
  }
}
