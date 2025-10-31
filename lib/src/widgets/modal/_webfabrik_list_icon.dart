part of 'webfabrik_modal.dart';

class WebfabrikListIcon extends StatelessWidget {
  const WebfabrikListIcon({super.key, required this.iconData});

  final WebfabrikIconData iconData;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Container(
      padding: EdgeInsets.all(theme.spacing.medium),
      decoration: BoxDecoration(color: iconData.color, shape: BoxShape.circle),
      child: Icon(
        iconData.icon,
        color: theme.colors.backgroundContrast.withValues(alpha: 0.6),
      ),
    );
  }
}

class WebfabrikIconData {
  const WebfabrikIconData({required this.icon, required this.color});

  final IconData icon;
  final Color color;
}
