import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

/// {@template oss_info}
/// A widget that displays information about the open-source nature of the app.
///
/// It includes a GitHub icon, a title, an explanatory text, and an arrow icon.
/// Tapping this widget opens the project's GitHub repository in a browser.
/// The widget has a gradient border and a translucent background.
/// {@endtemplate}
class OSSInfo extends StatelessWidget {
  /// {@macro oss_info}
  const OSSInfo({super.key, required this.repositoryUrl});

  static const String _githubIconPath = 'assets/images/logos/github.svg';

  final String repositoryUrl;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return FadeTapDetector(
      onTap: () {
        launchUrlString(repositoryUrl);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacing.medium,
          vertical: theme.spacing.medium + theme.spacing.xTiny,
        ),
        decoration: BoxDecoration(
          color: theme.colors.translucentBackgroundContrast,
          border: GradientBoxBorder(
            gradient: LinearGradient(colors: theme.colors.timelineGradient),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(theme.radii.medium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  _githubIconPath,
                  width: 24,
                  package: 'webfabrik_theme',
                ),
                const XXSmallGap(),
                Text(
                  WebfabrikLocalizations.of(context)!.proudlyOpenSource,
                  style: theme.text.headline,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: theme.colors.hint,
                    ),
                  ),
                ),
              ],
            ),
            const XXSmallGap(),
            Text(
              WebfabrikLocalizations.of(context)!.openSourceExplanation,
              style: theme.text.callout.copyWith(color: theme.colors.hint),
            ),
          ],
        ),
      ),
    );
  }
}
