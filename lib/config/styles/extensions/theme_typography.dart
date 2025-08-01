import 'package:flutter/material.dart';
import 'package:surf_places/config/styles/colors.dart';
import 'package:surf_places/config/styles/typography.dart';

@immutable
class ThemeTypography extends ThemeExtension<ThemeTypography> {
  const ThemeTypography._({required this.label});

  ThemeTypography.dark(
    BuildContext context, [
    Color color = AppColors.white,
  ]) : label = AppTypography.styleRegular14(context).copyWith(color: color);

  ThemeTypography.light(
    BuildContext context, [
    Color color = AppColors.black,
  ]) : label = AppTypography.styleRegular14(context).copyWith(color: color);

  final TextStyle label;

  @override
  ThemeExtension<ThemeTypography> lerp(
    ThemeExtension<ThemeTypography>? other,
    double t,
  ) {
    if (other is! ThemeTypography) {
      return this;
    }

    return ThemeTypography._(label: TextStyle.lerp(label, other.label, t)!);
  }

  @override
  ThemeExtension<ThemeTypography> copyWith({TextStyle? label}) {
    return ThemeTypography._(label: label ?? this.label);
  }

  static ThemeTypography of(BuildContext context) {
    return Theme.of(context).extension<ThemeTypography>()!;
  }
}
