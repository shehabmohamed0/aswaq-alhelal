// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }

  /// `invalid amount.`
  String get invalidAmount {
    return Intl.message(
      'invalid amount.',
      name: 'invalidAmount',
      desc: '',
      args: [],
    );
  }

  /// `invalid Code.`
  String get invalidCode {
    return Intl.message(
      'invalid Code.',
      name: 'invalidCode',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Aswaq Alhilal`
  String get aswaqAlhilal {
    return Intl.message(
      'Aswaq Alhilal',
      name: 'aswaqAlhilal',
      desc: '',
      args: [],
    );
  }

  /// `No image`
  String get noImage {
    return Intl.message(
      'No image',
      name: 'noImage',
      desc: '',
      args: [],
    );
  }

  /// `Uploaded succeffully`
  String get uploadedSucceffully {
    return Intl.message(
      'Uploaded succeffully',
      name: 'uploadedSucceffully',
      desc: '',
      args: [],
    );
  }

  /// `uploading Failed`
  String get uploadingFailed {
    return Intl.message(
      'uploading Failed',
      name: 'uploadingFailed',
      desc: '',
      args: [],
    );
  }

  /// `Update image`
  String get updateImage {
    return Intl.message(
      'Update image',
      name: 'updateImage',
      desc: '',
      args: [],
    );
  }

  /// `CURRENCY CONVERTER`
  String get currencyConverter {
    return Intl.message(
      'CURRENCY CONVERTER',
      name: 'currencyConverter',
      desc: '',
      args: [],
    );
  }

  /// `incorrect number`
  String get incorrectNumber {
    return Intl.message(
      'incorrect number',
      name: 'incorrectNumber',
      desc: '',
      args: [],
    );
  }

  /// `Switch Currencies`
  String get switchCurrencies {
    return Intl.message(
      'Switch Currencies',
      name: 'switchCurrencies',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `dasdasd`
  String get usersLogic {
    return Intl.message(
      'dasdasd',
      name: 'usersLogic',
      desc: '',
      args: [],
    );
  }

  /// `The Email has already been linked to the user.`
  String get theEmailHasAlreadyBeenLinkedToTheUser {
    return Intl.message(
      'The Email has already been linked to the user.',
      name: 'theEmailHasAlreadyBeenLinkedToTheUser',
      desc: '',
      args: [],
    );
  }

  /// `provider's credential is not valid.`
  String get providersCredentialIsNotValid {
    return Intl.message(
      'provider\'s credential is not valid.',
      name: 'providersCredentialIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `credential already exists among your users.`
  String get emailAlreadyExistsAmongYourUsers {
    return Intl.message(
      'credential already exists among your users.',
      name: 'emailAlreadyExistsAmongYourUsers',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid.`
  String get invalidEmail {
    return Intl.message(
      'Email is not valid.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists for that email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'An account already exists for that email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Operation is not allowed.  Please contact support.`
  String get operationIsNotAllowedPleaseContactSupport {
    return Intl.message(
      'Operation is not allowed.  Please contact support.',
      name: 'operationIsNotAllowedPleaseContactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Sign in first to apply these changes.`
  String get signInFirstToApplyTheseChanges {
    return Intl.message(
      'Sign in first to apply these changes.',
      name: 'signInFirstToApplyTheseChanges',
      desc: '',
      args: [],
    );
  }

  /// `Password is not strong enough.`
  String get passwordIsNotStrongEnough {
    return Intl.message(
      'Password is not strong enough.',
      name: 'passwordIsNotStrongEnough',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests.`
  String get tooManyRequests {
    return Intl.message(
      'Too many requests.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `An unknown failure occurred.`
  String get anUnknownFailureOccurred {
    return Intl.message(
      'An unknown failure occurred.',
      name: 'anUnknownFailureOccurred',
      desc: '',
      args: [],
    );
  }

  /// `The credential received is malformed or has expired.`
  String get theCredentialReceivedIsMalformedOrHasExpired {
    return Intl.message(
      'The credential received is malformed or has expired.',
      name: 'theCredentialReceivedIsMalformedOrHasExpired',
      desc: '',
      args: [],
    );
  }

  /// `This user has been disabled. Please contact support for help.`
  String get thisUserHasBeenDisabledPleaseContactSupportForHelp {
    return Intl.message(
      'This user has been disabled. Please contact support for help.',
      name: 'thisUserHasBeenDisabledPleaseContactSupportForHelp',
      desc: '',
      args: [],
    );
  }

  /// `The verification code received is invalid.`
  String get theVerificationCodeReceivedIsInvalid {
    return Intl.message(
      'The verification code received is invalid.',
      name: 'theVerificationCodeReceivedIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `The verification ID received is invalid.`
  String get theVerificationIdReceivedIsInvalid {
    return Intl.message(
      'The verification ID received is invalid.',
      name: 'theVerificationIdReceivedIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Please, check internet connection and try again.`
  String get pleaseCheckInternetConnectionAndTryAgain {
    return Intl.message(
      'Please, check internet connection and try again.',
      name: 'pleaseCheckInternetConnectionAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number.`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number.',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid or badly formatted.`
  String get emailIsNotValidOrBadlyFormatted {
    return Intl.message(
      'Email is not valid or badly formatted.',
      name: 'emailIsNotValidOrBadlyFormatted',
      desc: '',
      args: [],
    );
  }

  /// `Email is not found, please create an account.`
  String get emailIsNotFoundPleaseCreateAnAccount {
    return Intl.message(
      'Email is not found, please create an account.',
      name: 'emailIsNotFoundPleaseCreateAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password, please try again.`
  String get incorrectPasswordPleaseTryAgain {
    return Intl.message(
      'Incorrect password, please try again.',
      name: 'incorrectPasswordPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `The email and password you entered does't belong this user.`
  String get theEmailAndPasswordYouEnteredDoestBelongThisUser {
    return Intl.message(
      'The email and password you entered does\'t belong this user.',
      name: 'theEmailAndPasswordYouEnteredDoestBelongThisUser',
      desc: '',
      args: [],
    );
  }

  /// `The credential given does not correspond to any existing user.`
  String get theCredentialGivenDoesNotCorrespondToAnyExistingUser {
    return Intl.message(
      'The credential given does not correspond to any existing user.',
      name: 'theCredentialGivenDoesNotCorrespondToAnyExistingUser',
      desc: '',
      args: [],
    );
  }

  /// `The new email is invalid.`
  String get theNewEmailIsInvalid {
    return Intl.message(
      'The new email is invalid.',
      name: 'theNewEmailIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `The password is not correct.`
  String get thePasswordIsNotCorrect {
    return Intl.message(
      'The password is not correct.',
      name: 'thePasswordIsNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Email is already used by another user.`
  String get emailIsAlreadyUsedByAnotherUser {
    return Intl.message(
      'Email is already used by another user.',
      name: 'emailIsAlreadyUsedByAnotherUser',
      desc: '',
      args: [],
    );
  }

  /// `The user's last sign-in time does not meet the security threshold.`
  String get theUsersLastSigninTimeDoesNotMeetTheSecurity {
    return Intl.message(
      'The user\'s last sign-in time does not meet the security threshold.',
      name: 'theUsersLastSigninTimeDoesNotMeetTheSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Session expired.`
  String get sessionExpired {
    return Intl.message(
      'Session expired.',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Phone number already in use.`
  String get phoneNumberAlreadyInUse {
    return Intl.message(
      'Phone number already in use.',
      name: 'phoneNumberAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `The verification code you entered is invalid.`
  String get theVerificationCodeYouEnteredIsInvalid {
    return Intl.message(
      'The verification code you entered is invalid.',
      name: 'theVerificationCodeYouEnteredIsInvalid',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'users presentation' key

  /// `Phone number is not registered.`
  String get phoneNumberIsNotRegistered {
    return Intl.message(
      'Phone number is not registered.',
      name: 'phoneNumberIsNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Phone number already is use.`
  String get phoneNumberAlreadyIsUse {
    return Intl.message(
      'Phone number already is use.',
      name: 'phoneNumberAlreadyIsUse',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Not registered yet?`
  String get notRegisteredYet {
    return Intl.message(
      'Not registered yet?',
      name: 'notRegisteredYet',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account.`
  String get createAnAccount {
    return Intl.message(
      'Create an Account.',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Authentication Failure`
  String get authenticationFailure {
    return Intl.message(
      'Authentication Failure',
      name: 'authenticationFailure',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get signUp {
    return Intl.message(
      'SIGN UP',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get otp {
    return Intl.message(
      'OTP',
      name: 'otp',
      desc: '',
      args: [],
    );
  }

  /// `Verification code`
  String get verificationCode {
    return Intl.message(
      'Verification code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `We have sent the code verifiaction to\nYour Mobile Number`
  String get weHaveSentTheCodeVerifiactionTonyourMobileNumber {
    return Intl.message(
      'We have sent the code verifiaction to\nYour Mobile Number',
      name: 'weHaveSentTheCodeVerifiactionTonyourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `failed`
  String get failed {
    return Intl.message(
      'failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Verifiy`
  String get verifiy {
    return Intl.message(
      'Verifiy',
      name: 'verifiy',
      desc: '',
      args: [],
    );
  }

  /// `Firestore error`
  String get firestoreError {
    return Intl.message(
      'Firestore error',
      name: 'firestoreError',
      desc: '',
      args: [],
    );
  }

  /// `Account info`
  String get accountInfo {
    return Intl.message(
      'Account info',
      name: 'accountInfo',
      desc: '',
      args: [],
    );
  }

  /// `loading...`
  String get loading {
    return Intl.message(
      'loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `update failed`
  String get updateFailed {
    return Intl.message(
      'update failed',
      name: 'updateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Gender (optional)`
  String get genderOptional {
    return Intl.message(
      'Gender (optional)',
      name: 'genderOptional',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Not specified`
  String get notSpecified {
    return Intl.message(
      'Not specified',
      name: 'notSpecified',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Change phone number`
  String get changePhoneNumber {
    return Intl.message(
      'Change phone number',
      name: 'changePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Change number failure`
  String get changeNumberFailure {
    return Intl.message(
      'Change number failure',
      name: 'changeNumberFailure',
      desc: '',
      args: [],
    );
  }

  /// `phone has been updated successfully`
  String get phoneHasBeenUpdatedSuccessfully {
    return Intl.message(
      'phone has been updated successfully',
      name: 'phoneHasBeenUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Contact info`
  String get contactInfo {
    return Intl.message(
      'Contact info',
      name: 'contactInfo',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailAddress {
    return Intl.message(
      'Email address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `No email linked to the account.`
  String get noEmailLinkedToTheAccount {
    return Intl.message(
      'No email linked to the account.',
      name: 'noEmailLinkedToTheAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone info`
  String get phoneInfo {
    return Intl.message(
      'Phone info',
      name: 'phoneInfo',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Update email`
  String get updateEmail {
    return Intl.message(
      'Update email',
      name: 'updateEmail',
      desc: '',
      args: [],
    );
  }

  /// `Update email failed.`
  String get updateEmailFailed {
    return Intl.message(
      'Update email failed.',
      name: 'updateEmailFailed',
      desc: '',
      args: [],
    );
  }

  /// `New email`
  String get newEmail {
    return Intl.message(
      'New email',
      name: 'newEmail',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get currentPassword {
    return Intl.message(
      'Current password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get verifiybuttontext {
    return Intl.message(
      'Login',
      name: 'verifiybuttontext',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get addresses {
    return Intl.message(
      'Addresses',
      name: 'addresses',
      desc: '',
      args: [],
    );
  }

  /// `This order has been canceled by the user`
  String get thisOrderHasBeenCanceledByTheUser {
    return Intl.message(
      'This order has been canceled by the user',
      name: 'thisOrderHasBeenCanceledByTheUser',
      desc: '',
      args: [],
    );
  }

  /// `Denied Forever, please go to settings to get the permission`
  String get deniedForEverPleaseGoToSettings {
    return Intl.message(
      'Denied Forever, please go to settings to get the permission',
      name: 'deniedForEverPleaseGoToSettings',
      desc: '',
      args: [],
    );
  }

  /// `The phone number does not correspond to any user`
  String get thePhoneNumberDoesNotCorrespondToAnyUser {
    return Intl.message(
      'The phone number does not correspond to any user',
      name: 'thePhoneNumberDoesNotCorrespondToAnyUser',
      desc: '',
      args: [],
    );
  }

  /// `Already, an offer sent to this user`
  String get alreadySentAnOfferToThisUser {
    return Intl.message(
      'Already, an offer sent to this user',
      name: 'alreadySentAnOfferToThisUser',
      desc: '',
      args: [],
    );
  }

  /// `This user is currently working for the institution.`
  String get thisUserIsCurrentlyWorkingForTheInstitution {
    return Intl.message(
      'This user is currently working for the institution.',
      name: 'thisUserIsCurrentlyWorkingForTheInstitution',
      desc: '',
      args: [],
    );
  }

  /// `Server error`
  String get serverError {
    return Intl.message(
      'Server error',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Added successfully`
  String get addedSuccefully {
    return Intl.message(
      'Added successfully',
      name: 'addedSuccefully',
      desc: '',
      args: [],
    );
  }

  /// `Updated succefully`
  String get updatedSuccefully {
    return Intl.message(
      'Updated succefully',
      name: 'updatedSuccefully',
      desc: '',
      args: [],
    );
  }

  /// `Add address`
  String get addAddress {
    return Intl.message(
      'Add address',
      name: 'addAddress',
      desc: '',
      args: [],
    );
  }

  /// `Edit address`
  String get editAddress {
    return Intl.message(
      'Edit address',
      name: 'editAddress',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message(
      'User name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Delivery address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get Current {
    return Intl.message(
      'Current',
      name: 'Current',
      desc: '',
      args: [],
    );
  }

  /// `There is no address`
  String get theirIsNoAddress {
    return Intl.message(
      'There is no address',
      name: 'theirIsNoAddress',
      desc: '',
      args: [],
    );
  }

  /// `Delivery location`
  String get deliveryLocation {
    return Intl.message(
      'Delivery location',
      name: 'deliveryLocation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Governate`
  String get governate {
    return Intl.message(
      'Governate',
      name: 'governate',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Neighborhood`
  String get neighborhood {
    return Intl.message(
      'Neighborhood',
      name: 'neighborhood',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Current location`
  String get currentLocation {
    return Intl.message(
      'Current location',
      name: 'currentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select location`
  String get selectLocation {
    return Intl.message(
      'Select location',
      name: 'selectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Verifiy phone number`
  String get verifiyPhoneNumber {
    return Intl.message(
      'Verifiy phone number',
      name: 'verifiyPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Select measure unit`
  String get selectMeasureUnit {
    return Intl.message(
      'Select measure unit',
      name: 'selectMeasureUnit',
      desc: '',
      args: [],
    );
  }

  /// ` EGP`
  String get egp {
    return Intl.message(
      ' EGP',
      name: 'egp',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `You order has been placed sucessfully`
  String get youOrderHasBeenPlacedSucessfully {
    return Intl.message(
      'You order has been placed sucessfully',
      name: 'youOrderHasBeenPlacedSucessfully',
      desc: '',
      args: [],
    );
  }

  /// `Total price:`
  String get totalPrice {
    return Intl.message(
      'Total price:',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Order now`
  String get orderNow {
    return Intl.message(
      'Order now',
      name: 'orderNow',
      desc: '',
      args: [],
    );
  }

  /// `Distribution Areas`
  String get distributionAreas {
    return Intl.message(
      'Distribution Areas',
      name: 'distributionAreas',
      desc: '',
      args: [],
    );
  }

  /// `Neighborhood / Village`
  String get neighborhoodVillage {
    return Intl.message(
      'Neighborhood / Village',
      name: 'neighborhoodVillage',
      desc: '',
      args: [],
    );
  }

  /// `all`
  String get all {
    return Intl.message(
      'all',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get work {
    return Intl.message(
      'Work',
      name: 'work',
      desc: '',
      args: [],
    );
  }

  /// `Job offers`
  String get jobOffers {
    return Intl.message(
      'Job offers',
      name: 'jobOffers',
      desc: '',
      args: [],
    );
  }

  /// `Institutions`
  String get institutions {
    return Intl.message(
      'Institutions',
      name: 'institutions',
      desc: '',
      args: [],
    );
  }

  /// `Choose delivery location`
  String get chooseDeliveryLocation {
    return Intl.message(
      'Choose delivery location',
      name: 'chooseDeliveryLocation',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to a different address`
  String get deliverToDifferentAddress {
    return Intl.message(
      'Deliver to a different address',
      name: 'deliverToDifferentAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add new address`
  String get addNewAddress {
    return Intl.message(
      'Add new address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `No Suggestions`
  String get noSuggestions {
    return Intl.message(
      'No Suggestions',
      name: 'noSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get takePhoto {
    return Intl.message(
      'Take Photo',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Item Updated successfully`
  String get itemUpdatedSuccefully {
    return Intl.message(
      'Item Updated successfully',
      name: 'itemUpdatedSuccefully',
      desc: '',
      args: [],
    );
  }

  /// `Unit exsists before`
  String get unitExsistsBefore {
    return Intl.message(
      'Unit exsists before',
      name: 'unitExsistsBefore',
      desc: '',
      args: [],
    );
  }

  /// `Add item`
  String get addItem {
    return Intl.message(
      'Add item',
      name: 'addItem',
      desc: '',
      args: [],
    );
  }

  /// `Tap to\nSelect item image.`
  String get tapTonselectItemImage {
    return Intl.message(
      'Tap to\nSelect item image.',
      name: 'tapTonselectItemImage',
      desc: '',
      args: [],
    );
  }

  /// `Units`
  String get units {
    return Intl.message(
      'Units',
      name: 'units',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Price EGP`
  String get priceEgp {
    return Intl.message(
      'Price EGP',
      name: 'priceEgp',
      desc: '',
      args: [],
    );
  }

  /// `Unit name`
  String get unitName {
    return Intl.message(
      'Unit name',
      name: 'unitName',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `invalid`
  String get invalid {
    return Intl.message(
      'invalid',
      name: 'invalid',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get items {
    return Intl.message(
      'items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `there are no items`
  String get thereIsNoItems {
    return Intl.message(
      'there are no items',
      name: 'thereIsNoItems',
      desc: '',
      args: [],
    );
  }

  /// `Receipt`
  String get receipt {
    return Intl.message(
      'Receipt',
      name: 'receipt',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get item {
    return Intl.message(
      'Item',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unit {
    return Intl.message(
      'Unit',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `There is No Available institution\nat your address`
  String get thereIsNoAvailableInstitutionninYourAddress {
    return Intl.message(
      'There is No Available institution\nat your address',
      name: 'thereIsNoAvailableInstitutionninYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `From `
  String get from {
    return Intl.message(
      'From ',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Jobs Offers`
  String get jobsOffers {
    return Intl.message(
      'Jobs Offers',
      name: 'jobsOffers',
      desc: '',
      args: [],
    );
  }

  /// `No job\noffers`
  String get noJobsnoffers {
    return Intl.message(
      'No job\noffers',
      name: 'noJobsnoffers',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get noNotifications {
    return Intl.message(
      'No notifications',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Total Price: `
  String get totalPrice_ {
    return Intl.message(
      'Total Price: ',
      name: 'totalPrice_',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to cancel the order?`
  String get areYouSureToCancelTheOrder {
    return Intl.message(
      'Are you sure to cancel the order?',
      name: 'areYouSureToCancelTheOrder',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to decline the order?`
  String get areYouSureToDeclineTheOrder {
    return Intl.message(
      'Are you sure to decline the order?',
      name: 'areYouSureToDeclineTheOrder',
      desc: '',
      args: [],
    );
  }

  /// `No Orders Yet.`
  String get noOrdersYet {
    return Intl.message(
      'No Orders Yet.',
      name: 'noOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `There are no orders yet`
  String get thereIsNoOrdersYet {
    return Intl.message(
      'There are no orders yet',
      name: 'thereIsNoOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employees {
    return Intl.message(
      'Employees',
      name: 'employees',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Send successfuly`
  String get sendSuccessfuly {
    return Intl.message(
      'Send successfuly',
      name: 'sendSuccessfuly',
      desc: '',
      args: [],
    );
  }

  /// `Recruitment`
  String get recruitment {
    return Intl.message(
      'Recruitment',
      name: 'recruitment',
      desc: '',
      args: [],
    );
  }

  /// `No Employees yet`
  String get noEmployeesYet {
    return Intl.message(
      'No Employees yet',
      name: 'noEmployeesYet',
      desc: '',
      args: [],
    );
  }

  /// `Send offer`
  String get sendOffer {
    return Intl.message(
      'Send offer',
      name: 'sendOffer',
      desc: '',
      args: [],
    );
  }

  /// `Cashier`
  String get cashier {
    return Intl.message(
      'Cashier',
      name: 'cashier',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `No Sent Offers`
  String get noSentOffers {
    return Intl.message(
      'No Sent Offers',
      name: 'noSentOffers',
      desc: '',
      args: [],
    );
  }

  /// `Add Contact`
  String get addContact {
    return Intl.message(
      'Add Contact',
      name: 'addContact',
      desc: '',
      args: [],
    );
  }

  /// `Official name`
  String get officialName {
    return Intl.message(
      'Official name',
      name: 'officialName',
      desc: '',
      args: [],
    );
  }

  /// `Nick name`
  String get nickName {
    return Intl.message(
      'Nick name',
      name: 'nickName',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Add Institution`
  String get addInstitution {
    return Intl.message(
      'Add Institution',
      name: 'addInstitution',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Distribution`
  String get distribution {
    return Intl.message(
      'Distribution',
      name: 'distribution',
      desc: '',
      args: [],
    );
  }

  /// `Receipts`
  String get receipts {
    return Intl.message(
      'Receipts',
      name: 'receipts',
      desc: '',
      args: [],
    );
  }

  /// `You have no institutions`
  String get youHaveNoInstitutions {
    return Intl.message(
      'You have no institutions',
      name: 'youHaveNoInstitutions',
      desc: '',
      args: [],
    );
  }

  /// `Check internet connection`
  String get checkInternetConnection {
    return Intl.message(
      'Check internet connection',
      name: 'checkInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `No Institutions`
  String get noInstitutions {
    return Intl.message(
      'No Institutions',
      name: 'noInstitutions',
      desc: '',
      args: [],
    );
  }

  /// `Work institutions`
  String get workInstitutions {
    return Intl.message(
      'Work institutions',
      name: 'workInstitutions',
      desc: '',
      args: [],
    );
  }

  /// `No Items`
  String get noItems {
    return Intl.message(
      'No Items',
      name: 'noItems',
      desc: '',
      args: [],
    );
  }

  /// `Creation time`
  String get creationTime {
    return Intl.message(
      'Creation time',
      name: 'creationTime',
      desc: '',
      args: [],
    );
  }

  /// `Alphabetically`
  String get alphabetically {
    return Intl.message(
      'Alphabetically',
      name: 'alphabetically',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to\norder now ?`
  String get areYouSureYouWantTonorderNow {
    return Intl.message(
      'Are you sure you want to\norder now ?',
      name: 'areYouSureYouWantTonorderNow',
      desc: '',
      args: [],
    );
  }

  /// `Area exists before`
  String get areaExistsBefore {
    return Intl.message(
      'Area exists before',
      name: 'areaExistsBefore',
      desc: '',
      args: [],
    );
  }

  /// `Item name already exists`
  String get itemNameAlreadyExists {
    return Intl.message(
      'Item name already exists',
      name: 'itemNameAlreadyExists',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
