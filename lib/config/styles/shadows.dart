import 'package:flutter/material.dart';
import 'package:surf_places/config/styles/colors.dart';

abstract class AppShadows {
  const AppShadows._();

  static const smallShadow = BoxShadow(
    color: AppColors.shadowSmall,
    blurRadius: 8,
    offset: Offset(0, 2),
  );
  static const cardsShadow = BoxShadow(
    color: AppColors.shadowCards,
    blurRadius: 16,
    offset: Offset(0, 4),
  );
}
