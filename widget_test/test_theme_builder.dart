import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_builder/theme_builder.dart';
import 'package:theme_builder/theme_builder_providers.dart';
import 'package:theme_builder/theme_builder_style.dart';

import 'my_style.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    print('{"provider": "${provider.name ?? provider.runtimeType}","newValue": "$newValue"}');
  }
}

void main() {
  runApp(
    ProviderScope(
      overrides: [
        themesProvider.overrideWithProvider(Provider((_) => MyStyle.themes)),
      ],
      observers: [
        Logger(),
      ],
      child: ThemeBuilder(
        builder: (BuildContext context, ThemeBuilderStyle style) {
          return MaterialApp(
            theme: style.theme,
            darkTheme: style.darkTheme,
            themeMode: ThemeMode.light,
            home: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text('ThemeBuilder'),
                ),
                body: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                  ),
                  child: Column(
                    children: [
                      StyleSwitcher(),
                      TestWidget(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

class TestWidget extends StatelessWidget {
  const TestWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(children: [
      Text('Heading 1', style: theme.textTheme.headline1),
      Text('Heading 2', style: theme.textTheme.headline2),
      Text('Heading 3', style: theme.textTheme.headline3),
      Text('Heading 4', style: theme.textTheme.headline4),
      Text('Heading 5', style: theme.textTheme.headline5),
      Text('Heading 6', style: theme.textTheme.headline6),
      SizedBox(height: 20),
      Text('Body Text 1', style: theme.textTheme.bodyText1),
      Text('Body Text 2', style: theme.textTheme.bodyText2),
      SizedBox(height: 20),
      ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
      SizedBox(height: 20),
      SizedBox(
        height: 100,
        width: double.infinity,
        child: Wrap(children: _createSchemeButtons(colorScheme)),
      )
    ]);
  }

  List<Widget> _createSchemeButtons(ColorScheme colorScheme) {
    return [
      _createButton('primary', colorScheme.background, colorScheme.onPrimary),
      _createButton('primaryVariant', colorScheme.primaryVariant, colorScheme.onPrimary),
      _createButton('secondary', colorScheme.secondary, colorScheme.onSecondary),
      _createButton('secondaryVariant', colorScheme.secondaryVariant, colorScheme.onSecondary),
      _createButton('surface', colorScheme.surface, colorScheme.onSurface),
      _createButton('background', colorScheme.background, colorScheme.onBackground),
      _createButton('error', colorScheme.error, colorScheme.onError),
    ];
  }

  ElevatedButton _createButton(String title, Color background, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(primary: background, onPrimary: color),
      child: Text(title),
    );
    ElevatedButton.styleFrom(primary: color);
  }
}

class StyleSwitcher extends ConsumerWidget {
  const StyleSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final styleNames = watch(styleNamesProvider);
    final selectedStyleNameController = watch(selectedStyleNameProvider);
    final selectedStyleName = selectedStyleNameController.state;

    return Wrap(
      children: styleNames
          .map((styleName) => RadioListTile<StyleName>(
                title: Text(styleName.text),
                value: styleName,
                groupValue: selectedStyleName,
                onChanged: (StyleName? value) => selectedStyleNameController.state = styleName,
              ))
          .toList(),
    );
  }
}
