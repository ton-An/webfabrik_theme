import 'package:flutter/material.dart';

class EdgeFadeOptions {

  const EdgeFadeOptions({
    this.enabled = true,
    this.heightFactor = 0.1,
    this.halfWayPoint = 0.5,
  });
  final bool enabled;
  final double heightFactor;
  final double halfWayPoint;
}

class EdgeFade extends StatelessWidget {
  const EdgeFade({
    super.key,
    required this.child,
    this.topOptions = _defaultOptions,
    this.bottomOptions = _defaultOptions,
  });

  final Widget child;
  final EdgeFadeOptions topOptions;
  final EdgeFadeOptions bottomOptions;

  static const EdgeFadeOptions _defaultOptions = EdgeFadeOptions();

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [];
    final List<double> stops = [];

    if (topOptions.enabled) {
      colors.add(Colors.transparent);
      stops.add(0.0);
      colors.add(const Color(0x80000000).withValues(alpha: topOptions.halfWayPoint));
      stops.add(topOptions.heightFactor / 2);
      colors.add(Colors.black);
      stops.add(topOptions.heightFactor);
    }

    if (bottomOptions.enabled) {
      colors.add(Colors.black);
      stops.add(1 - bottomOptions.heightFactor);
      colors.add(
        const Color(0x80000000).withValues(alpha: bottomOptions.halfWayPoint),
      );
      stops.add(1 - bottomOptions.heightFactor / 2);
      colors.add(Colors.transparent);
      stops.add(1.0);
    }

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
          stops: stops, // Adjust stops for fade range
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }
}
