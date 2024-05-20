import 'package:flutter/material.dart';
// import 'package:viewrolespage/responsive/responsive_layout.dart';
import 'responsive/password_mobile.dart';
import 'responsive/password_tablet.dart';
import 'responsive/password_desktop.dart';
import 'responsive/responsive_layout.dart';

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


