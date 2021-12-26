import 'package:dyna/src/schemes.dart';
import 'package:flutter/material.dart';

import 'platform/scheme_platform.dart';

/// Function signature for building the children of [PlatformSchemeBuilder].
typedef PlatformSchemeBuilderFn = Widget Function(
  BuildContext context,
  Schemes? schemes,
);

/// Builds children with light and dark [Scheme]s obtained from the underlying
/// platform.
class PlatformSchemeBuilder extends StatelessWidget {
  /// Child builder.
  final PlatformSchemeBuilderFn builder;

  const PlatformSchemeBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Schemes?>(
      future: SupportedSchemePlatforms().getSchemes(),
      builder: (BuildContext context, AsyncSnapshot<Schemes?> snapshot) {
        return builder(context, snapshot.data);
      },
    );
  }
}
