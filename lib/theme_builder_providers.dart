import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_builder/theme_builder_style.dart';
import 'package:theme_builder/theme_builder_themes.dart';

final selectedStyleNameProvider = StateProvider<StyleName>((ref) {
  return ref.watch(themesProvider).getDefaultStyle().name;
});

final styleNamesProvider = Provider<List<StyleName>>((ref) {
  return ref.watch(themesProvider).getStyleNames();
});

final styleProvider = Provider<ThemeBuilderStyle>((ref) {
  final styleName = ref.watch(selectedStyleNameProvider).state;
  return ref.watch(themesProvider).getStyle(styleName);
});

final themesProvider = Provider<ThemeBuilderThemes>((ref) => ThemeBuilderThemes.useDefault());
