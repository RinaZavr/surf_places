import 'package:flutter/material.dart';

abstract class AppTypography {
  const AppTypography._();

  static const String fontFamily = 'Roboto';

  // Функция для расчета адаптивного размера шрифта
  static double getAdaptiveFontSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    return baseSize * (screenWidth / 411);
  }

  static TextStyle robotoBold32(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: getAdaptiveFontSize(context, 32),
    height: 36 / 32,
    letterSpacing: 0,
  );

  static TextStyle robotoBold24(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: getAdaptiveFontSize(context, 24),
    height: 1.2,
    letterSpacing: 0,
  );

  static TextStyle robotoMedium18(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: getAdaptiveFontSize(context, 18),
    height: 24 / 18,
    letterSpacing: 0,
  );

  static TextStyle robotoMedium16(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: getAdaptiveFontSize(context, 16),
    height: 20 / 16,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle robotoBold14(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: getAdaptiveFontSize(context, 14),
    height: 18 / 14,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle robotoRegular14(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: getAdaptiveFontSize(context, 14),
    height: 18 / 14,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle robotoRegular12(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: getAdaptiveFontSize(context, 12),
    height: 16 / 12,
    letterSpacing: 0,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle robotoBold14Caps(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: getAdaptiveFontSize(context, 14),
    height: 18 / 14,
    letterSpacing: 0.03 * getAdaptiveFontSize(context, 14),
    textBaseline: TextBaseline.alphabetic,
  );
}
