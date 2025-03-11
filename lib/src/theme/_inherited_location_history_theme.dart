part of 'location_history_theme.dart';

/// __Location History Theme__
///
/// A wrapper for the [Theme] widget that provides an [WebfabrikThemeData] to its
/// children via [InheritedWidget].
class _InheritedWebfabrikTheme extends InheritedWidget {
  const _InheritedWebfabrikTheme({required this.theme, required super.child});

  final WebfabrikTheme theme;

  @override
  bool updateShouldNotify(_InheritedWebfabrikTheme old) =>
      theme.data != old.theme.data;
}
