import 'package:flutter/cupertino.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

/// __Custom Cupertino Text Button__
///
/// A button that is styled like a Cupertino text button.
class CustomCupertinoTextButton extends StatelessWidget {
  const CustomCupertinoTextButton({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.disabledColor,
    this.onPressed,
  });

  final String text;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return CustomCupertinoButton(
      color: color,
      disabledColor: disabledColor,
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: theme.text.headline.copyWith(
          color: textColor ?? theme.colors.primaryContrast,
        ),
      ),
    );
  }
}
