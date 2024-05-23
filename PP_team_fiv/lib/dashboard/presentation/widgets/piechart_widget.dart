import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Pie_chart extends StatelessWidget {
  final Map<String, double> dataMap;

  const Pie_chart({super.key, required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 202, 202),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Container(
          width: 300,
          height: 440,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                height: 70,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Revenue By Branches',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text('March 2024', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 190,
                child: PieChart(
                  PieChartData(
                    startDegreeOffset: -100,
                    sections: [
                      PieChartSectionData(
                        value: 34,
                        color: Color.fromRGBO(8, 24, 57, 1),
                        radius: 90,
                      ),
                      PieChartSectionData(
                        value: 32,
                        color: Color.fromARGB(255, 93, 91, 94),
                        radius: 90,
                      ),
                      PieChartSectionData(
                        value: 26,
                        color: Color.fromARGB(255, 198, 202, 203),
                        radius: 90,
                      ),
                      PieChartSectionData(
                        value: 28,
                        color: Color.fromARGB(234, 182, 137, 221),
                        radius: 90,
                      ),
                      PieChartSectionData(
                        value: 30,
                        color: Color.fromARGB(144, 22, 4, 126),
                        radius: 90,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 14,
                            decoration: BoxDecoration(color: Color.fromRGBO(8, 24, 57, 1)),
                          ),
                          SizedBox(width: 14),
                          Text('Branch A'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 14,
                            decoration: BoxDecoration(color: Color.fromARGB(255, 93, 91, 94)),
                          ),
                          SizedBox(width: 14),
                          Text('Branch B'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 14,
                            decoration: BoxDecoration(color: Color.fromARGB(255, 198, 202, 203)),
                          ),
                          SizedBox(width: 14),
                          Text('Branch C'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 14,
                            decoration: BoxDecoration(color: Color.fromARGB(234, 182, 137, 221)),
                          ),
                          SizedBox(width: 14),
                          Text('Branch D'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 14,
                            decoration: BoxDecoration(color: Color.fromARGB(144, 22, 4, 126)),
                          ),
                          SizedBox(width: 14),
                          Text('Branch E'),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}