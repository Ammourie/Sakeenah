import '../../../../core/errors/app_errors.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entity/radio_player_entity.dart';

/// Maps radio playback failures to user-facing localized copy.
/// Never surfaces raw exception text from [RadioPlayerEntity.errorMessage].
class QuranRadioErrorMessage {
  const QuranRadioErrorMessage._();

  static String title({
    required RadioPlayerEntity player,
    required bool hasInternet,
    AppErrors? appError,
  }) {
    if (!hasInternet) {
      return S.current.quranRadioOfflineError;
    }

    if (appError != null) {
      return _fromAppErrors(appError);
    }

    return _fromRawHint(player.errorMessage) ?? S.current.quranRadioError;
  }

  static String get hint => S.current.quranRadioErrorHint;

  static bool useOfflineIcon({required bool hasInternet}) => !hasInternet;

  static String _fromAppErrors(AppErrors error) {
    return error.maybeWhen(
      connectionError: () => S.current.connectionErrorMessage,
      netError: () => S.current.connectionErrorMessage,
      socketError: () => S.current.connectionErrorMessage,
      unknownError: () => S.current.connectionErrorMessage,
      timeoutError: () => S.current.connectionTimeOut,
      cancelError: (_) => S.current.errorCancelToken,
      badRequestError: (_) => S.current.quranRadioError,
      customError: (_) => S.current.quranRadioError,
      orElse: () => S.current.quranRadioError,
    );
  }

  static String? _fromRawHint(String? raw) {
    if (raw == null || raw.isEmpty) return null;

    final lower = raw.toLowerCase();
    if (lower.contains('socket') ||
        lower.contains('connection') ||
        lower.contains('network') ||
        lower.contains('internet') ||
        lower.contains('host lookup')) {
      return S.current.connectionErrorMessage;
    }
    if (lower.contains('timeout') || lower.contains('timed out')) {
      return S.current.connectionTimeOut;
    }
    if (lower.contains('cancel')) {
      return S.current.errorCancelToken;
    }

    return null;
  }
}
