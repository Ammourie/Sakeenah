import 'package:audio_service/audio_service.dart';

import '../../core/localization/localization_provider.dart';
import '../../di/service_locator.dart';
import '../../features/home/data/datasource/quran_radio_audio_handler.dart';
import '../../features/home/data/datasource/quran_radio_player.dart';
import '../common/app_colors.dart';
import '../constants/app/app_constants.dart';
import '../../generated/l10n.dart';

AudioHandler? _quranRadioHandler;

/// Active [AudioHandler] for Quran Radio notification / lock-screen controls.
AudioHandler? get quranRadioHandler => _quranRadioHandler;

/// Initializes background audio for Quran Radio. Call after [configureInjection]
/// and [LocalizationProvider.fetchLocale] so notification strings can load.
Future<void> initQuranRadioAudioService() async {
  await S.load(LocalizationProvider().appLocal);

  _quranRadioHandler = await AudioService.init(
    builder: () => QuranRadioAudioHandler(getIt<QuranRadioPlayer>()),
    config: AudioServiceConfig(
      androidNotificationChannelId:
          AppConstants.QURAN_RADIO_NOTIFICATION_CHANNEL_ID,
      androidNotificationChannelName: S.current.quranRadioTitle,
      androidNotificationChannelDescription:
          'Live Quran radio playback controls',
      androidNotificationIcon: AppConstants.QURAN_RADIO_NOTIFICATION_ICON,
      notificationColor: AppColors.primary,
      androidStopForegroundOnPause: false,
      androidShowNotificationBadge: false,
    ),
  );
}
