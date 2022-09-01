import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OTPWidget extends StatelessWidget {
  const OTPWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onCompleted,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    const length = 6;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Pinput(
      controller: controller,
      focusNode: focusNode,
      length: length,
      defaultPinTheme: defaultPinTheme,
      onCompleted: onCompleted,
      onChanged: onChanged,
      focusedPinTheme: defaultPinTheme.copyWith(
        height: 68,
        width: 64,
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: borderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: errorColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
