import 'package:flutter/widgets.dart';

class BackgroundGradientDecoration extends BoxDecoration {
  const BackgroundGradientDecoration()
    : super(
        gradient: const LinearGradient(
          begin: AlignmentGeometry.xy(0.8, -1.0),
          end: AlignmentGeometry.xy(0.4, 0.85),
          colors: [Color(0xFFD3E3FF), Color(0xFFFFEDFD), Color(0xFFFFFFFF)],
          stops: [0.2, 0.5, 1.0],
        ),
      );
}
