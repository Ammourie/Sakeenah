enum LocationSource { gps, manual }

enum PrayerName { fajr, dhuhr, asr, maghrib, isha }

extension PrayerNameApiKey on PrayerName {
  String get apiKey {
    switch (this) {
      case PrayerName.fajr:
        return 'Fajr';
      case PrayerName.dhuhr:
        return 'Dhuhr';
      case PrayerName.asr:
        return 'Asr';
      case PrayerName.maghrib:
        return 'Maghrib';
      case PrayerName.isha:
        return 'Isha';
    }
  }

  static PrayerName? fromApiKey(String key) {
    switch (key) {
      case 'Fajr':
        return PrayerName.fajr;
      case 'Dhuhr':
        return PrayerName.dhuhr;
      case 'Asr':
        return PrayerName.asr;
      case 'Maghrib':
        return PrayerName.maghrib;
      case 'Isha':
        return PrayerName.isha;
      default:
        return null;
    }
  }

  static List<PrayerName> get dailyOrder => PrayerName.values;
}
