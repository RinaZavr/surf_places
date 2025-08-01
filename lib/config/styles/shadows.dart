import 'package:flutter/material.dart';

abstract class AppShadows {
  const AppShadows._();

  static const smallShadow = BoxShadow(blurRadius: 8, offset: Offset(0, 2));
  static const cardsShadow = BoxShadow(blurRadius: 16, offset: Offset(0, 4));
}
