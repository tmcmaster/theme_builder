import 'package:flutter/material.dart';

import 'theme_builder_style.dart';

class ThemeBuilderThemes {
  static final ThemeBuilderStyle DEFAULT_STYLE = ThemeBuilderStyle(
    name: 'default',
    theme: ThemeData(),
    darkTheme: ThemeData(),
  );

  late final List<StyleName> _styleNames;
  late final Map<StyleName, ThemeBuilderStyle> _map;
  late final ThemeBuilderStyle _defaultStyle;

  ThemeBuilderThemes(List<ThemeBuilderStyle> styles) {
    _map = {for (var style in styles) style.name: style};
    _styleNames = styles.map((style) => style.name).toList();
    _defaultStyle = _getDefaultStyle(styles);
  }

  factory ThemeBuilderThemes.useDefault() {
    return ThemeBuilderThemes([]);
  }

  ThemeBuilderStyle getStyle(StyleName name) => _map[name] ?? DEFAULT_STYLE;
  ThemeBuilderStyle getDefaultStyle() => _defaultStyle;
  List<StyleName> getStyleNames() => _styleNames;

  ThemeBuilderStyle _getDefaultStyle(List<ThemeBuilderStyle> styles) {
    return (styles.isEmpty ? DEFAULT_STYLE : _getDefaultStyleByTypeOrFirst(styles));
  }

  ThemeBuilderStyle _getDefaultStyleByTypeOrFirst(List<ThemeBuilderStyle> styles) {
    final defaultStyles = styles.whereType<ThemeBuilderDefaultStyle>().toList();
    return (defaultStyles.isEmpty ? styles[0] : defaultStyles[0]);
  }
}
