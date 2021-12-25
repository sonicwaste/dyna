import 'dart:io';

import 'package:dyna/src/platform/android.dart';
import 'package:dyna/src/schemes.dart';

/// Interface for platforms that support [Schemes].
abstract class SchemePlatform {
  Future<Schemes?> getSchemes();
}

class SupportedSchemePlatforms implements SchemePlatform {
  /// Gets [Schemes] for the current platform.
  @override
  Future<Schemes?> getSchemes() async {
    if (Platform.isAndroid) {
      return SchemePlatformAndroid().getSchemes();
    } else {
      // ignore: avoid_print
      print('Dyna does not support native color scheme on this platform');
      return null;
    }
  }
}
