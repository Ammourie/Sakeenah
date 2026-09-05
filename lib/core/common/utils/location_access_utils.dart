import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../navigation/nav.dart';
import '../../ui/dialogs/app_themed_alert_dialog.dart';
import '../../ui/dialogs/show_dialog.dart';
import '../app_config.dart';
import 'permission_utils.dart';
import '../../../generated/l10n.dart';

/// Ensures runtime location permission and device location services (GPS) are on.
class LocationAccessUtils {
  LocationAccessUtils._();

  static const _logTag = 'LocationAccess';

  static Future<bool> ensureLocationAccess({
    PermissionOption permission = PermissionOption.ForcePermission,
  }) async {
    log('ensureLocationAccess start permission=$permission', name: _logTag);

    final permissions = await requestPermission(
      RequestPermissionsParam(locationWhenInUse: permission),
    );

    final status = permissions[Permission.locationWhenInUse] ??
        permissions[Permission.location] ??
        PermissionStatus.denied;

    log('ensureLocationAccess permissionStatus=$status', name: _logTag);

    if (!status.isGranted) {
      log('ensureLocationAccess abort — permission not granted', name: _logTag);
      return false;
    }

    return _ensureLocationServiceEnabled(
      force: permission == PermissionOption.ForcePermission,
    );
  }

  static Future<bool> isLocationServiceEnabled() =>
      Geolocator.isLocationServiceEnabled();

  static Future<bool> _ensureLocationServiceEnabled({required bool force}) async {
    if (await Geolocator.isLocationServiceEnabled()) {
      log('ensureLocationAccess location service already enabled', name: _logTag);
      return true;
    }

    log('ensureLocationAccess location service disabled', name: _logTag);
    if (!force) return false;

    while (!(await Geolocator.isLocationServiceEnabled())) {
      final shouldOpenSettings = await _promptEnableLocationService();
      if (!shouldOpenSettings) {
        log(
          'ensureLocationAccess user dismissed — skip opening settings',
          name: _logTag,
        );
        return false;
      }

      await ShowDialog.waitForDismissal();
      final opened = await Geolocator.openLocationSettings();
      log(
        'ensureLocationAccess openLocationSettings opened=$opened',
        name: _logTag,
      );
      await _waitForSettingsReturn();

      if (await _isLocationServiceEnabledWithRetry()) {
        log(
          'ensureLocationAccess location service enabled after settings',
          name: _logTag,
        );
        return true;
      }

      log(
        'ensureLocationAccess location service still disabled — prompting again',
        name: _logTag,
      );
    }

    return true;
  }

  static bool _isResumed(AppLifecycleState? state) =>
      state == AppLifecycleState.resumed;

  /// Waits until the user leaves for settings and comes back, or until
  /// location is enabled without a full pause/resume cycle (some devices).
  static Future<void> _waitForSettingsReturn() async {
    final leftForeground = await _waitUntilLeftForeground(
      timeout: const Duration(seconds: 8),
    );

    if (leftForeground) {
      await _waitUntilResumed(timeout: const Duration(minutes: 2));
    } else {
      await _pollUntilEnabledOrBackground(
        timeout: const Duration(minutes: 2),
      );
    }

    await Future<void>.delayed(const Duration(milliseconds: 500));
  }

  static Future<bool> _waitUntilLeftForeground({
    required Duration timeout,
  }) async {
    if (!_isResumed(WidgetsBinding.instance.lifecycleState)) {
      return true;
    }

    final completer = Completer<bool>();
    late AppLifecycleListener listener;
    listener = AppLifecycleListener(
      onPause: () {
        listener.dispose();
        if (!completer.isCompleted) completer.complete(true);
      },
      onHide: () {
        listener.dispose();
        if (!completer.isCompleted) completer.complete(true);
      },
    );

    try {
      return await completer.future.timeout(
        timeout,
        onTimeout: () {
          listener.dispose();
          return false;
        },
      );
    } finally {
      if (!completer.isCompleted) listener.dispose();
    }
  }

  static Future<void> _waitUntilResumed({required Duration timeout}) async {
    if (_isResumed(WidgetsBinding.instance.lifecycleState)) return;

    final completer = Completer<void>();
    late AppLifecycleListener listener;
    listener = AppLifecycleListener(
      onResume: () {
        listener.dispose();
        if (!completer.isCompleted) completer.complete();
      },
    );

    try {
      await completer.future.timeout(timeout);
    } catch (_) {
      listener.dispose();
    }
  }

  /// Settings opened without pausing the app — poll GPS state instead of
  /// re-showing the dialog while the user is still in system UI.
  static Future<void> _pollUntilEnabledOrBackground({
    required Duration timeout,
  }) async {
    final deadline = DateTime.now().add(timeout);

    while (DateTime.now().isBefore(deadline)) {
      if (await Geolocator.isLocationServiceEnabled()) return;

      if (!_isResumed(WidgetsBinding.instance.lifecycleState)) {
        await _waitUntilResumed(
          timeout: deadline.difference(DateTime.now()),
        );
        return;
      }

      await Future<void>.delayed(const Duration(milliseconds: 300));
    }
  }

  static Future<bool> _isLocationServiceEnabledWithRetry() async {
    for (var attempt = 0; attempt < 10; attempt++) {
      if (await Geolocator.isLocationServiceEnabled()) return true;
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
    return false;
  }

  static Future<bool> _promptEnableLocationService() async {
    final context = AppConfig().appContext;
    if (context == null) {
      log(
        'ensureLocationAccess no app context for GPS dialog',
        name: _logTag,
      );
      return false;
    }

    final shouldOpen = await ShowDialog().showElasticDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AppThemedAlertDialog(
          canPop: false,
          icon: Icons.location_off_outlined,
          title: S.current.locationServiceDisabledTitle,
          message: S.current.locationServiceDisabledMessage,
          primaryLabel: S.current.openLocationSettings,
          onPrimary: () => Nav.pop(dialogContext, true),
          secondaryLabel: S.current.cancel,
          onSecondary: () => Nav.pop(dialogContext, false),
        );
      },
    );

    return shouldOpen ?? false;
  }
}
