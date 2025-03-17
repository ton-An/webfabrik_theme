import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part '_default_durations.dart';
part '_default_misc.dart';
part '_default_radii.dart';
part '_default_spacing.dart';
part '_default_text_styles.dart';
part '_inherited_location_history_theme.dart';
part '_text_theme_defaults_builder.dart';
part 'webfabrik_color_theme_data.dart';
part 'webfabrik_colors.dart';
part 'webfabrik_durations_theme_data.dart';
part 'webfabrik_misc_theme_data.dart';
part 'webfabrik_radii_theme_data.dart';
part 'webfabrik_spacing_theme_data.dart';
part 'webfabrik_text_theme_data.dart';
part 'webfabrik_theme_data.dart';

/// __Location History Theme__
///
/// A theme that is __inspired__ (please don't sue) by a certain company residing in an infinite loop.
class WebfabrikTheme extends StatelessWidget {
  const WebfabrikTheme({super.key, required this.data, required this.child});

  final WebfabrikThemeData data;
  final Widget child;

  static WebfabrikThemeData of(BuildContext context) {
    final _InheritedWebfabrikTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedWebfabrikTheme>();
    return inheritedTheme?.theme.data ?? const WebfabrikThemeData();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedWebfabrikTheme(theme: this, child: child);
  }
}
