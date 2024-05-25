import 'package:clean_a/customer/presentation/add_autho_user.dart';
import 'package:clean_a/customer/presentation/auto_user_list.dart';
import 'package:clean_a/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:clean_a/dashboard/presentation/widgets/barchart_widget.dart';
import 'package:clean_a/dashboard/presentation/widgets/piechart_widget.dart';
import 'package:clean_a/header.dart';

import 'package:clean_a/login_p/presentation/new_p.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'responsive_layout.dart'; // Import the responsive_layout.dart file

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
      'E': 4,
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: /*MonthlyDataChart(
  seriesList: MonthlyDataChart.createSampleData(),
),*/
      //Pie_chart(dataMap: dataMap),
   // NewPPage(),
        // const Header(title: ''),
       // Dashboard_screen(),
      // AuthoUser(),
       AddAuto(),

    );
  }
  
  
}        