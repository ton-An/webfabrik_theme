part of 'gaps.dart';

class TinyGap extends StatelessWidget {
  const TinyGap({super.key});

  @override
  Widget build(BuildContext context) {
    return Gap(WebfabrikTheme.of(context).spacing.tiny);
  }
}
