import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_builder/theme_builder_style.dart';
import 'package:theme_builder/theme_builder_themes.dart';

abstract class ThemeBuilderProviders {
  static final selectedStyleName = StateProvider<StyleName>((ref) {
    return ref.watch(themes).getDefaultStyle().name;
  });

  static final styleNames = Provider<List<StyleName>>((ref) {
    return ref.watch(themes).getStyleNames();
  });

  static final style = Provider<ThemeBuilderStyle>((ref) {
    final styleName = ref.watch(selectedStyleName).state;
    return ref.watch(themes).getStyle(styleName);
  });

  static final themes = Provider<ThemeBuilderThemes>((ref) => ThemeBuilderThemes.useDefault());
}
