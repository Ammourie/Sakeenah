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

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Error Occured 😢`
  String get errorOccurred {
    return Intl.message(
      'Error Occured 😢',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `An error has been occurred, please click send to help us fixing the problem`
  String get reportError {
    return Intl.message(
      'An error has been occurred, please click send to help us fixing the problem',
      name: 'reportError',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get unauthorized {
    return Intl.message(
      'Unauthorized',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred. Please try again later`
  String get generalErrorMessage {
    return Intl.message(
      'An error has occurred. Please try again later',
      name: 'generalErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Bad Request`
  String get badRequest {
    return Intl.message('Bad Request', name: 'badRequest', desc: '', args: []);
  }

  /// `Forbidden`
  String get forbidden {
    return Intl.message('Forbidden', name: 'forbidden', desc: '', args: []);
  }

  /// `{url} not Found`
  String notFound(Object url) {
    return Intl.message(
      '$url not Found',
      name: 'notFound',
      desc: '',
      args: [url],
    );
  }

  /// `Conflict Error`
  String get conflictError {
    return Intl.message(
      'Conflict Error',
      name: 'conflictError',
      desc: '',
      args: [],
    );
  }

  /// `Not valid response`
  String get notValidResponse {
    return Intl.message(
      'Not valid response',
      name: 'notValidResponse',
      desc: '',
      args: [],
    );
  }

  /// `Connection time out`
  String get connectionTimeOut {
    return Intl.message(
      'Connection time out',
      name: 'connectionTimeOut',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occurred, please try again`
  String get unknownError {
    return Intl.message(
      'Unknown error occurred, please try again',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `The server encountered an internal error or misconfigurtion and was unable to complete your request.`
  String get internalServerErrorMessage {
    return Intl.message(
      'The server encountered an internal error or misconfigurtion and was unable to complete your request.',
      name: 'internalServerErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get connectionErrorMessage {
    return Intl.message(
      'Please check your internet connection',
      name: 'connectionErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `OOPS !`
  String get oopsErrorMessage {
    return Intl.message('OOPS !', name: 'oopsErrorMessage', desc: '', args: []);
  }

  /// `Failed to get data`
  String get failedRefresher {
    return Intl.message(
      'Failed to get data',
      name: 'failedRefresher',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noDataRefresher {
    return Intl.message('No data', name: 'noDataRefresher', desc: '', args: []);
  }

  /// `This field can't be empty`
  String get errorTxt {
    return Intl.message(
      'This field can\'t be empty',
      name: 'errorTxt',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logOut {
    return Intl.message('Logout', name: 'logOut', desc: '', args: []);
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Select language`
  String get selectLanguageTitle {
    return Intl.message(
      'Select language',
      name: 'selectLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select a language, the application will restart`
  String get changeLangMessage {
    return Intl.message(
      'Select a language, the application will restart',
      name: 'changeLangMessage',
      desc: '',
      args: [],
    );
  }

  /// `Choose appearance`
  String get selectThemeTitle {
    return Intl.message(
      'Choose appearance',
      name: 'selectThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pick light, dark, or follow your device setting`
  String get selectThemeMessage {
    return Intl.message(
      'Pick light, dark, or follow your device setting',
      name: 'selectThemeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get themeLight {
    return Intl.message('Light', name: 'themeLight', desc: '', args: []);
  }

  /// `Dark`
  String get themeDark {
    return Intl.message('Dark', name: 'themeDark', desc: '', args: []);
  }

  /// `System`
  String get themeSystem {
    return Intl.message('System', name: 'themeSystem', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Press twice to exit`
  String get pressTwiceToExit {
    return Intl.message(
      'Press twice to exit',
      name: 'pressTwiceToExit',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message('User name', name: 'userName', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Please enter a valid phone number ex: 09xx-xxx-xxx`
  String get invalidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number ex: 09xx-xxx-xxx',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 5 characters long`
  String get invalidPassword {
    return Intl.message(
      'Must be at least 5 characters long',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Close App`
  String get closeApp {
    return Intl.message('Close App', name: 'closeApp', desc: '', args: []);
  }

  /// `Update Required`
  String get updateTitle {
    return Intl.message(
      'Update Required',
      name: 'updateTitle',
      desc: '',
      args: [],
    );
  }

  /// `For the best experience, update to the latest version to get new features and improvements.`
  String get updateMessage {
    return Intl.message(
      'For the best experience, update to the latest version to get new features and improvements.',
      name: 'updateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message('Empty', name: 'empty', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `The page has no content ..`
  String get pageEmpty {
    return Intl.message(
      'The page has no content ..',
      name: 'pageEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `An error happened while connecting to server, please try again later`
  String get responseError {
    return Intl.message(
      'An error happened while connecting to server, please try again later',
      name: 'responseError',
      desc: '',
      args: [],
    );
  }

  /// `The connection has been interrupted`
  String get errorCancelToken {
    return Intl.message(
      'The connection has been interrupted',
      name: 'errorCancelToken',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signUp {
    return Intl.message('Signup', name: 'signUp', desc: '', args: []);
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Phone Number`
  String get phone {
    return Intl.message('Phone Number', name: 'phone', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password doesn't match`
  String get invalidConfirmPassword {
    return Intl.message(
      'Password and confirm password doesn\'t match',
      name: 'invalidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `This field mustn't be empty`
  String get errorEmptyField {
    return Intl.message(
      'This field mustn\'t be empty',
      name: 'errorEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `Switch theme`
  String get switchTheme {
    return Intl.message(
      'Switch theme',
      name: 'switchTheme',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get drawerPreferences {
    return Intl.message(
      'Preferences',
      name: 'drawerPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Account Not Verified`
  String get accountNotVerifiedErrorMessage {
    return Intl.message(
      'Account Not Verified',
      name: 'accountNotVerifiedErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Operation has been cancelled`
  String get cancelErrorMessage {
    return Intl.message(
      'Operation has been cancelled',
      name: 'cancelErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `login Error Required`
  String get loginErrorRequired {
    return Intl.message(
      'login Error Required',
      name: 'loginErrorRequired',
      desc: '',
      args: [],
    );
  }

  /// `This page is empty`
  String get emptyScreen {
    return Intl.message(
      'This page is empty',
      name: 'emptyScreen',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Couldn't find path`
  String get mapPathError {
    return Intl.message(
      'Couldn\'t find path',
      name: 'mapPathError',
      desc: '',
      args: [],
    );
  }

  /// `Could not fetch distance`
  String get errorFetchDistance {
    return Intl.message(
      'Could not fetch distance',
      name: 'errorFetchDistance',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otpVerification {
    return Intl.message(
      'OTP Verification',
      name: 'otpVerification',
      desc: '',
      args: [],
    );
  }

  /// `please type the verification code send to`
  String get enterCodeText {
    return Intl.message(
      'please type the verification code send to',
      name: 'enterCodeText',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `No Result Found`
  String get noResultFound {
    return Intl.message(
      'No Result Found',
      name: 'noResultFound',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Sorry, you are a guest, login to continue.`
  String get guetsMessage {
    return Intl.message(
      'Sorry, you are a guest, login to continue.',
      name: 'guetsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Update Required`
  String get dialogUpdateTitle {
    return Intl.message(
      'Update Required',
      name: 'dialogUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Update!`
  String get optionalUpdateTitle {
    return Intl.message(
      'New Update!',
      name: 'optionalUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `For the best experience, update to the latest version to get new features and improvements.`
  String get dialogUpdateMessage {
    return Intl.message(
      'For the best experience, update to the latest version to get new features and improvements.',
      name: 'dialogUpdateMessage',
      desc: '',
      args: [],
    );
  }

  /// `There is a new version for this app. Update to get new features and improvements`
  String get optionalUpdateMessage {
    return Intl.message(
      'There is a new version for this app. Update to get new features and improvements',
      name: 'optionalUpdateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ignore`
  String get ignoreForNow {
    return Intl.message('Ignore', name: 'ignoreForNow', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Access Denied!`
  String get accessDenied {
    return Intl.message(
      'Access Denied!',
      name: 'accessDenied',
      desc: '',
      args: [],
    );
  }

  /// `{permissionName} permission required!`
  String specificPermissionRequired(Object permissionName) {
    return Intl.message(
      '$permissionName permission required!',
      name: 'specificPermissionRequired',
      desc: '',
      args: [permissionName],
    );
  }

  /// `Make sure {permissionName} permission is granted to be able to use the app.`
  String makeSureSpecificPermissionGranted(Object permissionName) {
    return Intl.message(
      'Make sure $permissionName permission is granted to be able to use the app.',
      name: 'makeSureSpecificPermissionGranted',
      desc: '',
      args: [permissionName],
    );
  }

  /// `Try enabling it from your phone settings`
  String get tryEnablingItFromYourPhoneSettings {
    return Intl.message(
      'Try enabling it from your phone settings',
      name: 'tryEnablingItFromYourPhoneSettings',
      desc: '',
      args: [],
    );
  }

  /// `Open App Settings`
  String get openAppSettings {
    return Intl.message(
      'Open App Settings',
      name: 'openAppSettings',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get locationPermission {
    return Intl.message(
      'Location',
      name: 'locationPermission',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get cameraPermission {
    return Intl.message('Camera', name: 'cameraPermission', desc: '', args: []);
  }

  /// `The previous permission is required!`
  String get permissionRequiredTitle {
    return Intl.message(
      'The previous permission is required!',
      name: 'permissionRequiredTitle',
      desc: '',
      args: [],
    );
  }

  /// `make sure to grant the previous permission to be able to use the app.`
  String get permissionRequiredMessage {
    return Intl.message(
      'make sure to grant the previous permission to be able to use the app.',
      name: 'permissionRequiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Didn't you receive any code?`
  String get didnotReceiveAnyCode {
    return Intl.message(
      'Didn\'t you receive any code?',
      name: 'didnotReceiveAnyCode',
      desc: '',
      args: [],
    );
  }

  /// `Faild to fetch data`
  String get faildToFetchData {
    return Intl.message(
      'Faild to fetch data',
      name: 'faildToFetchData',
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

  /// `No notifications yet`
  String get noNotifications {
    return Intl.message(
      'No notifications yet',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for reporting`
  String get thankYouForReporting {
    return Intl.message(
      'Thank you for reporting',
      name: 'thankYouForReporting',
      desc: '',
      args: [],
    );
  }

  /// `The connection to the server was closed.`
  String get connectionToServerClosed {
    return Intl.message(
      'The connection to the server was closed.',
      name: 'connectionToServerClosed',
      desc: '',
      args: [],
    );
  }

  /// `Failed connect to server.`
  String get connectionToServerFaild {
    return Intl.message(
      'Failed connect to server.',
      name: 'connectionToServerFaild',
      desc: '',
      args: [],
    );
  }

  /// `User doesn't exist`
  String get userDoesNotExist {
    return Intl.message(
      'User doesn\'t exist',
      name: 'userDoesNotExist',
      desc: '',
      args: [],
    );
  }

  /// `Code resent`
  String get codeResent {
    return Intl.message('Code resent', name: 'codeResent', desc: '', args: []);
  }

  /// `Please Enter the code sent to {number}`
  String otpText(Object number) {
    return Intl.message(
      'Please Enter the code sent to $number',
      name: 'otpText',
      desc: '',
      args: [number],
    );
  }

  /// `Updated Successfully`
  String get updatedSuccessfully {
    return Intl.message(
      'Updated Successfully',
      name: 'updatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `There are no messages to display.`
  String get thereAreNoMessagesToDisplay {
    return Intl.message(
      'There are no messages to display.',
      name: 'thereAreNoMessagesToDisplay',
      desc: '',
      args: [],
    );
  }

  /// `Create a connection to the server`
  String get createConnectionToTheServer {
    return Intl.message(
      'Create a connection to the server',
      name: 'createConnectionToTheServer',
      desc: '',
      args: [],
    );
  }

  /// `Loading your messages`
  String get loadingYourMessages {
    return Intl.message(
      'Loading your messages',
      name: 'loadingYourMessages',
      desc: '',
      args: [],
    );
  }

  /// `Type your message here`
  String get typeYourMessageHere {
    return Intl.message(
      'Type your message here',
      name: 'typeYourMessageHere',
      desc: '',
      args: [],
    );
  }

  /// `Chat List`
  String get chatList {
    return Intl.message('Chat List', name: 'chatList', desc: '', args: []);
  }

  /// `Customer support`
  String get customerSupport {
    return Intl.message(
      'Customer support',
      name: 'customerSupport',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `PDF file`
  String get pdfFile {
    return Intl.message('PDF file', name: 'pdfFile', desc: '', args: []);
  }

  /// `Video`
  String get video {
    return Intl.message('Video', name: 'video', desc: '', args: []);
  }

  /// `Audio`
  String get audio {
    return Intl.message('Audio', name: 'audio', desc: '', args: []);
  }

  /// `Word file`
  String get wordFile {
    return Intl.message('Word file', name: 'wordFile', desc: '', args: []);
  }

  /// `An error occurred while displaying the video`
  String get anErrorOccurredWhileDisplayingTheVideo {
    return Intl.message(
      'An error occurred while displaying the video',
      name: 'anErrorOccurredWhileDisplayingTheVideo',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while displaying the aduio`
  String get anErrorOccurredWhileDisplayingTheAudio {
    return Intl.message(
      'An error occurred while displaying the aduio',
      name: 'anErrorOccurredWhileDisplayingTheAudio',
      desc: '',
      args: [],
    );
  }

  /// `Home Page`
  String get homePage {
    return Intl.message('Home Page', name: 'homePage', desc: '', args: []);
  }

  /// `Translation Test`
  String get translationTest {
    return Intl.message(
      'Translation Test',
      name: 'translationTest',
      desc: '',
      args: [],
    );
  }

  /// `Just Log`
  String get justLog {
    return Intl.message('Just Log', name: 'justLog', desc: '', args: []);
  }

  /// `Test Success Request`
  String get testSuccessRequest {
    return Intl.message(
      'Test Success Request',
      name: 'testSuccessRequest',
      desc: '',
      args: [],
    );
  }

  /// `Test Failure Request`
  String get testFailureRequest {
    return Intl.message(
      'Test Failure Request',
      name: 'testFailureRequest',
      desc: '',
      args: [],
    );
  }

  /// `Test Validator Request`
  String get testValidatorRequest {
    return Intl.message(
      'Test Validator Request',
      name: 'testValidatorRequest',
      desc: '',
      args: [],
    );
  }

  /// `Get People`
  String get getPeople {
    return Intl.message('Get People', name: 'getPeople', desc: '', args: []);
  }

  /// `Get Pokemons`
  String get getPokemons {
    return Intl.message(
      'Get Pokemons',
      name: 'getPokemons',
      desc: '',
      args: [],
    );
  }

  /// `Test Error Handler`
  String get testErrorScreen {
    return Intl.message(
      'Test Error Handler',
      name: 'testErrorScreen',
      desc: '',
      args: [],
    );
  }

  /// `Internet not available`
  String get internetNotAvailable {
    return Intl.message(
      'Internet not available',
      name: 'internetNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Sakeenah`
  String get appName {
    return Intl.message('Sakeenah', name: 'appName', desc: '', args: []);
  }

  /// `Prayer Times`
  String get prayerTimesTitle {
    return Intl.message(
      'Prayer Times',
      name: 'prayerTimesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Fajr`
  String get prayerFajr {
    return Intl.message('Fajr', name: 'prayerFajr', desc: '', args: []);
  }

  /// `Dhuhr`
  String get prayerDhuhr {
    return Intl.message('Dhuhr', name: 'prayerDhuhr', desc: '', args: []);
  }

  /// `Asr`
  String get prayerAsr {
    return Intl.message('Asr', name: 'prayerAsr', desc: '', args: []);
  }

  /// `Maghrib`
  String get prayerMaghrib {
    return Intl.message('Maghrib', name: 'prayerMaghrib', desc: '', args: []);
  }

  /// `Isha`
  String get prayerIsha {
    return Intl.message('Isha', name: 'prayerIsha', desc: '', args: []);
  }

  /// `Next is {prayer} after {time}`
  String nextPrayerIn(String prayer, String time) {
    return Intl.message(
      'Next is $prayer after $time',
      name: 'nextPrayerIn',
      desc: '',
      args: [prayer, time],
    );
  }

  /// `hour`
  String get durationHourUnitOne {
    return Intl.message(
      'hour',
      name: 'durationHourUnitOne',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get durationHourUnitOther {
    return Intl.message(
      'hours',
      name: 'durationHourUnitOther',
      desc: '',
      args: [],
    );
  }

  /// `minute`
  String get durationMinuteUnitOne {
    return Intl.message(
      'minute',
      name: 'durationMinuteUnitOne',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get durationMinuteUnitOther {
    return Intl.message(
      'minutes',
      name: 'durationMinuteUnitOther',
      desc: '',
      args: [],
    );
  }

  /// `Showing saved times`
  String get cachedPrayerTimes {
    return Intl.message(
      'Showing saved times',
      name: 'cachedPrayerTimes',
      desc: '',
      args: [],
    );
  }

  /// `Set your location`
  String get setLocationTitle {
    return Intl.message(
      'Set your location',
      name: 'setLocationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Move the map and place the pin on your area.`
  String get setLocationMessage {
    return Intl.message(
      'Move the map and place the pin on your area.',
      name: 'setLocationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Pick on map`
  String get pickLocationOnMapTitle {
    return Intl.message(
      'Pick on map',
      name: 'pickLocationOnMapTitle',
      desc: '',
      args: [],
    );
  }

  /// `Drag the map so the pin sits on your city or area, then confirm.`
  String get pickLocationOnMapMessage {
    return Intl.message(
      'Drag the map so the pin sits on your city or area, then confirm.',
      name: 'pickLocationOnMapMessage',
      desc: '',
      args: [],
    );
  }

  /// `Confirm location`
  String get confirmMapLocation {
    return Intl.message(
      'Confirm location',
      name: 'confirmMapLocation',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get cityHint {
    return Intl.message('City', name: 'cityHint', desc: '', args: []);
  }

  /// `Country`
  String get countryHint {
    return Intl.message('Country', name: 'countryHint', desc: '', args: []);
  }

  /// `Use GPS instead`
  String get useGpsLocation {
    return Intl.message(
      'Use GPS instead',
      name: 'useGpsLocation',
      desc: '',
      args: [],
    );
  }

  /// `Go to my location`
  String get goToMyLocation {
    return Intl.message(
      'Go to my location',
      name: 'goToMyLocation',
      desc: '',
      args: [],
    );
  }

  /// `Turn on location`
  String get locationServiceDisabledTitle {
    return Intl.message(
      'Turn on location',
      name: 'locationServiceDisabledTitle',
      desc: '',
      args: [],
    );
  }

  /// `Location services (GPS) are off. Enable them in your device settings so we can find your position.`
  String get locationServiceDisabledMessage {
    return Intl.message(
      'Location services (GPS) are off. Enable them in your device settings so we can find your position.',
      name: 'locationServiceDisabledMessage',
      desc: '',
      args: [],
    );
  }

  /// `Open location settings`
  String get openLocationSettings {
    return Intl.message(
      'Open location settings',
      name: 'openLocationSettings',
      desc: '',
      args: [],
    );
  }

  /// `Save location`
  String get saveLocation {
    return Intl.message(
      'Save location',
      name: 'saveLocation',
      desc: '',
      args: [],
    );
  }

  /// `Change location`
  String get changeLocation {
    return Intl.message(
      'Change location',
      name: 'changeLocation',
      desc: '',
      args: [],
    );
  }

  /// `We need your location to show prayer times.`
  String get noLocationMessage {
    return Intl.message(
      'We need your location to show prayer times.',
      name: 'noLocationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Location: {label}`
  String prayerLocationLabel(String label) {
    return Intl.message(
      'Location: $label',
      name: 'prayerLocationLabel',
      desc: '',
      args: [label],
    );
  }

  /// `Your area`
  String get locationAreaFallback {
    return Intl.message(
      'Your area',
      name: 'locationAreaFallback',
      desc: '',
      args: [],
    );
  }

  /// `Debug menu`
  String get debugMenuTooltip {
    return Intl.message(
      'Debug menu',
      name: 'debugMenuTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Clear all cached requests`
  String get debugClearCachedRequests {
    return Intl.message(
      'Clear all cached requests',
      name: 'debugClearCachedRequests',
      desc: '',
      args: [],
    );
  }

  /// `Cached requests cleared`
  String get debugCacheCleared {
    return Intl.message(
      'Cached requests cleared',
      name: 'debugCacheCleared',
      desc: '',
      args: [],
    );
  }

  /// `Reset first-time preferences`
  String get debugClearFirstStartPreferences {
    return Intl.message(
      'Reset first-time preferences',
      name: 'debugClearFirstStartPreferences',
      desc: '',
      args: [],
    );
  }

  /// `First-time preferences reset`
  String get debugFirstStartPreferencesCleared {
    return Intl.message(
      'First-time preferences reset',
      name: 'debugFirstStartPreferencesCleared',
      desc: '',
      args: [],
    );
  }

  /// `Loading your address`
  String get loadingYourAddress {
    return Intl.message(
      'Loading your address',
      name: 'loadingYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get location`
  String get errorGettingLocation {
    return Intl.message(
      'Failed to get location',
      name: 'errorGettingLocation',
      desc: '',
      args: [],
    );
  }

  /// `Choose how you want to set your location for prayer times.`
  String get locationSourceChooserMessage {
    return Intl.message(
      'Choose how you want to set your location for prayer times.',
      name: 'locationSourceChooserMessage',
      desc: '',
      args: [],
    );
  }

  /// `Pick from map`
  String get pickFromMap {
    return Intl.message(
      'Pick from map',
      name: 'pickFromMap',
      desc: '',
      args: [],
    );
  }

  /// `Drag the map and pin your area.`
  String get pickFromMapDescription {
    return Intl.message(
      'Drag the map and pin your area.',
      name: 'pickFromMapDescription',
      desc: '',
      args: [],
    );
  }

  /// `Country / city picker`
  String get countryCityPicker {
    return Intl.message(
      'Country / city picker',
      name: 'countryCityPicker',
      desc: '',
      args: [],
    );
  }

  /// `Choose your country and city from a list.`
  String get countryCityPickerDescription {
    return Intl.message(
      'Choose your country and city from a list.',
      name: 'countryCityPickerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Choose country & city`
  String get countryCityPickerTitle {
    return Intl.message(
      'Choose country & city',
      name: 'countryCityPickerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pick country and city from the list, or enter your full address including country.`
  String get countryCityPickerMessage {
    return Intl.message(
      'Pick country and city from the list, or enter your full address including country.',
      name: 'countryCityPickerMessage',
      desc: '',
      args: [],
    );
  }

  /// `Select a country`
  String get selectCountryHint {
    return Intl.message(
      'Select a country',
      name: 'selectCountryHint',
      desc: '',
      args: [],
    );
  }

  /// `Select a city`
  String get selectCityHint {
    return Intl.message(
      'Select a city',
      name: 'selectCityHint',
      desc: '',
      args: [],
    );
  }

  /// `Select a country first`
  String get selectCountryFirstHint {
    return Intl.message(
      'Select a country first',
      name: 'selectCountryFirstHint',
      desc: '',
      args: [],
    );
  }

  /// `How to set location`
  String get cityInputModeLabel {
    return Intl.message(
      'How to set location',
      name: 'cityInputModeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Country & city`
  String get cityInputModePicker {
    return Intl.message(
      'Country & city',
      name: 'cityInputModePicker',
      desc: '',
      args: [],
    );
  }

  /// `Full address`
  String get cityInputModeManual {
    return Intl.message(
      'Full address',
      name: 'cityInputModeManual',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get addressHint {
    return Intl.message('Address', name: 'addressHint', desc: '', args: []);
  }

  /// `Street, city, country…`
  String get enterAddressManuallyHint {
    return Intl.message(
      'Street, city, country…',
      name: 'enterAddressManuallyHint',
      desc: '',
      args: [],
    );
  }

  /// `Quran Radio`
  String get quranRadioTitle {
    return Intl.message(
      'Quran Radio',
      name: 'quranRadioTitle',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get quranRadioPlay {
    return Intl.message('Play', name: 'quranRadioPlay', desc: '', args: []);
  }

  /// `Paused`
  String get quranRadioPause {
    return Intl.message('Paused', name: 'quranRadioPause', desc: '', args: []);
  }

  /// `Connecting…`
  String get quranRadioConnecting {
    return Intl.message(
      'Connecting…',
      name: 'quranRadioConnecting',
      desc: '',
      args: [],
    );
  }

  /// `Unable to play the stream`
  String get quranRadioError {
    return Intl.message(
      'Unable to play the stream',
      name: 'quranRadioError',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get quranRadioOfflineError {
    return Intl.message(
      'No internet connection',
      name: 'quranRadioOfflineError',
      desc: '',
      args: [],
    );
  }

  /// `Check your connection and try again`
  String get quranRadioErrorHint {
    return Intl.message(
      'Check your connection and try again',
      name: 'quranRadioErrorHint',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get quranRadioRetry {
    return Intl.message('Retry', name: 'quranRadioRetry', desc: '', args: []);
  }

  /// `Volume`
  String get quranRadioVolume {
    return Intl.message('Volume', name: 'quranRadioVolume', desc: '', args: []);
  }

  /// `Mute`
  String get quranRadioMute {
    return Intl.message('Mute', name: 'quranRadioMute', desc: '', args: []);
  }

  /// `Unmute`
  String get quranRadioUnmute {
    return Intl.message('Unmute', name: 'quranRadioUnmute', desc: '', args: []);
  }

  /// `Skip back 10 seconds`
  String get quranRadioSkipBackward {
    return Intl.message(
      'Skip back 10 seconds',
      name: 'quranRadioSkipBackward',
      desc: '',
      args: [],
    );
  }

  /// `Skip forward 10 seconds`
  String get quranRadioSkipForward {
    return Intl.message(
      'Skip forward 10 seconds',
      name: 'quranRadioSkipForward',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get quranRadioStop {
    return Intl.message('Stop', name: 'quranRadioStop', desc: '', args: []);
  }

  /// `Live`
  String get quranRadioLive {
    return Intl.message('Live', name: 'quranRadioLive', desc: '', args: []);
  }

  /// `Start the live Quran stream`
  String get quranRadioIdleHint {
    return Intl.message(
      'Start the live Quran stream',
      name: 'quranRadioIdleHint',
      desc: '',
      args: [],
    );
  }

  /// `Buffering stream…`
  String get quranRadioBufferLoading {
    return Intl.message(
      'Buffering stream…',
      name: 'quranRadioBufferLoading',
      desc: '',
      args: [],
    );
  }

  /// `{position} / {buffered}`
  String quranRadioBufferProgress(String position, String buffered) {
    return Intl.message(
      '$position / $buffered',
      name: 'quranRadioBufferProgress',
      desc: '',
      args: [position, buffered],
    );
  }

  /// `Quran Radio`
  String get quranRadioNotificationChannelName {
    return Intl.message(
      'Quran Radio',
      name: 'quranRadioNotificationChannelName',
      desc: '',
      args: [],
    );
  }

  /// `Live Quran radio playback controls`
  String get quranRadioNotificationChannelDescription {
    return Intl.message(
      'Live Quran radio playback controls',
      name: 'quranRadioNotificationChannelDescription',
      desc: '',
      args: [],
    );
  }

  /// `h`
  String get hoursShort {
    return Intl.message('h', name: 'hoursShort', desc: '', args: []);
  }

  /// `m`
  String get minutesShort {
    return Intl.message('m', name: 'minutesShort', desc: '', args: []);
  }

  /// `s`
  String get secondsShort {
    return Intl.message('s', name: 'secondsShort', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
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
  Future<S> load(Locale locale) => S.load(locale);
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
