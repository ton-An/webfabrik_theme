part of 'gaps.dart';

class LargeGap extends StatelessWidget {
  const LargeGap({super.key});

  @override
  Widget build(BuildContext context) {
    return Gap(WebfabrikTheme.of(context).spacing.large);
  }
}
