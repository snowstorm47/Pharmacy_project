import 'package:clean_a/Customer/presentaion/customer_add_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy Demo',
      home: CustomerAddPage(),
      // home: SideMenuPage(),
      // home: MySignInP,
      // home: ResetPasswordOtp(),
    );
  }
}
