import 'package:flutter/cupertino.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/src/theme/webfabrik_theme.dart';
import 'package:webfabrik_theme/src/widgets/loading_indicator.dart';

class CustomCupertinoButton extends StatelessWidget {
  const CustomCupertinoButton({
    super.key,

    required this.child,
    this.color,
    this.disabledColor,
    this.isLoading,
    this.onPressed,
  });

  final Widget child;
  final Color? color;
  final Color? disabledColor;
  final bool? isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return SmoothClipRRect(
      borderRadius: BorderRadius.circular(theme.radii.button),
      child: CupertinoButton(
        color: color ?? theme.colors.primary.withValues(alpha: .8),
        disabledColor: disabledColor ?? theme.colors.disabledButton,
        borderRadius: BorderRadius.zero,
        minSize: 52,
        onPressed: onPressed,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 140),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: isLoading ?? false ? const LoadingIndicator() : child,
        ),
      ),
    );
  }
}
