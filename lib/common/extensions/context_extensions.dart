import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/common/notifiers/theme_notifier.dart';
import 'package:surf_places/config/styles/extensions/theme_colors.dart';
import 'package:surf_places/config/styles/extensions/theme_typography.dart';

extension ContextExtensions on BuildContext {
  ThemeColors get colorExt => Theme.of(this).extension<ThemeColors>()!;

  ThemeTypography get textExt => Theme.of(this).extension<ThemeTypography>()!;

  ThemeNotifier get theme => read<ThemeNotifier>();
}
