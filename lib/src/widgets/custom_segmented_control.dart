import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/src/theme/webfabrik_theme.dart';

class CustomSegmentedControlItem<T> {
  const CustomSegmentedControlItem({required this.label, required this.value});

  final String label;
  final T value;
}

class CustomSegmentedControl<T> extends StatelessWidget {
  const CustomSegmentedControl({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  final List<CustomSegmentedControlItem<T>> items;
  final T selectedValue;
  final Function(T) onChanged;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    final int selectedIndex = items.indexWhere(
      (item) => item.value == selectedValue,
    );

    return SmoothClipRRect(
      borderRadius: BorderRadius.circular(theme.radii.button),
      child: Container(
        height: 44,
        color: theme.colors.translucentBackgroundContrast,
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeInOut,
              alignment: Alignment(
                -1 + (2 * selectedIndex / (items.length - 1)),
                0,
              ),
              child: SmoothClipRRect(
                borderRadius: BorderRadius.circular(theme.radii.button),
                child: FractionallySizedBox(
                  widthFactor: 1 / items.length,
                  child: Container(color: theme.colors.primary),
                ),
              ),
            ),
            Row(
              children: [
                for (int i = 0; i < items.length; i++)
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        onChanged(items[i].value);
                      },
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 160),
                          curve: Curves.easeOut,
                          style: theme.text.footnote.copyWith(
                            fontWeight:
                                i == selectedIndex
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                            color:
                                i == selectedIndex
                                    ? theme.colors.background
                                    : theme.colors.hint,
                          ),
                          child: Text(items[i].label),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
