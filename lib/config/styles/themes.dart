import 'package:flutter/material.dart';
import 'package:surf_places/config/styles/colors.dart';
import 'package:surf_places/config/styles/extensions/theme_colors.dart';
import 'package:surf_places/config/styles/extensions/theme_shadows.dart';
import 'package:surf_places/config/styles/extensions/theme_typography.dart';

abstract class AppThemes {
  const AppThemes._();

  static ThemeData dark(BuildContext context) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    extensions: [
      const ThemeColors.dark(),
      ThemeTypography.dark(context),
      ThemeShadows.dark(),
    ],
    scaffoldBackgroundColor: AppColors.charcoal,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.charcoal),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.romanSilverDark,
    ),
  );

  static ThemeData light(BuildContext context) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    extensions: [
      const ThemeColors.light(),
      ThemeTypography.light(context),
      ThemeShadows.light(),
    ],
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.romanSilver,
    ),
  );
}
