import 'package:flutter/material.dart';

class GenderRadio extends StatelessWidget {
  const GenderRadio({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
  }) : super(key: key);
  final String title;
  final String value;
  final String? groupValue;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String?>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(title, style: Theme.of(context).textTheme.titleSmall)
      ],
    );
  }
}