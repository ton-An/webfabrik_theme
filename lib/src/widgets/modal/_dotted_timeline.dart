part of 'webfabrik_modal.dart';

class DottedTimeline extends StatelessWidget {
  const DottedTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: DottedLine(
          dashLength: 9,
          lineThickness: 6,
          dashGapLength: 9,
          dashColor: theme.colors.translucentBackgroundContrast,
          dashRadius: 2,
          direction: Axis.vertical,
        ),
      ),
    );
  }
}
