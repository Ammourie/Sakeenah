import 'package:flutter/material.dart';

import 'custom_theme_colors.dart';

extension AppThemeContext on BuildContext {
  CustomThemeColors get appColors =>
      Theme.of(this).extension<CustomThemeColors>()!;
}
