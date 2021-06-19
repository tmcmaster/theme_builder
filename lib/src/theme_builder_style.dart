import 'package:flutter/material.dart';

class ThemeBuilderDefaultStyle extends ThemeBuilderStyle {
  ThemeBuilderDefaultStyle({
    required name,
    required theme,
    required darkTheme,
  }) : super(name: name, theme: theme, darkTheme: darkTheme);
}

class ThemeBuilderStyle {
  late final StyleName name;
  late final ThemeData theme;
  late final ThemeData darkTheme;
  ThemeBuilderStyle({
    required name,
    required theme,
    required darkTheme,
  }) {
    this.name = StyleName(name);
    this.theme = theme;
    this.darkTheme = darkTheme;
  }
}

class StyleName {
  final String text;

  const StyleName(this.text);

  @override
  bool operator ==(Object other) => other is StyleName && other.text == text;

  @override
  int get hashCode => text.hashCode;
}
