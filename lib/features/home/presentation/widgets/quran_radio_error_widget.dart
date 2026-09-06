import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../generated/l10n.dart';

class QuranRadioErrorWidget extends StatelessWidget {
  const QuranRadioErrorWidget({
    super.key,
    required this.error,
    required this.onRetry,
  });

  final AppErrors error;
  final VoidCallback onRetry;

  String _message() {
    return error.maybeWhen(
      customError: (message) =>
          message.isNotEmpty ? message : S.current.quranRadioError,
      badRequestError: (message) =>
          message.isNotEmpty ? message : S.current.quranRadioError,
      cancelError: (message) =>
          message?.isNotEmpty == true ? message! : S.current.quranRadioError,
      orElse: () => S.current.quranRadioError,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.current.quranRadioTitle,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
          8.verticalSpace,
          Text(
            _message(),
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
          ),
          16.verticalSpace,
          FilledButton(
            onPressed: onRetry,
            child: Text(S.current.quranRadioRetry),
          ),
        ],
      ),
    );
  }
}
