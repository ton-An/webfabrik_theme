part of 'webfabrik_theme.dart';

/// __Location History Durations Theme Data__
///
/// A collection of durations for the [WebfabrikTheme].
class WebfabrikDurationsThemeData {
  const WebfabrikDurationsThemeData({
    Duration? tiny,
    Duration? xTiny,
    Duration? xxTiny,
    Duration? short,
    Duration? xShort,
    Duration? xxShort,
    Duration? medium,
    Duration? xMedium,
    Duration? xxMedium,
    Duration? long,
    Duration? xLong,
    Duration? xxLong,
  }) : this._(
         tiny ?? _DefaultDurations.tiny,
         xTiny ?? _DefaultDurations.xTiny,
         xxTiny ?? _DefaultDurations.xxTiny,
         short ?? _DefaultDurations.short,
         xShort ?? _DefaultDurations.xShort,
         xxShort ?? _DefaultDurations.xxShort,
         medium ?? _DefaultDurations.medium,
         xMedium ?? _DefaultDurations.xMedium,
         xxMedium ?? _DefaultDurations.xxMedium,
         long ?? _DefaultDurations.long,
         xLong ?? _DefaultDurations.xLong,
         xxLong ?? _DefaultDurations.xxLong,
       );

  const WebfabrikDurationsThemeData._(
    this._tiny,
    this._xTiny,
    this._xxTiny,
    this._short,
    this._xShort,
    this._xxShort,
    this._medium,
    this._xMedium,
    this._xxMedium,
    this._long,
    this._xLong,
    this._xxLong,
  );

  final Duration? _tiny;
  final Duration? _xTiny;
  final Duration? _xxTiny;
  final Duration? _short;
  final Duration? _xShort;
  final Duration? _xxShort;
  final Duration? _medium;
  final Duration? _xMedium;
  final Duration? _xxMedium;
  final Duration? _long;
  final Duration? _xLong;
  final Duration? _xxLong;

  Duration get tiny => _tiny ?? _DefaultDurations.tiny;
  Duration get xTiny => _xTiny ?? _DefaultDurations.xTiny;
  Duration get xxTiny => _xxTiny ?? _DefaultDurations.xxTiny;
  Duration get short => _short ?? _DefaultDurations.short;
  Duration get xShort => _xShort ?? _DefaultDurations.xShort;
  Duration get xxShort => _xxShort ?? _DefaultDurations.xxShort;
  Duration get medium => _medium ?? _DefaultDurations.medium;
  Duration get xMedium => _xMedium ?? _DefaultDurations.xMedium;
  Duration get xxMedium => _xxMedium ?? _DefaultDurations.xxMedium;
  Duration get long => _long ?? _DefaultDurations.long;
  Duration get xLong => _xLong ?? _DefaultDurations.xLong;
  Duration get xxLong => _xxLong ?? _DefaultDurations.xxLong;
}
