import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:material_color_utilities/scheme/scheme.dart';

extension ColorSchemeExts on ColorScheme {
  /// See "Surface tones":
  /// https://m3.material.io/styles/color/the-color-system/color-roles
  Color get surfaceTone1 => primary.withOpacity(0.05);
  Color get surfaceTone2 => primary.withOpacity(0.08);
  Color get surfaceTone3 => primary.withOpacity(0.11);
  Color get surfaceTone4 => primary.withOpacity(0.12);
  Color get surfaceTone5 => primary.withOpacity(0.14);
}

extension SchemeExts on Scheme {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: Color(primary),
      onPrimary: Color(onPrimary),
      primaryContainer: Color(primaryContainer),
      onPrimaryContainer: Color(onPrimaryContainer),
      secondary: Color(secondary),
      onSecondary: Color(onSecondary),
      secondaryContainer: Color(secondaryContainer),
      onSecondaryContainer: Color(onSecondaryContainer),
      tertiary: Color(tertiary),
      onTertiary: Color(onTertiary),
      tertiaryContainer: Color(tertiaryContainer),
      onTertiaryContainer: Color(onTertiaryContainer),
      error: Color(error),
      onError: Color(onError),
      errorContainer: Color(errorContainer),
      onErrorContainer: Color(onErrorContainer),
      background: Color(background),
      onBackground: Color(onBackground),
      surface: Color(surface),
      onSurface: Color(onSurface),
      surfaceVariant: Color(surfaceVariant),
      onSurfaceVariant: Color(onSurfaceVariant),
      outline: Color(outline),
      shadow: Color(shadow),
      inverseSurface: Color(inverseSurface),
      onInverseSurface: Color(inverseOnSurface),
      inversePrimary: Color(inversePrimary),
    );
  }
}

extension CorePaletteExts on CorePalette {
  Scheme toScheme({bool dark = false}) {
    if (dark) {
      return Scheme(
        primary: primary.get(80),
        onPrimary: primary.get(20),
        primaryContainer: primary.get(30),
        onPrimaryContainer: primary.get(90),
        secondary: secondary.get(80),
        onSecondary: secondary.get(20),
        secondaryContainer: secondary.get(30),
        onSecondaryContainer: secondary.get(90),
        tertiary: tertiary.get(80),
        onTertiary: tertiary.get(20),
        tertiaryContainer: tertiary.get(30),
        onTertiaryContainer: tertiary.get(90),
        error: error.get(80),
        onError: error.get(20),
        errorContainer: error.get(30),
        onErrorContainer: error.get(80),
        background: neutral.get(10),
        onBackground: neutral.get(90),
        surface: neutral.get(10),
        onSurface: neutral.get(90),
        surfaceVariant: neutralVariant.get(30),
        onSurfaceVariant: neutralVariant.get(80),
        outline: neutralVariant.get(60),
        shadow: neutral.get(0),
        inverseSurface: neutral.get(90),
        inverseOnSurface: neutral.get(20),
        inversePrimary: primary.get(40),
      );
    } else {
      return Scheme(
        primary: primary.get(40),
        onPrimary: primary.get(100),
        primaryContainer: primary.get(90),
        onPrimaryContainer: primary.get(10),
        secondary: secondary.get(40),
        onSecondary: secondary.get(100),
        secondaryContainer: secondary.get(90),
        onSecondaryContainer: secondary.get(10),
        tertiary: tertiary.get(40),
        onTertiary: tertiary.get(100),
        tertiaryContainer: tertiary.get(90),
        onTertiaryContainer: tertiary.get(10),
        error: error.get(40),
        onError: error.get(100),
        errorContainer: error.get(90),
        onErrorContainer: error.get(10),
        background: neutral.get(99),
        onBackground: neutral.get(10),
        surface: neutral.get(99),
        onSurface: neutral.get(10),
        surfaceVariant: neutralVariant.get(90),
        onSurfaceVariant: neutralVariant.get(30),
        outline: neutralVariant.get(50),
        shadow: neutral.get(0),
        inverseSurface: neutral.get(20),
        inverseOnSurface: neutral.get(95),
        inversePrimary: primary.get(80),
      );
    }
  }
}
