import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_button.dart';

class WebfabrikDialog extends StatelessWidget {
  const WebfabrikDialog({
    super.key,
    required this.title,
    required this.message,
    required this.additionalWidgets,
    required this.actions,
  });

  final String title;
  final String message;
  final List<Widget> additionalWidgets;
  final List<WebfabrikDialogAction> actions;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(theme.radii.xMedium)),
        child: BackdropFilter(
          filter: theme.misc.blurFilter,
          child: Container(
            width: 320,
            padding: EdgeInsets.all(theme.spacing.medium + theme.spacing.xTiny),
            color: theme.colors.background.withValues(alpha: .58),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SmallGap(),
                Text(
                  title,
                  style: theme.text.title2.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const XXSmallGap(),
                LinkText(
                  message,
                  textStyle: theme.text.callout.copyWith(
                    color: theme.colors.hint,
                  ),
                  linkStyle: theme.text.callout.copyWith(
                    color: theme.colors.hint,
                    decoration: TextDecoration.underline,
                  ),
                  onLinkTap: (url) => launchUrlString(url),
                ),

                if (additionalWidgets.isNotEmpty) const XMediumGap(),
                ...additionalWidgets,

                const XMediumGap(),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for (int i = 0; i < actions.length; i++) ...[
                      Expanded(
                        child: _Button(
                          label: actions[i].label,
                          highlight: actions[i].highlight,
                          onPressed: actions[i].onPressed,
                        ),
                      ),
                      if (i < actions.length - 1) const XXSmallGap(),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String title,
    required String message,
    required List<Widget> additionalWidgets,
    required List<WebfabrikDialogAction> actions,
  }) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    showGeneralDialog(
      context: context,
      barrierColor: Colors.transparent,
      transitionDuration: theme.durations.short,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );

        final Animation scaleAnimation = Tween<double>(
          begin: 1.15,
          end: 1,
        ).animate(curvedAnimation);

        return Stack(
          children: [
            Container(
              color: theme.colors.backgroundContrast.withValues(
                alpha: .18 * curvedAnimation.value,
              ),
            ),
            Opacity(
              opacity: curvedAnimation.value,
              child: Transform.scale(
                scale:
                    scaleAnimation.isForwardOrCompleted
                        ? scaleAnimation.value
                        : 1,
                child: child,
              ),
            ),
          ],
        );
      },
      pageBuilder: (BuildContext context, animation, secondaryAnimation) {
        return WebfabrikDialog(
          title: title,
          message: message,
          additionalWidgets: additionalWidgets,
          actions: actions,
        );
      },
    );
  }
}

class WebfabrikDialogAction {
  const WebfabrikDialogAction({
    required this.label,
    required this.onPressed,
    this.highlight = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool highlight;
}
