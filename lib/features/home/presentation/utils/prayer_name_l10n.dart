import '../../../../generated/l10n.dart';
import '../../domain/entity/prayer_name.dart';

extension PrayerNameL10n on PrayerName {
  String localized() {
    switch (this) {
      case PrayerName.fajr:
        return S.current.prayerFajr;
      case PrayerName.dhuhr:
        return S.current.prayerDhuhr;
      case PrayerName.asr:
        return S.current.prayerAsr;
      case PrayerName.maghrib:
        return S.current.prayerMaghrib;
      case PrayerName.isha:
        return S.current.prayerIsha;
    }
  }
}
