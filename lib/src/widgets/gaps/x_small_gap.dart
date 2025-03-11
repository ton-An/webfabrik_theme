part of 'gaps.dart';

class XSmallGap extends StatelessWidget {
  const XSmallGap({super.key});

  @override
  Widget build(BuildContext context) {
    return Gap(WebfabrikTheme.of(context).spacing.xSmall);
  }
}
