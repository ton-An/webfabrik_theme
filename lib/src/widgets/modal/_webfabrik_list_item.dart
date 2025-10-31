part of 'webfabrik_modal.dart';

// ignore: unused_element
class WebfabrikListItem extends StatelessWidget {
  const WebfabrikListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final WebfabrikListIcon icon;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        const XXSmallGap(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.text.headline),
              const XTinyGap(),
              Text(subtitle, style: theme.text.body),
            ],
          ),
        ),
      ],
    );
  }
}
