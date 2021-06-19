import 'package:flutter/material.dart';

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
      ),
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
