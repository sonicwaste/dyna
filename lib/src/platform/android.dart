import 'package:dyna/src/schemes.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'package:dyna/src/exts/material_color_exts.dart';

import 'scheme_platform.dart';

class SchemePlatformAndroid implements SchemePlatform {
  @override
  Future<Schemes?> getSchemes() async {
    final palette = await DynamicColorPlugin.getCorePalette();
    if (palette == null) return null;
    return Schemes(
      light: palette.toScheme(dark: false),
      dark: palette.toScheme(dark: true),
    );
  }
}
