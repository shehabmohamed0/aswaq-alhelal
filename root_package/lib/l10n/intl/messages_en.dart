// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(howMany) =>
      "Must be at least ${Intl.plural(howMany, one: '1 character', other: '${howMany} characters')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "acceptsIntegersOnly":
            MessageLookupByLibrary.simpleMessage("Accepts Integers only."),
        "checkInternetConnection": MessageLookupByLibrary.simpleMessage(
            "Please, check internet connection."),
        "failedToUploadTheFile":
            MessageLookupByLibrary.simpleMessage("Failed to upload the file."),
        "failedToUploadTheImage":
            MessageLookupByLibrary.simpleMessage("Failed to upload the image."),
        "failedToUploadTheImages": MessageLookupByLibrary.simpleMessage(
            "Failed to upload the images."),
        "helloWorld": MessageLookupByLibrary.simpleMessage("Hello World!"),
        "invalidEmailAddress":
            MessageLookupByLibrary.simpleMessage("Invalid email address."),
        "invalidName":
            MessageLookupByLibrary.simpleMessage("Invalid user name."),
        "invalidNumber":
            MessageLookupByLibrary.simpleMessage("Invalid number."),
        "invalidPassword": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 8 character."),
        "invalidPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Invalid phone number."),
        "mustBeAtLeastNumberCharacter": m0,
        "phoneNumberIsAlreadyRegistered": MessageLookupByLibrary.simpleMessage(
            "The phone number is already registered."),
        "required": MessageLookupByLibrary.simpleMessage("Required"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong."),
        "theNumberCanNotBeNegative": MessageLookupByLibrary.simpleMessage(
            "The number can not be negative."),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "zeroIsAnInvalidNumber":
            MessageLookupByLibrary.simpleMessage("Zero is an invalid number.")
      };
}
