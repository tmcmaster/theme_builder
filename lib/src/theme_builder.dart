library theme_builder;

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_builder_providers.dart';
import 'theme_builder_style.dart';

class ThemeBuilder extends ConsumerWidget {
  final Widget Function(BuildContext context, ThemeBuilderStyle style) builder;
  ThemeBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = ref.watch(ThemeBuilderProviders.style);
    return builder(context, style);
  }
}
