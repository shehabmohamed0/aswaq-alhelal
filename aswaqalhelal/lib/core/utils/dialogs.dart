import 'package:flutter/material.dart' show FittedBox, Colors;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
