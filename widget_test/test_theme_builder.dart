import 'package:flutter/material.dart';
import 'package:theme_builder/theme_builder_app.dart';

import 'my_style.dart';
import 'my_widget.dart';

void main() {
  return runApp(
    ThemeBuilderApp(
      title: 'Theme Builder',
      themes: MyStyle.themes,
      child: TestWidget(),
    ),
  );
}
