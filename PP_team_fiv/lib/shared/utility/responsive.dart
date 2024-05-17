import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  final double height;
  final double width;

  Responsive(this.context)
      : height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;

  bool get isMobile => width < 600;

  bool get isTablet => width >= 600 && width < 1200;

  bool get isDesktop => width >= 1200;

  double hp(double percent) => height * percent / 100;

  double wp(double percent) => width * percent / 100;
}

extension ScreenSize on BuildContext {
  Responsive get responsive => Responsive(this);
}
