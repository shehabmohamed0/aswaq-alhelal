import 'package:flutter/material.dart';

Future<T?> showConfirmationDialog<T>(BuildContext context) {
  return showDialog<T?>(context: context, builder: (coxt) => SimpleDialog());
}
