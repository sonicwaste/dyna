import 'package:dyna/src/dyna_color.dart';
import 'package:dyna/src/exts/material_color_exts.dart';
import 'package:dyna/src/platform_color_scheme_provider.dart';
import 'package:flutter/material.dart';

const kDynaDefaultColor = Colors.grey;

typedef DynaBuilderFn = Widget Function(
  BuildContext context,
  ColorScheme light,
  ColorScheme dark,
);

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
    return PlatformColorSchemeBuilder(
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
