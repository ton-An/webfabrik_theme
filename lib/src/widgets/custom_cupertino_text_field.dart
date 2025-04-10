import 'package:flutter/cupertino.dart';
import 'package:webfabrik_theme/src/theme/webfabrik_theme.dart';

class CustomCupertinoTextField extends StatelessWidget {
  const CustomCupertinoTextField({
    required this.hint,
    required this.onChanged,
    this.obscureText = false,
    this.autofillHints = const [],
    this.controller,
    super.key,
  });

  final String hint;
  final bool obscureText;
  final List<String> autofillHints;
  final Function(String) onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return SizedBox(
      height: 44,
      child: CupertinoTextField(
        controller: controller,
        placeholder: hint,
        obscureText: obscureText,
        style: theme.text.body,
        placeholderStyle: theme.text.body.copyWith(
          color: theme.colors.text.withValues(alpha: .5),
        ),
        cursorHeight: 20,
        padding: EdgeInsets.symmetric(horizontal: theme.spacing.medium + 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(theme.radii.field),
          color: theme.colors.translucentBackgroundContrast,
        ),
        autofillHints: autofillHints,
        onChanged: onChanged,
      ),
    );
  }
}
