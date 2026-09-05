import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Material 3 alert dialog aligned with the app color scheme (light + dark).
class AppThemedAlertDialog extends StatelessWidget {
  const AppThemedAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.primaryLabel,
    required this.onPrimary,
    this.secondaryLabel,
    this.onSecondary,
    this.canPop = true,
    this.icon,
  });

  final String title;
  final String message;
  final String primaryLabel;
  final VoidCallback onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;
  final bool canPop;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: canPop,
      child: Dialog(
        backgroundColor: colorScheme.surfaceContainer,
        surfaceTintColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (icon != null) ...[
                Align(
                  child: Container(
                    width: 56.r,
                    height: 56.r,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      icon,
                      size: 28.r,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                16.verticalSpace,
              ],
              Text(
                title,
                textAlign: TextAlign.center,
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              12.verticalSpace,
              Text(
                message,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
              24.verticalSpace,
              FilledButton(
                onPressed: onPrimary,
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(primaryLabel),
              ),
              if (secondaryLabel != null && onSecondary != null) ...[
                8.verticalSpace,
                OutlinedButton(
                  onPressed: onSecondary,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    side: BorderSide(color: colorScheme.outlineVariant),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    secondaryLabel!,
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
