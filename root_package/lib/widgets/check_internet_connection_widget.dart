import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../locator/locator.dart';

class CheckInternetConnection extends StatelessWidget {
  const CheckInternetConnection({Key? key, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final RootPackageLocalizations intl = locator<RootPackageLocalizations>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
           intl.checkInternetConnection,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ElevatedButton(onPressed: onPressed, child:  Text(intl.tryAgain))
        ],
      ),
    );
  }
}
