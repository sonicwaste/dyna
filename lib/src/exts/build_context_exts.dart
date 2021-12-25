import 'package:dyna/src/dyna_color.dart';
import 'package:flutter/material.dart';

import '../dyna.dart';

extension BuildContextExts on BuildContext {
  DynaColorChangeNotifier get dyna => Dyna.of(this);
  ColorScheme get scheme => Theme.of(this).colorScheme;
}
