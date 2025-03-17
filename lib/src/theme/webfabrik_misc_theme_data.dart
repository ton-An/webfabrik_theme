part of 'webfabrik_theme.dart';

/// __Location History Misc Theme Data__
///
/// A collection of miscellaneous values for the [WebfabrikTheme].
class WebfabrikMiscThemeData {
  const WebfabrikMiscThemeData({double? largeIconSize, ImageFilter? blurFilter})
    : this._(largeIconSize, blurFilter);

  const WebfabrikMiscThemeData._(this._largeIconSize, this._blurFilter);

  final double? _largeIconSize;
  final ImageFilter? _blurFilter;

  double get largeIconSize => _largeIconSize ?? _DefaultMisc.largeIconSize;
  ImageFilter get blurFilter => _blurFilter ?? _DefaultMisc.blurFilter;
}
