import 'package:flutter/material.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return SizedBox(
      height: 22,
      width: 22,
      child: CircularProgressIndicator(
        color: theme.colors.background,
        strokeCap: StrokeCap.round,
        strokeWidth: 4,
      ),
    );
  }
}
