library theme_builder;

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_builder/theme_builder_providers.dart';
import 'package:theme_builder/theme_builder_style.dart';

class ThemeBuilder extends ConsumerWidget {
  final MaterialApp Function(BuildContext context, ThemeBuilderStyle style) builder;
  ThemeBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final style = watch(styleProvider);
    return builder(context, style);
  }
}
