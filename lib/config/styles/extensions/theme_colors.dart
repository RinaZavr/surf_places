import 'package:flutter/material.dart';
import 'package:surf_places/config/styles/colors.dart';

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors._({
    required this.primaryColor,
    required this.cardColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.secondaryAccentColor,
    required this.importantColor,
    required this.infoColor,
    required this.trinityColor,
    required this.shadowSmallColor,
    required this.shadowCardsColor,
  });

  const ThemeColors.light()
    : primaryColor = AppColors.white,
      accentColor = AppColors.emerald,
      secondaryAccentColor = AppColors.dandelion,
      importantColor = AppColors.cinnabar,
      cardColor = AppColors.whiteSmoke,
      trinityColor = AppColors.romanSilver56,
      secondaryColor = AppColors.spaceCadet,
      infoColor = AppColors.romanSilver,
      shadowSmallColor = AppColors.shadowSmall,
      shadowCardsColor = AppColors.shadowCards;

  const ThemeColors.dark()
    : primaryColor = AppColors.charcoal,
      accentColor = AppColors.pastelGreen,
      secondaryAccentColor = AppColors.corn,
      importantColor = AppColors.fireEngineRed,
      cardColor = AppColors.eerieBlack,
      trinityColor = AppColors.romanSilverDark56,
      secondaryColor = AppColors.whiteDark,
      infoColor = AppColors.romanSilverDark,
      shadowSmallColor = AppColors.shadowSmall,
      shadowCardsColor = AppColors.shadowCards;

  final Color primaryColor;
  final Color cardColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color secondaryAccentColor;
  final Color importantColor;
  final Color infoColor;
  final Color trinityColor;
  final Color shadowSmallColor;
  final Color shadowCardsColor;

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primaryColor,
    Color? cardColor,
    Color? secondaryColor,
    Color? accentColor,
    Color? secondaryAccentColor,
    Color? importantColor,
    Color? infoColor,
    Color? trinityColor,
    Color? shadowSmallColor,
    Color? shadowCardsColor,
  }) {
    return ThemeColors._(
      primaryColor: primaryColor ?? this.primaryColor,
      cardColor: cardColor ?? this.cardColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      accentColor: accentColor ?? this.accentColor,
      secondaryAccentColor: secondaryAccentColor ?? this.secondaryAccentColor,
      importantColor: importantColor ?? this.importantColor,
      infoColor: infoColor ?? this.infoColor,
      trinityColor: trinityColor ?? this.trinityColor,
      shadowSmallColor: shadowSmallColor ?? this.shadowSmallColor,
      shadowCardsColor: shadowCardsColor ?? this.shadowCardsColor,
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
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      secondaryAccentColor:
          Color.lerp(secondaryAccentColor, other.secondaryAccentColor, t)!,
      importantColor: Color.lerp(importantColor, other.importantColor, t)!,
      infoColor: Color.lerp(infoColor, other.infoColor, t)!,
      trinityColor: Color.lerp(trinityColor, other.trinityColor, t)!,
      shadowSmallColor: Color.lerp(shadowSmallColor, other.shadowSmallColor, t)!,
      shadowCardsColor:
          Color.lerp(shadowCardsColor, other.shadowCardsColor, t)!,
    );
  }

  static ThemeColors of(BuildContext context) =>
      Theme.of(context).extension<ThemeColors>()!;
}
