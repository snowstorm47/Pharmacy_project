import 'package:flutter/material.dart';
import 'package:pharmacy_ph/sign_in/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy Demo',
      home: MySignInPage(),
    );
  }
}
