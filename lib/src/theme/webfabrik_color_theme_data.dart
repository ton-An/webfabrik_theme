part of 'webfabrik_theme.dart';

/*
  To-Dos:
  - [ ] Organize colors
*/

/// __Location History Color Theme Data__
///
/// A collection of Cupertino colors for the [WebfabrikTheme].
class WebfabrikColorThemeData {
  const WebfabrikColorThemeData({
    this.primary = WebfabrikColors.primary,
    this.primaryTranslucent = WebfabrikColors.primaryTranslucent,
    this.primaryContrast = WebfabrikColors.white,
    this.accent = WebfabrikColors.accent,
    this.translucentBackground = WebfabrikColors.translucentBackground,
    this.cameraViewBackground = WebfabrikColors.cameraViewBackground,
    this.text = WebfabrikColors.black,
    this.buttonLabel = WebfabrikColors.white,
    this.description = WebfabrikColors.description,
    this.activityIndicator = WebfabrikColors.white,
    this.fieldColor = WebfabrikColors.lightGray,
    this.background = WebfabrikColors.white,
    this.error = WebfabrikColors.red,
    this.success = WebfabrikColors.green,
    this.border = WebfabrikColors.border,
    this.hint = WebfabrikColors.hint,
    this.disabledButton = WebfabrikColors.disabled,
    this.transparent = WebfabrikColors.transparent,
    this.backgroundContrast = WebfabrikColors.black,
    this.translucentBackgroundContrast =
        WebfabrikColors.translucentBackgroundContrast,
    this.timelineGradient = WebfabrikColors.timelineGradient,
    this.secondaryGradient = WebfabrikColors.secondaryGradient,
  });

  final Color primary;
  final Color primaryContrast;
  final Color primaryTranslucent;
  final Color accent;
  final Color translucentBackground;
  final Color cameraViewBackground;
  final Color text;
  final Color buttonLabel;
  final Color description;
  final Color activityIndicator;
  final Color fieldColor;
  final Color background;
  final Color error;
  final Color success;
  final Color border;
  final Color hint;
  final Color disabledButton;
  final Color transparent;
  final Color backgroundContrast;
  final Color translucentBackgroundContrast;
  final List<Color> timelineGradient;
  final List<Color> secondaryGradient;
}
