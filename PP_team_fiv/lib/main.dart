import 'package:clean_a/dashboard/presentation/widgets/barchart_widget.dart';
import 'package:clean_a/dashboard/presentation/widgets/piechart_widget.dart';
import 'package:clean_a/header.dart';
import 'package:clean_a/login_p/presentation/new_p.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Define the data for the pie chart
    final Map<String, double> dataMap = {
      'A': 5,
      'B': 3,
      'C': 2,
       'D': 3,
      'E': 2,
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Pie_chart(dataMap: dataMap),
            //new_pPage()
           // Header()
    );
  }
}