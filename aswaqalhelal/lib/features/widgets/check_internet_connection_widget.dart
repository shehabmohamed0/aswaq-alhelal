import '../../l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';

class CheckInternetConnection extends StatelessWidget {
  const CheckInternetConnection({Key? key, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final AppLocalizations intl = locator<AppLocalizations>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Check internet connection.',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ElevatedButton(onPressed: onPressed, child: const Text('Try again'))
        ],
      ),
    );
  }
}
