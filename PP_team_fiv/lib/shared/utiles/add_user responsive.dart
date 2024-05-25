// responsive_layout.dart

import 'package:flutter/material.dart';

class ResponsiveLayout {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Add methods to calculate responsive sizes, paddings, margins, etc.
  // For example:
  static double responsivePadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Calculate padding based on screenWidth
    // Example logic:
    if (screenWidth > 600) {
      return 20.0;
    } else {
      return 10.0;
    }
  }
}
