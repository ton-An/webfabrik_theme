part of 'location_history_theme.dart';

/// __Location History Durations Theme Data__
///
/// A collection of durations for the [WebfabrikTheme].
class WebfabrikDurationsThemeData {
  const WebfabrikDurationsThemeData({Duration? short}) : this._(short);

  const WebfabrikDurationsThemeData._(this._short);

  final Duration? _short;

  Duration get short => _short ?? _DefaultDurations.short;
}
