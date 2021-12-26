import 'package:flutter/material.dart';
import 'package:material_color_utilities/scheme/scheme.dart';

/// Wrapper that contains both light and dark [Scheme]s.
class Schemes {
  /// The light [Scheme].
  final Scheme light;

  /// The dark [Scheme].
  final Scheme dark;

  Schemes({
    required this.light,
    required this.dark,
  });

  /// Creates an instance by generating [Scheme]s using given source/seed
  /// [color].
  factory Schemes.from(Color color) {
    return Schemes(
      light: Scheme.light(color.value),
      dark: Scheme.dark(color.value),
    );
  }
}
