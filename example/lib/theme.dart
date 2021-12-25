import 'package:dyna/dyna.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData make(ColorScheme scheme) {
    return DynaTheme.make(scheme).copyWith(
      scaffoldBackgroundColor: Color.alphaBlend(
        scheme.surfaceTone2,
        scheme.background,
      ),
    );
  }
}
