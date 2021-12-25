import 'package:flutter/material.dart';
import 'package:material_color_utilities/scheme/scheme.dart';

class Schemes {
  final Scheme light;
  final Scheme dark;
  Schemes({
    required this.light,
    required this.dark,
  });

  factory Schemes.from(Color color) {
    return Schemes(
      light: Scheme.light(color.value),
      dark: Scheme.dark(color.value),
    );
  }
}
