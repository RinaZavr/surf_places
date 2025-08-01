import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  // Light

  static const Color white = Color(0xFFFFFFFF); // primary
  static const Color emerald = Color(0xFF4CAF50); // accent
  static const Color dandelion = Color(0xFFFCDD3D); // secondaryAccent
  static const Color cinnabar = Color(0xFFEF4343); // important

  static const Color whiteSmoke = Color(0xFFF5F5F5); // card
  static const Color romanSilver56 = Color(0x8F7C7E92); // trinity (56%)
  static const Color spaceCadet = Color(0xFF252849); // secondary
  static const Color romanSilver = Color(0xFF7C7E92); // info

  // Dark

  static const Color pastelGreen = Color(0xFF6ADA6F); // accent
  static const Color fireEngineRed = Color(0xFFCF2A2A); // important
  static const Color corn = Color(0xFFFFE769); // secondaryAccent
  static const Color whiteDark = Color(0xFFFFFFFF); // secondary

  static const Color charcoal = Color(0xFF21222C); // primary
  static const Color romanSilverDark56 = Color(0x8F7C7E92); // trinity (56%)
  static const Color eerieBlack = Color(0xFF1A1A20); // card
  static const Color romanSilverDark = Color(0xFF7C7E92); // info

  // Own

  static const Color shadowSmall = Color(0x3D1A1A20); // smallShadow (24%)
  static const Color shadowCards = Color(0x291A1A20); // cardsShadow (16%)
  static const Color jacarta = Color(0x143B3E5B);
}
