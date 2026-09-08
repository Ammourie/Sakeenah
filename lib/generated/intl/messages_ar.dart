// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(permissionName) =>
      "لاستخدام التطبيق يجب التأكد من إعطاء صلاحية الوصول للموقع.";

  static String m1(prayer, time) => "التالية ${prayer} بعد ${time}";

  static String m2(url) => "لم يتم إيجاد الصفحة المطلوبة ${url}";

  static String m3(number) => "الرجاء إدخال الرمز المرسل إلى ${number}";

  static String m4(label) => "الموقع: ${label}";

  static String m5(position, buffered) => "${position} / ${buffered}";

  static String m6(permissionName) =>
      "صلاحية الوصول لل${permissionName} مطلوبة!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accessDenied": MessageLookupByLibrary.simpleMessage("تم رفض الوصول!"),
    "accountNotVerifiedErrorMessage": MessageLookupByLibrary.simpleMessage(
      "لم يتم التحقق من الحساب",
    ),
    "addressHint": MessageLookupByLibrary.simpleMessage("العنوان"),
    "anErrorOccurredWhileDisplayingTheAudio":
        MessageLookupByLibrary.simpleMessage("حدث خطأ في عرض الصوت"),
    "anErrorOccurredWhileDisplayingTheVideo":
        MessageLookupByLibrary.simpleMessage("حدث خطأ في عرض الفيديو"),
    "appName": MessageLookupByLibrary.simpleMessage("سكينة"),
    "apply": MessageLookupByLibrary.simpleMessage("تغيير"),
    "audio": MessageLookupByLibrary.simpleMessage("صوت"),
    "badRequest": MessageLookupByLibrary.simpleMessage("إرسال خاطئ"),
    "cachedPrayerTimes": MessageLookupByLibrary.simpleMessage(
      "عرض الأوقات المحفوظة",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("كاميرا"),
    "cameraPermission": MessageLookupByLibrary.simpleMessage("كاميرا"),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "cancelErrorMessage": MessageLookupByLibrary.simpleMessage(
      "تم إلغاء العملية",
    ),
    "changeLangMessage": MessageLookupByLibrary.simpleMessage(
      "اختر اللغة، ستتم إعادة تشغيل التطبيق",
    ),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
    "changeLocation": MessageLookupByLibrary.simpleMessage("تغيير الموقع"),
    "chatList": MessageLookupByLibrary.simpleMessage("قائمة المحادثات"),
    "cityHint": MessageLookupByLibrary.simpleMessage("المدينة"),
    "cityInputModeLabel": MessageLookupByLibrary.simpleMessage(
      "طريقة تحديد الموقع",
    ),
    "cityInputModeManual": MessageLookupByLibrary.simpleMessage(
      "العنوان الكامل",
    ),
    "cityInputModePicker": MessageLookupByLibrary.simpleMessage(
      "البلد والمدينة",
    ),
    "close": MessageLookupByLibrary.simpleMessage("إغلاق"),
    "closeApp": MessageLookupByLibrary.simpleMessage("إغلاق التطبيق"),
    "codeResent": MessageLookupByLibrary.simpleMessage("تم إعادة إرسال الرمز"),
    "confirm": MessageLookupByLibrary.simpleMessage("تأكيد"),
    "confirmMapLocation": MessageLookupByLibrary.simpleMessage("تأكيد الموقع"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور",
    ),
    "conflictError": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ في المعلومات",
    ),
    "connectionErrorMessage": MessageLookupByLibrary.simpleMessage(
      "يرجى التحقق من الاتصال بالإنترنت",
    ),
    "connectionTimeOut": MessageLookupByLibrary.simpleMessage(
      "انتهت مدة الجلسة",
    ),
    "connectionToServerClosed": MessageLookupByLibrary.simpleMessage(
      "تم إغلاق الاتصال بالسيرفر",
    ),
    "connectionToServerFaild": MessageLookupByLibrary.simpleMessage(
      "فشل الاتصال بالسيرفر",
    ),
    "countryCityPicker": MessageLookupByLibrary.simpleMessage(
      "اختيار البلد والمدينة",
    ),
    "countryCityPickerDescription": MessageLookupByLibrary.simpleMessage(
      "اختر بلدك ومدينتك من قائمة.",
    ),
    "countryCityPickerMessage": MessageLookupByLibrary.simpleMessage(
      "اختر البلد والمدينة من القائمة، أو أدخل عنوانك الكامل بما في ذلك البلد.",
    ),
    "countryCityPickerTitle": MessageLookupByLibrary.simpleMessage(
      "اختر البلد والمدينة",
    ),
    "countryHint": MessageLookupByLibrary.simpleMessage("البلد"),
    "createConnectionToTheServer": MessageLookupByLibrary.simpleMessage(
      "إنشاء اتصال مع السيرفر",
    ),
    "customerSupport": MessageLookupByLibrary.simpleMessage("دعم العملاء"),
    "debugCacheCleared": MessageLookupByLibrary.simpleMessage(
      "تم مسح الطلبات المخزنة",
    ),
    "debugClearCachedRequests": MessageLookupByLibrary.simpleMessage(
      "مسح جميع الطلبات المخزنة",
    ),
    "debugClearFirstStartPreferences": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين تفضيلات أول تشغيل",
    ),
    "debugFirstStartPreferencesCleared": MessageLookupByLibrary.simpleMessage(
      "تم إعادة تعيين تفضيلات أول تشغيل",
    ),
    "debugMenuTooltip": MessageLookupByLibrary.simpleMessage("قائمة التصحيح"),
    "dialogUpdateMessage": MessageLookupByLibrary.simpleMessage(
      "للحصول على أفضل تجربة ممكنة، يرجى تحديث التطبيق للتمتع بآخر الميزات",
    ),
    "dialogUpdateTitle": MessageLookupByLibrary.simpleMessage("التحديث مطلوب"),
    "didnotReceiveAnyCode": MessageLookupByLibrary.simpleMessage(
      "لم يتم إرسال الكود؟",
    ),
    "drawerPreferences": MessageLookupByLibrary.simpleMessage("التفضيلات"),
    "durationHourUnitOne": MessageLookupByLibrary.simpleMessage("ساعة"),
    "durationHourUnitOther": MessageLookupByLibrary.simpleMessage("ساعات"),
    "durationMinuteUnitOne": MessageLookupByLibrary.simpleMessage("دقيقة"),
    "durationMinuteUnitOther": MessageLookupByLibrary.simpleMessage("دقائق"),
    "empty": MessageLookupByLibrary.simpleMessage("لا يوجد معلومات لعرضها"),
    "emptyScreen": MessageLookupByLibrary.simpleMessage("هذه الصفحة فارغة"),
    "enterAddressManuallyHint": MessageLookupByLibrary.simpleMessage(
      "الشارع، المدينة، البلد…",
    ),
    "enterCodeText": MessageLookupByLibrary.simpleMessage(
      "من فضلك ادخل الكود المرسل إلى ",
    ),
    "errorCancelToken": MessageLookupByLibrary.simpleMessage(
      "تمت مفاطعة الاتصال",
    ),
    "errorEmptyField": MessageLookupByLibrary.simpleMessage(
      "لا يمكن لهذا الحقل أن يكون فارغاً",
    ),
    "errorFetchDistance": MessageLookupByLibrary.simpleMessage(
      "فشل في تقدير الوقت والمسافة",
    ),
    "errorGettingLocation": MessageLookupByLibrary.simpleMessage(
      "فشل في تحديد موقعك",
    ),
    "errorOccurred": MessageLookupByLibrary.simpleMessage("حدث خطأ ما 😢"),
    "errorTxt": MessageLookupByLibrary.simpleMessage(
      "لا يمكن أن يكون هذا الحقل فارغ",
    ),
    "faildToFetchData": MessageLookupByLibrary.simpleMessage(
      "فشل في جلب البيانات",
    ),
    "failedRefresher": MessageLookupByLibrary.simpleMessage(
      "فشل في جلب البيانات",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
    "forbidden": MessageLookupByLibrary.simpleMessage("لا يمكن الوصول الآن"),
    "gallery": MessageLookupByLibrary.simpleMessage("المعرض"),
    "generalErrorMessage": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما. يرجى المحاولة لاحقاً",
    ),
    "getPeople": MessageLookupByLibrary.simpleMessage("الأشخاص"),
    "getPokemons": MessageLookupByLibrary.simpleMessage("البوكيمونات"),
    "goToMyLocation": MessageLookupByLibrary.simpleMessage(
      "الانتقال إلى موقعي",
    ),
    "guetsMessage": MessageLookupByLibrary.simpleMessage(
      "عذراً ، أنت في وضع الزائر ، سجل الدخول للمتابعة.",
    ),
    "homePage": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "hoursShort": MessageLookupByLibrary.simpleMessage("س"),
    "ignoreForNow": MessageLookupByLibrary.simpleMessage("تجاهل"),
    "internalServerErrorMessage": MessageLookupByLibrary.simpleMessage(
      "واجه الخادم خطأ أو تهيئة خاطئة ولم يتمكن من إكمال طلبك سيتم إصلاح المشكلة في أقرب وقت.",
    ),
    "internetNotAvailable": MessageLookupByLibrary.simpleMessage(
      "الإنترنت غير متوفر",
    ),
    "invalidConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "كلمة السر وتأكيد كلمة السر غير متطابقتين",
    ),
    "invalidPassword": MessageLookupByLibrary.simpleMessage(
      "يجب أن تكون بطول 5 محارف على الأق",
    ),
    "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم هاتف صالح مثال 09xx-xxx-xxx",
    ),
    "justLog": MessageLookupByLibrary.simpleMessage("السجل"),
    "lastName": MessageLookupByLibrary.simpleMessage("الأسم الأخير"),
    "loadingYourAddress": MessageLookupByLibrary.simpleMessage(
      "جاري تحديد موقعك",
    ),
    "loadingYourMessages": MessageLookupByLibrary.simpleMessage(
      "جاري تحميل رسائلك",
    ),
    "locationAreaFallback": MessageLookupByLibrary.simpleMessage("منطقتك"),
    "locationPermission": MessageLookupByLibrary.simpleMessage("موقع"),
    "locationServiceDisabledMessage": MessageLookupByLibrary.simpleMessage(
      "خدمات الموقع (GPS) متوقفة. فعّلها من إعدادات الجهاز حتى نتمكن من تحديد موقعك.",
    ),
    "locationServiceDisabledTitle": MessageLookupByLibrary.simpleMessage(
      "فعّل الموقع",
    ),
    "locationSourceChooserMessage": MessageLookupByLibrary.simpleMessage(
      "اختر طريقة تحديد موقعك لعرض مواقيت الصلاة.",
    ),
    "logOut": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "loginErrorRequired": MessageLookupByLibrary.simpleMessage(
      "تسجيل الدخول مطلوب",
    ),
    "makeSureSpecificPermissionGranted": m0,
    "mapPathError": MessageLookupByLibrary.simpleMessage(
      "لا نستطع تحديد الطريق",
    ),
    "minutesShort": MessageLookupByLibrary.simpleMessage("د"),
    "nextPrayerIn": m1,
    "noDataRefresher": MessageLookupByLibrary.simpleMessage(
      "لم يعد يوجد بيانات",
    ),
    "noLocationMessage": MessageLookupByLibrary.simpleMessage(
      "نحتاج موقعك لعرض مواقيت الصلاة.",
    ),
    "noNotifications": MessageLookupByLibrary.simpleMessage("لا يوجد إشعارات"),
    "noResultFound": MessageLookupByLibrary.simpleMessage("لا يوجد نتائج"),
    "notFound": m2,
    "notValidResponse": MessageLookupByLibrary.simpleMessage(
      "جواب المخدم غير مطابق",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("الإشعارات"),
    "ok": MessageLookupByLibrary.simpleMessage("موافق"),
    "oopsErrorMessage": MessageLookupByLibrary.simpleMessage("أوبس !"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "فتح إعدادات التطبيق",
    ),
    "openLocationSettings": MessageLookupByLibrary.simpleMessage(
      "فتح إعدادات الموقع",
    ),
    "optionalUpdateMessage": MessageLookupByLibrary.simpleMessage(
      "يوجد نسخة جديدة من هذا التطبيق. يرجى التحديث للتمتع بآخر الميزات",
    ),
    "optionalUpdateTitle": MessageLookupByLibrary.simpleMessage("تحديث جديد!"),
    "or": MessageLookupByLibrary.simpleMessage("أو"),
    "otpText": m3,
    "otpVerification": MessageLookupByLibrary.simpleMessage("رمز التحقق"),
    "pageEmpty": MessageLookupByLibrary.simpleMessage("لا يوجد محتوى لعرضه .."),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "pdfFile": MessageLookupByLibrary.simpleMessage("ملف PDF"),
    "permissionRequiredMessage": MessageLookupByLibrary.simpleMessage(
      "يجب إعطاء صلاحية الوصول السابفة لتتمكن من استخدام التطبيق",
    ),
    "permissionRequiredTitle": MessageLookupByLibrary.simpleMessage(
      "صلاحية الوصول مطلوبة",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "pickFromMap": MessageLookupByLibrary.simpleMessage("اختر من الخريطة"),
    "pickFromMapDescription": MessageLookupByLibrary.simpleMessage(
      "اسحب الخريطة وضع الدبوس على منطقتك.",
    ),
    "pickLocationOnMapMessage": MessageLookupByLibrary.simpleMessage(
      "اسحب الخريطة حتى يقع الدبوس على مدينتك أو منطقتك، ثم أكّد.",
    ),
    "pickLocationOnMapTitle": MessageLookupByLibrary.simpleMessage(
      "اختر من الخريطة",
    ),
    "prayerAsr": MessageLookupByLibrary.simpleMessage("العصر"),
    "prayerDhuhr": MessageLookupByLibrary.simpleMessage("الظهر"),
    "prayerFajr": MessageLookupByLibrary.simpleMessage("الفجر"),
    "prayerIsha": MessageLookupByLibrary.simpleMessage("العشاء"),
    "prayerLocationLabel": m4,
    "prayerMaghrib": MessageLookupByLibrary.simpleMessage("المغرب"),
    "prayerTimesTitle": MessageLookupByLibrary.simpleMessage("مواقيت الصلاة"),
    "pressTwiceToExit": MessageLookupByLibrary.simpleMessage(
      "إضغط مرتين للخروج",
    ),
    "quranRadioBufferLoading": MessageLookupByLibrary.simpleMessage(
      "جاري تخزين البث…",
    ),
    "quranRadioBufferProgress": m5,
    "quranRadioConnecting": MessageLookupByLibrary.simpleMessage(
      "جاري الاتصال…",
    ),
    "quranRadioError": MessageLookupByLibrary.simpleMessage("تعذر تشغيل البث"),
    "quranRadioErrorHint": MessageLookupByLibrary.simpleMessage(
      "تحقق من اتصالك وحاول مرة أخرى",
    ),
    "quranRadioIdleHint": MessageLookupByLibrary.simpleMessage(
      "ابدأ بث القرآن المباشر",
    ),
    "quranRadioLive": MessageLookupByLibrary.simpleMessage("مباشر"),
    "quranRadioMute": MessageLookupByLibrary.simpleMessage("كتم الصوت"),
    "quranRadioNotificationChannelDescription":
        MessageLookupByLibrary.simpleMessage(
          "عناصر التحكم في بث القرآن المباشر",
        ),
    "quranRadioNotificationChannelName": MessageLookupByLibrary.simpleMessage(
      "إذاعة القرآن",
    ),
    "quranRadioOfflineError": MessageLookupByLibrary.simpleMessage(
      "لا يوجد اتصال بالإنترنت",
    ),
    "quranRadioPause": MessageLookupByLibrary.simpleMessage("متوقف"),
    "quranRadioPlay": MessageLookupByLibrary.simpleMessage("تشغيل"),
    "quranRadioRetry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "quranRadioSkipBackward": MessageLookupByLibrary.simpleMessage(
      "رجوع 10 ثوانٍ",
    ),
    "quranRadioSkipForward": MessageLookupByLibrary.simpleMessage(
      "تقديم 10 ثوانٍ",
    ),
    "quranRadioStop": MessageLookupByLibrary.simpleMessage("إيقاف"),
    "quranRadioTitle": MessageLookupByLibrary.simpleMessage("إذاعة القرآن"),
    "quranRadioUnmute": MessageLookupByLibrary.simpleMessage("إلغاء الكتم"),
    "quranRadioVolume": MessageLookupByLibrary.simpleMessage("مستوى الصوت"),
    "refresh": MessageLookupByLibrary.simpleMessage("تحديث"),
    "reportError": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما، الرجاء الضغط على إرسال لمساعدتنا بحل المشكلة",
    ),
    "resendCode": MessageLookupByLibrary.simpleMessage("إعادة إرسال الرمز"),
    "responseError": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ أثناء الاتصال بالخادم ، يرجى المحاولة لاحقًا",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "saveLocation": MessageLookupByLibrary.simpleMessage("حفظ الموقع"),
    "search": MessageLookupByLibrary.simpleMessage("بحث"),
    "secondsShort": MessageLookupByLibrary.simpleMessage("ث"),
    "selectCityHint": MessageLookupByLibrary.simpleMessage("اختر المدينة"),
    "selectCountryFirstHint": MessageLookupByLibrary.simpleMessage(
      "اختر البلد أولاً",
    ),
    "selectCountryHint": MessageLookupByLibrary.simpleMessage("اختر البلد"),
    "selectLanguageTitle": MessageLookupByLibrary.simpleMessage("اختر اللغة"),
    "selectThemeMessage": MessageLookupByLibrary.simpleMessage(
      "اختر الوضع الفاتح أو الداكن أو اتبع إعداد الجهاز",
    ),
    "selectThemeTitle": MessageLookupByLibrary.simpleMessage("اختر المظهر"),
    "send": MessageLookupByLibrary.simpleMessage("إرسال"),
    "setLocationMessage": MessageLookupByLibrary.simpleMessage(
      "حرّك الخريطة وضع الدبوس على منطقتك.",
    ),
    "setLocationTitle": MessageLookupByLibrary.simpleMessage("حدد موقعك"),
    "signUp": MessageLookupByLibrary.simpleMessage("تسجيل حساب"),
    "specificPermissionRequired": m6,
    "splashExamMessage": MessageLookupByLibrary.simpleMessage(
      "هذا هو تطبيق سكينة الخاص بالامتحان الكتابي لصالح وزارة الإعلام للمتقدم محمد العموري",
    ),
    "switchTheme": MessageLookupByLibrary.simpleMessage("تغيير وضع الالوان"),
    "testErrorScreen": MessageLookupByLibrary.simpleMessage(
      "اختبار كاشف الأخطاء",
    ),
    "testFailureRequest": MessageLookupByLibrary.simpleMessage(
      "اختبار طلب فاشل",
    ),
    "testSuccessRequest": MessageLookupByLibrary.simpleMessage(
      "اختبار طلب ناجح",
    ),
    "testValidatorRequest": MessageLookupByLibrary.simpleMessage(
      "اختبار طلب تحقق",
    ),
    "thankYouForReporting": MessageLookupByLibrary.simpleMessage(
      "شكرا لك على إرسال التقرير",
    ),
    "themeDark": MessageLookupByLibrary.simpleMessage("داكن"),
    "themeLight": MessageLookupByLibrary.simpleMessage("فاتح"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("النظام"),
    "thereAreNoMessagesToDisplay": MessageLookupByLibrary.simpleMessage(
      "لا يوجد رسائل لعرضها",
    ),
    "translationTest": MessageLookupByLibrary.simpleMessage("اختبار الترجمة"),
    "tryEnablingItFromYourPhoneSettings": MessageLookupByLibrary.simpleMessage(
      "حاول تشغيلها من إعدادات جهازك",
    ),
    "typeYourMessageHere": MessageLookupByLibrary.simpleMessage(
      "اكتب رسالتك هنا",
    ),
    "unauthorized": MessageLookupByLibrary.simpleMessage("غير مخول لك بالوصول"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ غير معروف، الرجاء إعادة المحاولة",
    ),
    "update": MessageLookupByLibrary.simpleMessage("تحديث"),
    "updateMessage": MessageLookupByLibrary.simpleMessage(
      "للحصول على أفضل تجربة ممكنة، يرجى تحديث التطبيق للتمتع بآخر الميزات",
    ),
    "updateTitle": MessageLookupByLibrary.simpleMessage("التحديث مطلوب"),
    "updatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم التحديث بنجاح",
    ),
    "useGpsLocation": MessageLookupByLibrary.simpleMessage(
      "استخدم GPS بدلاً من ذلك",
    ),
    "userDoesNotExist": MessageLookupByLibrary.simpleMessage(
      "المستخدم غير موجود",
    ),
    "userName": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
    "video": MessageLookupByLibrary.simpleMessage("فيديو"),
    "welcome": MessageLookupByLibrary.simpleMessage("أهلاً بك"),
    "wordFile": MessageLookupByLibrary.simpleMessage("ملف Word"),
  };
}
