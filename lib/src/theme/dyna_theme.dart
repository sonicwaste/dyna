import 'package:flutter/material.dart';

class DynaTheme {
  static ThemeData make(ColorScheme scheme) {
    final theme = ThemeData(
      brightness: scheme.brightness,
      useMaterial3: true,
    );
    return theme.copyWith(
      colorScheme: scheme,
      backgroundColor: scheme.background,
      splashColor: scheme.primary.withOpacity(0.1),
      highlightColor: scheme.primary.withOpacity(0.1),
      primaryColor: scheme.primary,
      toggleableActiveColor: scheme.primary,
      dividerColor: scheme.outline,
      cardColor: scheme.surfaceVariant,
      shadowColor: scheme.shadow,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.tertiary,
        foregroundColor: scheme.onTertiary,
      ),
      cardTheme: CardTheme(
        shadowColor: scheme.shadow,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
