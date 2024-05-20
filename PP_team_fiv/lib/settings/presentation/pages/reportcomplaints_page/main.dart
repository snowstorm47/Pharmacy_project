import 'package:flutter/material.dart';
import 'package:viewrolespage/responsive/responsive_layout.dart';
import 'responsive/report_mobile.dart';
import 'responsive/report_tablet.dart';
import 'responsive/report_desktop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
          mobileScaffold: MobileScaffold(),
          tabletScaffold: tabletScaffold(),
          desktopScaffold: desktopScaffold(),
      ),
    );
  }
}


