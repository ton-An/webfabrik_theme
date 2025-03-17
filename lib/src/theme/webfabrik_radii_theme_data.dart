part of 'webfabrik_theme.dart';

/// __Location History Radii Theme Data__
///
/// A collection of Cupertino radii values for the [WebfabrikTheme].
class WebfabrikRadiiThemeData {
  const WebfabrikRadiiThemeData({
    double? small,
    double? medium,
    double? xMedium,
    double? large,
    double? xLarge,
    double? button,
    double? field,
  }) : this._(small, medium, xMedium, large, xLarge, button, field);

  const WebfabrikRadiiThemeData._(
    this._small,
    this._medium,
    this._xMedium,
    this._large,
    this._xLarge,
    this._button,
    this._field,
  );

  final double? _small;
  final double? _medium;
  final double? _xMedium;
  final double? _large;
  final double? _xLarge;
  final double? _button;
  final double? _field;

  double get small => _small ?? _DefaultRadii.small;
  double get medium => _medium ?? _DefaultRadii.medium;
  double get xMedium => _xMedium ?? _DefaultRadii.xMedium;
  double get large => _large ?? _DefaultRadii.large;
  double get xLarge => _xLarge ?? _DefaultRadii._xLarge;
  double get button => _button ?? _DefaultRadii.button;
  double get field => _field ?? _DefaultRadii.field;
}
