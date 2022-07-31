import 'package:root_package/core/failures/failure.dart';

import '../../l10n/l10n.dart';
import '../../locator/locator.dart';

class UploadFileFailure extends Failure {
  final String message;

  UploadFileFailure._(this.message);

  factory UploadFileFailure() {
    final intl = locator<RootPackageLocalizations>();
    return UploadFileFailure._(intl.failedToUploadTheFile);
  }
  factory UploadFileFailure.image() {
    final intl = locator<RootPackageLocalizations>();
    return UploadFileFailure._(intl.failedToUploadTheImage);
  }
  factory UploadFileFailure.images() {
    final intl = locator<RootPackageLocalizations>();
    return UploadFileFailure._(intl.failedToUploadTheImages);
  }
  factory UploadFileFailure.custom(String message) {
    return UploadFileFailure._(message);
  }
}

/*

static Future<RootPackageLocalizations> load(Locale locale) {
    return MultipleLocalizations.load(
      initializeMessages,
      locale,
      (l) {
        final instance = RootPackageLocalizations();
        RootPackageLocalizations._current = instance;
        return instance;
      },
      setDefaultLocale: true,
    );
  } */