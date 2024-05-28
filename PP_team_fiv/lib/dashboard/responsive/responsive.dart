import 'package:flutter/cupertino.dart';

class Responsive {
  static bool isMobile(BuildContext, context) =>
      MediaQuery.of(context).size.width < 850.0;

  static bool isTablet(BuildContext, context) =>
      MediaQuery.of(context).size.width < 1100.0 &&
      MediaQuery.of(context).size.width >= 850.0;

  static bool isDesktop(BuildContext, context) =>
      MediaQuery.of(context).size.width >= 1100.0;
}
