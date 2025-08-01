import 'package:flutter/material.dart';
import 'package:surf_places/config/styles/colors.dart';
import 'package:surf_places/config/styles/typography.dart';

@immutable
class ThemeTypography extends ThemeExtension<ThemeTypography> {
  const ThemeTypography._({
    required this.largeTitle,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.smallBold,
    required this.small,
    required this.superSmall,
    required this.button,
  });

  ThemeTypography.dark(BuildContext context, [Color color = AppColors.whiteDark])
    : largeTitle = AppTypography.robotoBold32(context).copyWith(color: color),
      title = AppTypography.robotoBold24(context).copyWith(color: color),
      subtitle = AppTypography.robotoMedium18(context).copyWith(color: color),
      text = AppTypography.robotoMedium16(context).copyWith(color: color),
      smallBold = AppTypography.robotoBold14(context).copyWith(color: color),
      small = AppTypography.robotoRegular14(context).copyWith(color: color),
      superSmall = AppTypography.robotoRegular12(
        context,
      ).copyWith(color: color),
      button = AppTypography.robotoBold14Caps(context).copyWith(color: color);

  ThemeTypography.light(BuildContext context, [Color color = AppColors.spaceCadet])
    : largeTitle = AppTypography.robotoBold32(context).copyWith(color: color),
      title = AppTypography.robotoBold24(context).copyWith(color: color),
      subtitle = AppTypography.robotoMedium18(context).copyWith(color: color),
      text = AppTypography.robotoMedium16(context).copyWith(color: color),
      smallBold = AppTypography.robotoBold14(context).copyWith(color: color),
      small = AppTypography.robotoRegular14(context).copyWith(color: color),
      superSmall = AppTypography.robotoRegular12(
        context,
      ).copyWith(color: color),
      button = AppTypography.robotoBold14Caps(context).copyWith(color: color);

  final TextStyle largeTitle;
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle text;
  final TextStyle smallBold;
  final TextStyle small;
  final TextStyle superSmall;
  final TextStyle button;

  @override
  ThemeExtension<ThemeTypography> lerp(
    ThemeExtension<ThemeTypography>? other,
    double t,
  ) {
    if (other is! ThemeTypography) {
      return this;
    }

    return ThemeTypography._(
      largeTitle: TextStyle.lerp(largeTitle, other.largeTitle, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      text: TextStyle.lerp(text, other.text, t)!,
      smallBold: TextStyle.lerp(smallBold, other.smallBold, t)!,
      small: TextStyle.lerp(small, other.small, t)!,
      superSmall: TextStyle.lerp(superSmall, other.superSmall, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
    );
  }

  @override
  ThemeExtension<ThemeTypography> copyWith({
    TextStyle? largeTitle,
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? text,
    TextStyle? smallBold,
    TextStyle? small,
    TextStyle? superSmall,
    TextStyle? button,
  }) {
    return ThemeTypography._(
      largeTitle: largeTitle ?? this.largeTitle,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      text: text ?? this.text,
      smallBold: smallBold ?? this.smallBold,
      small: small ?? this.small,
      superSmall: superSmall ?? this.superSmall,
      button: button ?? this.button,
    );
  }

  static ThemeTypography of(BuildContext context) {
    return Theme.of(context).extension<ThemeTypography>()!;
  }
}
