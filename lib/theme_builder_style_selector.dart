import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_builder/theme_builder_providers.dart';
import 'package:theme_builder/theme_builder_style.dart';

class ThemeBuilderStyleSelector extends ConsumerWidget {
  const ThemeBuilderStyleSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final styleNames = watch(ThemeBuilderProviders.styleNames);
    final selectedStyleNameController = watch(ThemeBuilderProviders.selectedStyleName);
    final selectedStyleName = selectedStyleNameController.state;

    return Wrap(
      children: styleNames
          .map((styleName) => RadioListTile<StyleName>(
              title: Text(styleName.text.toUpperCase()),
              value: styleName,
              groupValue: selectedStyleName,
              onChanged: (StyleName? value) {
                selectedStyleNameController.state = styleName;
                Navigator.of(context).pop();
              }))
          .toList(),
    );
  }
}
