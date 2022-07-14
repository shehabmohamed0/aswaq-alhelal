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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "anUnknownFailureOccurred": MessageLookupByLibrary.simpleMessage(
            "An unknown failure occurred."),
        "emailAlreadyExistsAmongYourUsers":
            MessageLookupByLibrary.simpleMessage(
                "credential already exists among your users."),
        "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
            "An account already exists for that email."),
        "emailIsAlreadyUsedByAnotherUser": MessageLookupByLibrary.simpleMessage(
            "Email is already used by another user."),
        "emailIsNotFoundPleaseCreateAnAccount":
            MessageLookupByLibrary.simpleMessage(
                "Email is not found, please create an account."),
        "emailIsNotValidOrBadlyFormatted": MessageLookupByLibrary.simpleMessage(
            "Email is not valid or badly formatted."),
        "incorrectPasswordPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Incorrect password, please try again."),
        "invalidEmail":
            MessageLookupByLibrary.simpleMessage("Email is not valid."),
        "invalidPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Invalid phone number."),
        "operationIsNotAllowedPleaseContactSupport":
            MessageLookupByLibrary.simpleMessage(
                "Operation is not allowed.  Please contact support."),
        "passwordIsNotStrongEnough": MessageLookupByLibrary.simpleMessage(
            "Password is not strong enough."),
        "phoneNumberAlreadyInUse": MessageLookupByLibrary.simpleMessage(
            "Phone number already in use."),
        "pleaseCheckInternetConnectionAndTryAgain":
            MessageLookupByLibrary.simpleMessage(
                "Please, check internet connection and try again."),
        "providersCredentialIsNotValid": MessageLookupByLibrary.simpleMessage(
            "provider\\\'s credential is not valid."),
        "sessionExpired":
            MessageLookupByLibrary.simpleMessage("Session expired."),
        "signInFirstToApplyTheseChanges": MessageLookupByLibrary.simpleMessage(
            "Sign in first to apply these changes."),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong."),
        "theCredentialGivenDoesNotCorrespondToAnyExistingUser":
            MessageLookupByLibrary.simpleMessage(
                "The credential given does not correspond to any existing user."),
        "theCredentialReceivedIsMalformedOrHasExpired":
            MessageLookupByLibrary.simpleMessage(
                "The credential received is malformed or has expired."),
        "theEmailAndPasswordYouEnteredDoestBelongThisUser":
            MessageLookupByLibrary.simpleMessage(
                "The email and password you entered does\\\'t belong this user."),
        "theEmailHasAlreadyBeenLinkedToTheUser":
            MessageLookupByLibrary.simpleMessage(
                "The Email has already been linked to the user."),
        "theNewEmailIsInvalid":
            MessageLookupByLibrary.simpleMessage("The new email is invalid."),
        "thePasswordIsNotCorrect": MessageLookupByLibrary.simpleMessage(
            "The password is not correct."),
        "theUsersLastSigninTimeDoesNotMeetTheSecurity":
            MessageLookupByLibrary.simpleMessage(
                "The user\\\'s last sign-in time does not meet the security threshold."),
        "theVerificationCodeReceivedIsInvalid":
            MessageLookupByLibrary.simpleMessage(
                "The verification code received is invalid."),
        "theVerificationCodeYouEnteredIsInvalid":
            MessageLookupByLibrary.simpleMessage(
                "The verification code you entered is invalid."),
        "theVerificationIdReceivedIsInvalid":
            MessageLookupByLibrary.simpleMessage(
                "The verification ID received is invalid."),
        "thisUserHasBeenDisabledPleaseContactSupportForHelp":
            MessageLookupByLibrary.simpleMessage(
                "This user has been disabled. Please contact support for help."),
        "tooManyRequests":
            MessageLookupByLibrary.simpleMessage("Too many requests.")
      };
}
