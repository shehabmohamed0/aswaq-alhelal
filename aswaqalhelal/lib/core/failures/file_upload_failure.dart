import 'package:aswaqalhelal/core/failures/failure.dart';
import 'package:aswaqalhelal/l10n/l10n.dart';
import 'package:aswaqalhelal/locator/locator.dart';

class UploadFileFailure extends Failure {
  final String message;

  UploadFileFailure._(this.message);

  factory UploadFileFailure() {
    final intl = locator<AppLocalizations>();
    return UploadFileFailure._(intl.failedToUploadTheFile);
  }
  factory UploadFileFailure.image() {
    final intl = locator<AppLocalizations>();
    return UploadFileFailure._(intl.failedToUploadTheImage);
  }
  factory UploadFileFailure.images() {
    final intl = locator<AppLocalizations>();
    return UploadFileFailure._(intl.failedToUploadTheImages);
  }
  factory UploadFileFailure.custom(String message) {
    return UploadFileFailure._(message);
  }
}

/*

static Future<AppLocalizations> load(Locale locale) {
    return MultipleLocalizations.load(
      initializeMessages,
      locale,
      (l) {
        final instance = AppLocalizations();
        AppLocalizations._current = instance;
        return instance;
      },
      setDefaultLocale: true,
    );
  } */