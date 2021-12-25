import 'package:dyna/dyna.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'buttons_card.dart';
import 'text_input_card.dart';
import 'theme.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return Dyna(
      builder: (context, light, dark) {
        return MaterialApp(
          title: 'Dyna Demo',
          theme: AppTheme.make(light),
          darkTheme: AppTheme.make(dark),
          themeMode: themeMode,
          home: MyHomePage(
            onToggleDarkMode: () {
              setState(() {
                if (themeMode == ThemeMode.light) {
                  themeMode = ThemeMode.dark;
                } else {
                  themeMode = ThemeMode.light;
                }
              });
            },
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function onToggleDarkMode;

  const MyHomePage({
    Key? key,
    required this.onToggleDarkMode,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final dyna = context.dyna;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dyna Demo'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: dyna.color == null
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {
                          dyna.update(Colors.grey);
                        },
                        child: const Text('Use custom color'),
                      ),
                    )
                  : IntrinsicWidth(
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: ColorPicker(
                            pickerColor: dyna.color ?? Colors.grey,
                            paletteType: PaletteType.hueWheel,
                            enableAlpha: false,
                            onColorChanged: (color) {
                              dyna.update(color);
                            },
                          ),
                        ),
                      ),
                    ),
            ),
            Card(
              child: SwitchListTile(
                title: const Text('Dark mode'),
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (_) => widget.onToggleDarkMode(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const ButtonsCard(),
            const TextInputCard(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Text',
                      style: TextStyle(
                        fontSize: 16,
                        color: context.scheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (context.scheme.brightness == Brightness.dark) {
            widget.onToggleDarkMode();
          }
          dyna.update(null);
        },
        tooltip: 'Reset to default',
        child: const Icon(Icons.restore),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
