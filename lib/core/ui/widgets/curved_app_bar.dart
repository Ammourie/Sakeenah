import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/hive_helper.dart';
import '../../common/local_storage.dart';
import '../../../generated/l10n.dart';
import 'restart_widget.dart';

/// Material 3 top bar with a rounded bottom curve (Sakeenah primary surface).
///
/// Do **not** pass to [Scaffold.appBar]. Place it in a [Stack] via
/// [CurvedAppBarLayout] so body content sits below the curve.
class CurvedAppBar extends StatelessWidget {
  const CurvedAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.showDrawerMenu = false,
    this.bottomCurveRadius,
  }) : assert(
         title != null || titleWidget != null,
         'Provide title or titleWidget',
       );

  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final bool showDrawerMenu;
  final double? bottomCurveRadius;

  /// Full painted height: status bar + toolbar + curve bulge.
  static double totalHeight(BuildContext context, {double? bottomCurveRadius}) {
    final curve = bottomCurveRadius ?? 28.r;
    return MediaQuery.paddingOf(context).top + kToolbarHeight.h + curve * 0.45;
  }

  /// Top padding for [CurvedAppBarLayout] body so content clears the curve.
  static double bodyTopPadding(
    BuildContext context, {
    double? bottomCurveRadius,
    double gap = 12,
  }) {
    return totalHeight(
          context,
          bottomCurveRadius: bottomCurveRadius,
        ) +
        gap.h;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final topPadding = MediaQuery.paddingOf(context).top;
    final curveRadius = bottomCurveRadius ?? 28.r;
    final barHeight = kToolbarHeight.h;
    final totalHeight = topPadding + barHeight + curveRadius * 0.45;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyleFor(colorScheme.primary),
      child: SizedBox(
        height: totalHeight,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(curveRadius),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: topPadding, left: 4.w, right: 8.w),
            child: NavigationToolbar(
              centerMiddle: centerTitle,
              leading: _resolveLeading(context, colorScheme),
              middle:
                  titleWidget ??
                  Text(
                    title!,
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              trailing: _resolveTrailing(context, colorScheme),
            ),
          ),
        ),
      ),
    );
  }

  Widget? _resolveLeading(BuildContext context, ColorScheme colorScheme) {
    if (leading != null) return leading;

    if (showDrawerMenu) {
      return Builder(
        builder: (ctx) => IconButton(
          icon: Icon(Icons.menu_rounded, color: colorScheme.onPrimary),
          onPressed: () => Scaffold.of(ctx).openDrawer(),
          tooltip: MaterialLocalizations.of(ctx).openAppDrawerTooltip,
        ),
      );
    }

    if (automaticallyImplyLeading && Navigator.canPop(context)) {
      return IconButton(
        icon: Icon(Icons.arrow_back_rounded, color: colorScheme.onPrimary),
        onPressed: () => Navigator.maybePop(context),
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      );
    }

    return null;
  }

  Widget? _resolveTrailing(BuildContext context, ColorScheme colorScheme) {
    final trailingActions = <Widget>[
      ...?actions,
      if (kDebugMode) _CurvedAppBarDebugMenu(colorScheme: colorScheme),
    ];
    if (trailingActions.isEmpty) return null;
    return Row(mainAxisSize: MainAxisSize.min, children: trailingActions);
  }

  static SystemUiOverlayStyle _overlayStyleFor(Color background) {
    final iconBrightness =
        ThemeData.estimateBrightnessForColor(background) == Brightness.dark
            ? Brightness.light
            : Brightness.dark;

    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: iconBrightness,
      statusBarBrightness:
          iconBrightness == Brightness.light ? Brightness.dark : Brightness.light,
    );
  }
}

class _CurvedAppBarDebugMenu extends StatelessWidget {
  const _CurvedAppBarDebugMenu({required this.colorScheme});

  final ColorScheme colorScheme;

  Future<void> _clearCachedRequests(BuildContext context) async {
    await HiveHelper.clearAllCachedRequests();
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(S.current.debugCacheCleared)),
    );
  }

  Future<void> _clearFirstStartPreferences(BuildContext context) async {
    await LocalStorage.clearFirstStartPreferences();
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(S.current.debugFirstStartPreferencesCleared)),
    );
    RestartWidget.restartApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_CurvedAppBarDebugAction>(
      icon: Icon(Icons.bug_report_outlined, color: colorScheme.onPrimary),
      tooltip: S.current.debugMenuTooltip,
      color: colorScheme.surfaceContainer,
      onSelected: (action) {
        switch (action) {
          case _CurvedAppBarDebugAction.clearCachedRequests:
            _clearCachedRequests(context);
          case _CurvedAppBarDebugAction.clearFirstStartPreferences:
            _clearFirstStartPreferences(context);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: _CurvedAppBarDebugAction.clearCachedRequests,
          child: Text(
            S.current.debugClearCachedRequests,
            style: TextStyle(color: colorScheme.onSurface),
          ),
        ),
        PopupMenuItem(
          value: _CurvedAppBarDebugAction.clearFirstStartPreferences,
          child: Text(
            S.current.debugClearFirstStartPreferences,
            style: TextStyle(color: colorScheme.onSurface),
          ),
        ),
      ],
    );
  }
}

enum _CurvedAppBarDebugAction {
  clearCachedRequests,
  clearFirstStartPreferences,
}

/// Stacks [appBar] over [body] with correct top inset so the curve reads clearly.
class CurvedAppBarLayout extends StatelessWidget {
  const CurvedAppBarLayout({
    super.key,
    required this.appBar,
    required this.body,
    this.bodyTopGap = 12,
  });

  final CurvedAppBar appBar;
  final Widget body;

  /// Extra space between the bar curve and the first line of body content.
  final double bodyTopGap;

  @override
  Widget build(BuildContext context) {
    final topPadding = CurvedAppBar.bodyTopPadding(
      context,
      bottomCurveRadius: appBar.bottomCurveRadius,
      gap: bodyTopGap,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: body,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: appBar,
        ),
      ],
    );
  }
}
