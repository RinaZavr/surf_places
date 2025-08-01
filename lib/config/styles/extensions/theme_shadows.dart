import 'package:flutter/material.dart';
import 'package:surf_places/config/styles/colors.dart';
import 'package:surf_places/config/styles/shadows.dart';

@immutable
class ThemeShadows extends ThemeExtension<ThemeShadows> {
  const ThemeShadows._({required this.smallShadow, required this.cardsShadow});

  ThemeShadows.dark([Color color = AppColors.white])
    : smallShadow = AppShadows.smallShadow.copyWith(color: color),
      cardsShadow = AppShadows.cardsShadow.copyWith(color: color);

  ThemeShadows.light([Color color = AppColors.spaceCadet])
    : smallShadow = AppShadows.cardsShadow.copyWith(color: color),
      cardsShadow = AppShadows.smallShadow.copyWith(color: color);

  final BoxShadow smallShadow;
  final BoxShadow cardsShadow;

  @override
  ThemeExtension<ThemeShadows> lerp(
    ThemeExtension<ThemeShadows>? other,
    double t,
  ) {
    if (other is! ThemeShadows) {
      return this;
    }

    return ThemeShadows._(
      smallShadow: BoxShadow.lerp(smallShadow, other.smallShadow, t)!,
      cardsShadow: BoxShadow.lerp(cardsShadow, other.cardsShadow, t)!,
    );
  }

  @override
  ThemeExtension<ThemeShadows> copyWith({
    BoxShadow? smallShadow,
    BoxShadow? cardsShadow,
  }) {
    return ThemeShadows._(
      smallShadow: smallShadow ?? this.smallShadow,
      cardsShadow: cardsShadow ?? this.cardsShadow,
    );
  }

  static ThemeShadows of(BuildContext context) {
    return Theme.of(context).extension<ThemeShadows>()!;
  }
}
