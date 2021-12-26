import 'package:dyna/src/dyna_color.dart';
import 'package:dyna/src/exts/material_color_exts.dart';
import 'package:flutter/material.dart';

import 'platform_scheme_provider.dart';

const kDynaDefaultColor = Colors.grey;

/// Function signature for building children of [Dyna].
typedef DynaBuilderFn = Widget Function(
  BuildContext context,
  ColorScheme light,
  ColorScheme dark,
);

/// Builds children with light and dark [ColorScheme]s.
///
/// Dyna will use `Dyna.of(context).color` to generate the [ColorScheme]s. If
/// this value is null (default), Dyna will try to get a [ColorScheme] from the
/// underlying platform (e.g. wallpaper based on Android). If the platform is
/// not supported, Dyna will then use the given default [color] to generate the
/// [ColorScheme]s. If none is provided, Dyna will use the package default color
/// of ([kDynaDefaultColor]).
///
/// You can access the current source/seed color using `Dyna.of(context).color`.
/// You can update it by calling `Dyna.of(context).update(color)` or
/// `context.dyna.update(color)`.
class Dyna extends StatelessWidget {
  final DynaBuilderFn builder;

  /// Default color to generates [Scheme]s from.
  ///
  /// This value will be used if [Dyna] color isn't updated and if no platform
  /// color [Scheme] is available.
  final Color? color;

  const Dyna({
    Key? key,
    required this.builder,
    this.color,
  }) : super(key: key);

  static DynaColorChangeNotifier of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<DynaColorInheritedNotifier>();
    if (widget == null) {
      throw 'No $DynaColorInheritedNotifier found';
    }
    return widget.notifier!;
  }

  ColorScheme? _schemeFrom(Color? color, {bool dark = false}) {
    if (color == null) return null;
    return ColorScheme.fromSeed(
      seedColor: color,
      brightness: dark ? Brightness.dark : Brightness.light,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformSchemeBuilder(
      builder: (context, platformScheme) {
        return DynaColorBuilder(
          builder: (context, dynaColor) {
            final ColorScheme light = _schemeFrom(dynaColor) ??
                platformScheme?.light.toColorScheme(Brightness.light) ??
                _schemeFrom(color) ??
                _schemeFrom(kDynaDefaultColor)!;
            final ColorScheme dark = _schemeFrom(dynaColor, dark: true) ??
                platformScheme?.dark.toColorScheme(Brightness.dark) ??
                _schemeFrom(color, dark: true) ??
                _schemeFrom(kDynaDefaultColor, dark: true)!;
            return builder(context, light, dark);
          },
        );
      },
    );
  }
}
