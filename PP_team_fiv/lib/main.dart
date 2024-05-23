import 'package:clean_a/settings/presentation/pages/dashboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  // AwesomeNotifications().initialize(
  //   null,
  //   [
  //     NotificationChannel(
  //       channelKey: 'Pharmacy Management',
  //       channelName: 'Pharmacy Hub',
  //       channelDescription: 'Medicine Named DOOMCK has expired',
  //     ),
  //   ],
  //   debug: true,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DashBoard',
      home: DashBoardScreenn(),
    );
  }
}
// DashBoardScreenn()
