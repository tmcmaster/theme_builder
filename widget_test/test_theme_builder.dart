import 'package:flutter/material.dart';

import 'widgets/my_style.dart';
import 'widgets/my_widget.dart';
import 'widgets/theme_builder_app.dart';

void main() {
  return runApp(
    ThemeBuilderApp(
      title: 'Theme Builder',
      themes: MyStyle.themes,
      child: TestWidget(),
    ),
  );
}
