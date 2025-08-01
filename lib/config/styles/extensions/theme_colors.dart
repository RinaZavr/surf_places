import 'package:flutter/material.dart';
import 'package:surf_places/config/styles/colors.dart';

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors._({required this.primaryColor});

  const ThemeColors.dark() : primaryColor = AppColors.black;

  const ThemeColors.light() : primaryColor = AppColors.white;

  final Color primaryColor;

  @override
  ThemeExtension<ThemeColors> copyWith({Color? primaryColor}) {
    return ThemeColors._(
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors._(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
    );
  }

  static ThemeColors of(BuildContext context) =>
      Theme.of(context).extension<ThemeColors>()!;
}
