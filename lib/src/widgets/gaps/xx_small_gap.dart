part of 'gaps.dart';

class XXSmallGap extends StatelessWidget {
  const XXSmallGap({super.key});

  @override
  Widget build(BuildContext context) {
    return Gap(WebfabrikTheme.of(context).spacing.xxSmall);
  }
}
