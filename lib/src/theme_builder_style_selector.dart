import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_builder_providers.dart';
import 'theme_builder_style.dart';

class ThemeBuilderStyleSelector extends ConsumerWidget {
  const ThemeBuilderStyleSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styleNames = ref.watch(ThemeBuilderProviders.styleNames);
    final selectedStyleNameController = ref.watch(ThemeBuilderProviders.selectedStyleName.notifier);
    final selectedStyleName = ref.watch(ThemeBuilderProviders.selectedStyleName);

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
