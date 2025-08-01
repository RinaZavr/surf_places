import 'package:flutter/material.dart';

double calculateTextHeight({
  required String text,
  required TextStyle style,
  required double maxWidth,
  int maxLines = 1000,
  TextAlign textAlign = TextAlign.start,
}) {
  final textSpan = TextSpan(text: text, style: style);

  final textPainter = TextPainter(
    text: textSpan,
    maxLines: maxLines,
    textAlign: textAlign,
    textDirection: TextDirection.ltr,
  )..layout(maxWidth: maxWidth);

  return textPainter.size.height;
}
