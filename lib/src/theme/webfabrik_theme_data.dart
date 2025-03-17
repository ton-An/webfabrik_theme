part of 'webfabrik_theme.dart';

/// __Location History Theme Data__
///
/// The theme data of the [WebfabrikTheme].
class WebfabrikThemeData {
  const WebfabrikThemeData({
    this.colors = const WebfabrikColorThemeData(),
    this.text = const WebfabrikTextThemeData(),
    this.spacing = const WebfabrikSpacingThemeData(),
    this.radii = const WebfabrikRadiiThemeData(),
    this.durations = const WebfabrikDurationsThemeData(),
    this.misc = const WebfabrikMiscThemeData(),
  });

  final WebfabrikColorThemeData colors;
  final WebfabrikTextThemeData text;
  final WebfabrikSpacingThemeData spacing;
  final WebfabrikRadiiThemeData radii;
  final WebfabrikDurationsThemeData durations;
  final WebfabrikMiscThemeData misc;
}
