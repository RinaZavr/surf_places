import 'package:flutter/material.dart';

abstract class AppTypography {
  const AppTypography._();

  static const String fontFamily = '';

  // Функция для расчета адаптивного размера шрифта
  static double getAdaptiveFontSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    return baseSize * (screenWidth / 411);
  }

  static TextStyle styleRegular14(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: getAdaptiveFontSize(context, 14),
  );
}
