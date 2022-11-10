import 'package:flutter/material.dart' show FittedBox, Colors;
import 'package:root_package/packages/flutter_easyloading.dart'
    show EasyLoading;
import 'package:root_package/packages/flutter_spinkit.dart';

import '../../l10n/l10n.dart';

Future<void> showLoadingDialog() {
  final intl = AppLocalizations.current;
  return EasyLoading.show(
    status: intl.loading,
    indicator: const FittedBox(
      child: SpinKitRipple(
        duration: Duration(milliseconds: 1200),
        color: Colors.white,
      ),
    ),
  );
}

Future<void> dismissLoadingDialog() {
  return EasyLoading.dismiss();
}
