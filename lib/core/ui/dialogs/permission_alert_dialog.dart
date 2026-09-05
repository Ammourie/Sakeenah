import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../generated/l10n.dart';
import '../../navigation/nav.dart';
import '../widgets/restart_widget.dart';
import 'app_themed_alert_dialog.dart';
import 'show_dialog.dart';

class PermissionAlertDialog extends StatelessWidget {
  const PermissionAlertDialog({required this.permissionName, super.key});

  final String? permissionName;

  String get _message {
    final name = permissionName;
    if (name == null) {
      return '${S.current.permissionRequiredTitle}\n\n'
          '${S.current.permissionRequiredMessage}\n\n'
          '${S.current.tryEnablingItFromYourPhoneSettings}';
    }
    return '${S.current.specificPermissionRequired(name)}\n\n'
        '${S.current.makeSureSpecificPermissionGranted(name)}\n\n'
        '${S.current.tryEnablingItFromYourPhoneSettings}';
  }

  @override
  Widget build(BuildContext context) {
    return AppThemedAlertDialog(
      canPop: false,
      icon: Icons.lock_outline_rounded,
      title: S.current.accessDenied,
      message: _message,
      primaryLabel: S.current.openAppSettings,
      onPrimary: () async {
        Nav.pop(context);
        await ShowDialog.waitForDismissal();
        await openAppSettings();
        if (context.mounted) {
          RestartWidget.restartApp(context);
        }
      },
      secondaryLabel: S.current.closeApp,
      onSecondary: () {
        Nav.pop(context);
        SystemNavigator.pop();
      },
    );
  }
}
