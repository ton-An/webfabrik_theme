part of 'webfabrik_modal.dart';

class _Header extends StatelessWidget {
  const _Header({
    required this.title,
    required this.secondaryButtons,
    required this.displayBackButton,
    required this.onBackPressed,
  });

  final String title;
  final List<Widget> secondaryButtons;
  final bool displayBackButton;
  final VoidCallback? onBackPressed;

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
        children: [
          if (displayBackButton) ...[
            SmallIconButton(
              onPressed: onBackPressed ?? () {},
              alignmentOffset: const Offset(-1, 0),
              icon: CupertinoIcons.back,
            ),
            const MediumGap(),
          ],
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
              child: Text(
                title,
                style: theme.text.title1.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const XTinyGap(),
          Row(children: secondaryButtons),
        ],
      ),
    );
  }
}
