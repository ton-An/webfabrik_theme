import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

class Attribution {
  const Attribution({required this.name, required this.url});

  final String name;
  final String url;
}

class AttributionLegend extends StatelessWidget {
  const AttributionLegend({
    super.key,
    required this.attributions,
    this.additionalWidgets = const [],
  });

  final List<Attribution> attributions;
  final List<Widget> additionalWidgets;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(theme.radii.small),
      child: BackdropFilter(
        filter: theme.misc.blurFilter,
        child: FadeTapDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            WebfabrikDialog.show(
              context: context,
              title: WebfabrikLocalizations.of(context)!.attributions,
              additionalWidgets: additionalWidgets,
              actions: [
                WebfabrikDialogAction(
                  label: WebfabrikLocalizations.of(context)!.ok,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
              message: attributions
                  .map((e) => '${e.name}:\n${e.url}')
                  .join('\n\n'),
            );
          },
          child: Container(
            padding: EdgeInsets.all(theme.spacing.xxSmall),
            color: theme.colors.translucentBackground,
            child: Icon(Icons.info, color: theme.colors.description),
          ),
        ),
      ),
    );
  }
}
