import 'package:dyna/src/dyna.dart';
import 'package:flutter/material.dart';

/// [ChangeNotifier] used to update children whenever dyna color changes.
class DynaColorChangeNotifier extends ChangeNotifier {
  /// The color used to generate [Scheme]s from. If provided, Dyna will prefer
  /// a scheme with this color over the scheme from the underlying platform.
  ///
  /// Set this to `null` to revert to using platform colors (or defaults if
  /// platform doesn't provide any).
  Color? _color;

  Color? get color => _color;

  void update(Color? color) {
    _color = color;
    notifyListeners();
  }
}

class DynaColorInheritedNotifier
    extends InheritedNotifier<DynaColorChangeNotifier> {
  const DynaColorInheritedNotifier({
    Key? key,
    required DynaColorChangeNotifier notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);
}

typedef DynaColorBuilderFn = Widget Function(
  BuildContext context,
  Color? dynaColor,
);

class DynaColorBuilder extends StatefulWidget {
  final DynaColorBuilderFn builder;

  const DynaColorBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  _DynaColorBuilderState createState() => _DynaColorBuilderState();
}

class _DynaColorBuilderState extends State<DynaColorBuilder> {
  final DynaColorChangeNotifier _color = DynaColorChangeNotifier();

  @override
  Widget build(BuildContext context) {
    return DynaColorInheritedNotifier(
      notifier: _color,
      child: Builder(
        builder: (context) {
          return widget.builder(
            context,
            // Explicitly depend on the InheritedNotifier to make sure we
            // rebuild whenever the color changes. (InheritedNotifier doesn't
            // rebuild children.)
            Dyna.of(context).color,
          );
        },
      ),
    );
  }
}
