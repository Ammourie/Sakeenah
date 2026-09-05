import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../constants/app/app_constants.dart';
import '../errors_screens/build_error_screen.dart';

class GlobalErrorWidget extends StatelessWidget {
  const GlobalErrorWidget({
    required this.flutterErrorDetails,
  });

  final FlutterErrorDetails flutterErrorDetails;

  @override
  Widget build(BuildContext context) {
    return buildErrorScreen(
      disableRetryButton: true,
      title: S.of(context).errorOccurred,
      content: S.current.reportError,
      imageUrl: AppConstants.ERROR_UNKNOWING,
      callback: null,
      context: context,
    );
  }
}
