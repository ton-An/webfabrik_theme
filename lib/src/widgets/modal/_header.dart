part of 'webfabrik_modal.dart';

class _Header extends StatelessWidget {
  const _Header({required this.title, required this.secondaryButtons});

  final String title;
  final List<Widget> secondaryButtons;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.medium,
        vertical: theme.spacing.medium + theme.spacing.small,
      ),
      decoration: BoxDecoration(
        color: theme.colors.translucentBackgroundContrast,
        borderRadius: BorderRadius.circular(theme.radii.medium),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: theme.spacing.xTiny),
            child: Text(
              title,
              style: theme.text.title1.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Row(children: secondaryButtons),
        ],
      ),
    );
  }
}
