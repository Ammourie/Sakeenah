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

  static String m0(permissionName) =>
      "Make sure ${permissionName} permission is granted to be able to use the app.";

  static String m1(prayer, time) => "Next is ${prayer} after ${time}";

  static String m2(url) => "${url} not Found";

  static String m3(number) => "Please Enter the code sent to ${number}";

  static String m4(label) => "Location: ${label}";

  static String m5(permissionName) => "${permissionName} permission required!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accessDenied": MessageLookupByLibrary.simpleMessage("Access Denied!"),
    "accountNotVerifiedErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Account Not Verified",
    ),
    "anErrorOccurredWhileDisplayingTheAudio":
        MessageLookupByLibrary.simpleMessage(
          "An error occurred while displaying the aduio",
        ),
    "anErrorOccurredWhileDisplayingTheVideo":
        MessageLookupByLibrary.simpleMessage(
          "An error occurred while displaying the video",
        ),
    "appName": MessageLookupByLibrary.simpleMessage("Sakeenah"),
    "apply": MessageLookupByLibrary.simpleMessage("Apply"),
    "audio": MessageLookupByLibrary.simpleMessage("Audio"),
    "badRequest": MessageLookupByLibrary.simpleMessage("Bad Request"),
    "cachedPrayerTimes": MessageLookupByLibrary.simpleMessage(
      "Showing saved times",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("Camera"),
    "cameraPermission": MessageLookupByLibrary.simpleMessage("Camera"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Operation has been cancelled",
    ),
    "changeLangMessage": MessageLookupByLibrary.simpleMessage(
      "Select a language, the application will restart",
    ),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("Change Language"),
    "changeLocation": MessageLookupByLibrary.simpleMessage("Change location"),
    "chatList": MessageLookupByLibrary.simpleMessage("Chat List"),
    "cityHint": MessageLookupByLibrary.simpleMessage("City"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "closeApp": MessageLookupByLibrary.simpleMessage("Close App"),
    "codeResent": MessageLookupByLibrary.simpleMessage("Code resent"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmMapLocation": MessageLookupByLibrary.simpleMessage(
      "Confirm location",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "conflictError": MessageLookupByLibrary.simpleMessage("Conflict Error"),
    "connectionErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Please check your internet connection",
    ),
    "connectionTimeOut": MessageLookupByLibrary.simpleMessage(
      "Connection time out",
    ),
    "connectionToServerClosed": MessageLookupByLibrary.simpleMessage(
      "The connection to the server was closed.",
    ),
    "connectionToServerFaild": MessageLookupByLibrary.simpleMessage(
      "Failed connect to server.",
    ),
    "countryHint": MessageLookupByLibrary.simpleMessage("Country"),
    "createConnectionToTheServer": MessageLookupByLibrary.simpleMessage(
      "Create a connection to the server",
    ),
    "customerSupport": MessageLookupByLibrary.simpleMessage("Customer support"),
    "debugCacheCleared": MessageLookupByLibrary.simpleMessage(
      "Cached requests cleared",
    ),
    "debugClearCachedRequests": MessageLookupByLibrary.simpleMessage(
      "Clear all cached requests",
    ),
    "debugClearFirstStartPreferences": MessageLookupByLibrary.simpleMessage(
      "Reset first-time preferences",
    ),
    "debugFirstStartPreferencesCleared": MessageLookupByLibrary.simpleMessage(
      "First-time preferences reset",
    ),
    "debugMenuTooltip": MessageLookupByLibrary.simpleMessage("Debug menu"),
    "dialogUpdateMessage": MessageLookupByLibrary.simpleMessage(
      "For the best experience, update to the latest version to get new features and improvements.",
    ),
    "dialogUpdateTitle": MessageLookupByLibrary.simpleMessage(
      "Update Required",
    ),
    "didnotReceiveAnyCode": MessageLookupByLibrary.simpleMessage(
      "Didn\'t you receive any code?",
    ),
    "drawerPreferences": MessageLookupByLibrary.simpleMessage("Preferences"),
    "durationHourUnitOne": MessageLookupByLibrary.simpleMessage("hour"),
    "durationHourUnitOther": MessageLookupByLibrary.simpleMessage("hours"),
    "durationMinuteUnitOne": MessageLookupByLibrary.simpleMessage("minute"),
    "durationMinuteUnitOther": MessageLookupByLibrary.simpleMessage("minutes"),
    "empty": MessageLookupByLibrary.simpleMessage("Empty"),
    "emptyScreen": MessageLookupByLibrary.simpleMessage("This page is empty"),
    "enterCodeText": MessageLookupByLibrary.simpleMessage(
      "please type the verification code send to",
    ),
    "errorCancelToken": MessageLookupByLibrary.simpleMessage(
      "The connection has been interrupted",
    ),
    "errorEmptyField": MessageLookupByLibrary.simpleMessage(
      "This field mustn\'t be empty",
    ),
    "errorFetchDistance": MessageLookupByLibrary.simpleMessage(
      "Could not fetch distance",
    ),
    "errorGettingLocation": MessageLookupByLibrary.simpleMessage(
      "Failed to get location",
    ),
    "errorOccurred": MessageLookupByLibrary.simpleMessage("Error Occured 😢"),
    "errorTxt": MessageLookupByLibrary.simpleMessage(
      "This field can\'t be empty",
    ),
    "faildToFetchData": MessageLookupByLibrary.simpleMessage(
      "Faild to fetch data",
    ),
    "failedRefresher": MessageLookupByLibrary.simpleMessage(
      "Failed to get data",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
    "forbidden": MessageLookupByLibrary.simpleMessage("Forbidden"),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "generalErrorMessage": MessageLookupByLibrary.simpleMessage(
      "An error has occurred. Please try again later",
    ),
    "getPeople": MessageLookupByLibrary.simpleMessage("Get People"),
    "getPokemons": MessageLookupByLibrary.simpleMessage("Get Pokemons"),
    "goToMyLocation": MessageLookupByLibrary.simpleMessage("Go to my location"),
    "guetsMessage": MessageLookupByLibrary.simpleMessage(
      "Sorry, you are a guest, login to continue.",
    ),
    "homePage": MessageLookupByLibrary.simpleMessage("Home Page"),
    "ignoreForNow": MessageLookupByLibrary.simpleMessage("Ignore"),
    "internalServerErrorMessage": MessageLookupByLibrary.simpleMessage(
      "The server encountered an internal error or misconfigurtion and was unable to complete your request.",
    ),
    "internetNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Internet not available",
    ),
    "invalidConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "Password and confirm password doesn\'t match",
    ),
    "invalidPassword": MessageLookupByLibrary.simpleMessage(
      "Must be at least 5 characters long",
    ),
    "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid phone number ex: 09xx-xxx-xxx",
    ),
    "justLog": MessageLookupByLibrary.simpleMessage("Just Log"),
    "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
    "loadingYourAddress": MessageLookupByLibrary.simpleMessage(
      "Loading your address",
    ),
    "loadingYourMessages": MessageLookupByLibrary.simpleMessage(
      "Loading your messages",
    ),
    "locationAreaFallback": MessageLookupByLibrary.simpleMessage("Your area"),
    "locationPermission": MessageLookupByLibrary.simpleMessage("Location"),
    "locationServiceDisabledMessage": MessageLookupByLibrary.simpleMessage(
      "Location services (GPS) are off. Enable them in your device settings so we can find your position.",
    ),
    "locationServiceDisabledTitle": MessageLookupByLibrary.simpleMessage(
      "Turn on location",
    ),
    "logOut": MessageLookupByLibrary.simpleMessage("Logout"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginErrorRequired": MessageLookupByLibrary.simpleMessage(
      "login Error Required",
    ),
    "makeSureSpecificPermissionGranted": m0,
    "mapPathError": MessageLookupByLibrary.simpleMessage("Couldn\'t find path"),
    "nextPrayerIn": m1,
    "noDataRefresher": MessageLookupByLibrary.simpleMessage("No data"),
    "noLocationMessage": MessageLookupByLibrary.simpleMessage(
      "We need your location to show prayer times.",
    ),
    "noNotifications": MessageLookupByLibrary.simpleMessage(
      "No notifications yet",
    ),
    "noResultFound": MessageLookupByLibrary.simpleMessage("No Result Found"),
    "notFound": m2,
    "notValidResponse": MessageLookupByLibrary.simpleMessage(
      "Not valid response",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "oopsErrorMessage": MessageLookupByLibrary.simpleMessage("OOPS !"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Open App Settings",
    ),
    "openLocationSettings": MessageLookupByLibrary.simpleMessage(
      "Open location settings",
    ),
    "optionalUpdateMessage": MessageLookupByLibrary.simpleMessage(
      "There is a new version for this app. Update to get new features and improvements",
    ),
    "optionalUpdateTitle": MessageLookupByLibrary.simpleMessage("New Update!"),
    "or": MessageLookupByLibrary.simpleMessage("Or"),
    "otpText": m3,
    "otpVerification": MessageLookupByLibrary.simpleMessage("OTP Verification"),
    "pageEmpty": MessageLookupByLibrary.simpleMessage(
      "The page has no content ..",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "pdfFile": MessageLookupByLibrary.simpleMessage("PDF file"),
    "permissionRequiredMessage": MessageLookupByLibrary.simpleMessage(
      "make sure to grant the previous permission to be able to use the app.",
    ),
    "permissionRequiredTitle": MessageLookupByLibrary.simpleMessage(
      "The previous permission is required!",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "pickLocationOnMapMessage": MessageLookupByLibrary.simpleMessage(
      "Drag the map so the pin sits on your city or area, then confirm.",
    ),
    "pickLocationOnMapTitle": MessageLookupByLibrary.simpleMessage(
      "Pick on map",
    ),
    "prayerAsr": MessageLookupByLibrary.simpleMessage("Asr"),
    "prayerDhuhr": MessageLookupByLibrary.simpleMessage("Dhuhr"),
    "prayerFajr": MessageLookupByLibrary.simpleMessage("Fajr"),
    "prayerIsha": MessageLookupByLibrary.simpleMessage("Isha"),
    "prayerLocationLabel": m4,
    "prayerMaghrib": MessageLookupByLibrary.simpleMessage("Maghrib"),
    "prayerTimesTitle": MessageLookupByLibrary.simpleMessage("Prayer Times"),
    "pressTwiceToExit": MessageLookupByLibrary.simpleMessage(
      "Press twice to exit",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "reportError": MessageLookupByLibrary.simpleMessage(
      "An error has been occurred, please click send to help us fixing the problem",
    ),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "responseError": MessageLookupByLibrary.simpleMessage(
      "An error happened while connecting to server, please try again later",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "saveLocation": MessageLookupByLibrary.simpleMessage("Save location"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "selectLanguageTitle": MessageLookupByLibrary.simpleMessage(
      "Select language",
    ),
    "selectThemeMessage": MessageLookupByLibrary.simpleMessage(
      "Pick light, dark, or follow your device setting",
    ),
    "selectThemeTitle": MessageLookupByLibrary.simpleMessage(
      "Choose appearance",
    ),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "setLocationMessage": MessageLookupByLibrary.simpleMessage(
      "Move the map and place the pin on your area.",
    ),
    "setLocationTitle": MessageLookupByLibrary.simpleMessage(
      "Set your location",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("Signup"),
    "specificPermissionRequired": m5,
    "switchTheme": MessageLookupByLibrary.simpleMessage("Switch theme"),
    "testErrorScreen": MessageLookupByLibrary.simpleMessage(
      "Test Error Handler",
    ),
    "testFailureRequest": MessageLookupByLibrary.simpleMessage(
      "Test Failure Request",
    ),
    "testSuccessRequest": MessageLookupByLibrary.simpleMessage(
      "Test Success Request",
    ),
    "testValidatorRequest": MessageLookupByLibrary.simpleMessage(
      "Test Validator Request",
    ),
    "thankYouForReporting": MessageLookupByLibrary.simpleMessage(
      "Thank you for reporting",
    ),
    "themeDark": MessageLookupByLibrary.simpleMessage("Dark"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Light"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("System"),
    "thereAreNoMessagesToDisplay": MessageLookupByLibrary.simpleMessage(
      "There are no messages to display.",
    ),
    "translationTest": MessageLookupByLibrary.simpleMessage("Translation Test"),
    "tryEnablingItFromYourPhoneSettings": MessageLookupByLibrary.simpleMessage(
      "Try enabling it from your phone settings",
    ),
    "typeYourMessageHere": MessageLookupByLibrary.simpleMessage(
      "Type your message here",
    ),
    "unauthorized": MessageLookupByLibrary.simpleMessage("Unauthorized"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Unknown error occurred, please try again",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateMessage": MessageLookupByLibrary.simpleMessage(
      "For the best experience, update to the latest version to get new features and improvements.",
    ),
    "updateTitle": MessageLookupByLibrary.simpleMessage("Update Required"),
    "updatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Updated Successfully",
    ),
    "useGpsLocation": MessageLookupByLibrary.simpleMessage("Use GPS instead"),
    "userDoesNotExist": MessageLookupByLibrary.simpleMessage(
      "User doesn\'t exist",
    ),
    "userName": MessageLookupByLibrary.simpleMessage("User name"),
    "video": MessageLookupByLibrary.simpleMessage("Video"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
    "wordFile": MessageLookupByLibrary.simpleMessage("Word file"),
  };
}
