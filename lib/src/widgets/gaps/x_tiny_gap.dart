part of 'gaps.dart';

class XTinyGap extends StatelessWidget {
  const XTinyGap({super.key});

  @override
  Widget build(BuildContext context) {
    return Gap(WebfabrikTheme.of(context).spacing.xTiny);
  }
}
