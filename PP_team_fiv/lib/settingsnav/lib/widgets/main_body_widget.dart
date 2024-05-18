import 'package:flutter/material.dart';



class mainBodyWidget extends StatefulWidget {
  const mainBodyWidget({super.key});

  @override
  State<mainBodyWidget> createState() => _mainBodyWidgetState();
}

class _mainBodyWidgetState extends State<mainBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
