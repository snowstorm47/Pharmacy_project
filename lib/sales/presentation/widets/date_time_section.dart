import 'package:flutter/material.dart';

class DateTimeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: const Text(
        'Date and Time', // Replace with actual date and time string
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}
