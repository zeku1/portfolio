import 'package:flutter/material.dart';

class GradientTextSpan extends TextSpan {
  GradientTextSpan({
    required String text,
    required TextStyle style,
    required Gradient gradient,
  }) : super(
    text: text,
    style: style.copyWith(
      foreground: Paint()
        ..shader = gradient.createShader(
          _calculateTextWidth(text, style), // Call function to calculate the correct width
        ),
    ),
  );

  static Rect _calculateTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return Rect.fromLTWH(0.0, 0.0, textPainter.width, textPainter.height);
  }
}
