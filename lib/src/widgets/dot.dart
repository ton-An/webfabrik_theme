import 'package:flutter/cupertino.dart';
import 'package:webfabrik_theme/src/theme/location_history_theme.dart';

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: 3,
      decoration: BoxDecoration(
        color: WebfabrikTheme.of(context).colors.hint,
        shape: BoxShape.circle,
      ),
    );
  }
}
