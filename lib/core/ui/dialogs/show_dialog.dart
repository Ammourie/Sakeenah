import 'package:flutter/material.dart';

class ShowDialog {
  /// After [Navigator.pop], the dialog route may still be animating out.
  /// Call this before launching system settings or other full-screen intents.
  static Future<void> waitForDismissal() async {
    await WidgetsBinding.instance.endOfFrame;
    await Future<void>.delayed(const Duration(milliseconds: 450));
  }

  Future<T?> showElasticDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    required WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(
      context,
    );
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return Theme(data: theme, child: pageChild);
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: _buildDialogTransitions,
    );
  }

  Widget _buildDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 0.3), end: Offset.zero)
            .animate(CurvedAnimation(
          parent: animation,
          curve: const ElasticOutCurve(0.85),
          reverseCurve: Curves.easeOutBack,
        )),
        child: child,
      ),
    );
  }
}
