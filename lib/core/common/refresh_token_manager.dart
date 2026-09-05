import 'package:mutex/mutex.dart';

import '../../di/service_locator.dart';
import '../../features/account/data/request/param/refresh_token_param.dart';
import '../../features/account/domain/usecase/refresh_token_usecase.dart';
import 'local_storage.dart';

class RefreshTokenManager {
  RefreshTokenManager._();

  static bool isRefreshDone = false;
  static final mutex = Mutex();

  static Future<void> refreshToken() async {
    await mutex.acquire();

    isRefreshDone = false;
    final result = await getIt<RefreshTokenUsecase>()(
      RefreshTokenParam(
        accessToken: LocalStorage.authToken ?? "",
        refreshToken: LocalStorage.refreshToken ?? "",
      ),
    );

    if (result.hasDataOnly) {
      isRefreshDone = true;
      await LocalStorage.persistToken(
        result.data!.accessToken,
        result.data!.refreshToken,
      );
    } else {
      isRefreshDone = false;
    }
    mutex.release();
  }
}
