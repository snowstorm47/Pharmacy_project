import 'package:flutter/material.dart';

import 'dashboard/presentation/pages/dashboard_screen.dart';

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
      home: const DashBoardScreen(),
    );
  }
}
