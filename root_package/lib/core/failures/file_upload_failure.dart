import 'package:root_package/core/failures/failure.dart';

import '../../l10n/l10n.dart';
import '../../locator/locator.dart';

class FileUploadFailure extends Failure {
  final String message;

  FileUploadFailure._(this.message);

  factory FileUploadFailure() {
    final intl = locator<RootPackageLocalizations>();
    return FileUploadFailure._(intl.failedToUploadTheFile);
  }
  factory FileUploadFailure.image() {
    final intl = locator<RootPackageLocalizations>();
    return FileUploadFailure._(intl.failedToUploadTheImage);
  }
  factory FileUploadFailure.images() {
    final intl = locator<RootPackageLocalizations>();
    return FileUploadFailure._(intl.failedToUploadTheImages);
  }
  factory FileUploadFailure.custom(String message) {
    return FileUploadFailure._(message);
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