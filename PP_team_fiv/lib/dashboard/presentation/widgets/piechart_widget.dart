import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Pie_chart extends StatelessWidget {
  final Map<String, double> dataMap;

  const Pie_chart({super.key, required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white, // Set background color to white
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      width: 300,
      height: 430,
      // decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 200,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Revenue By Branches',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('March 2024',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 190,
            child: PieChart(
              PieChartData(
                startDegreeOffset: -100,
                sections: dataMap.entries.map((entry) {
                  return PieChartSectionData(
                    value: entry.value,
                    color: _getColor(entry.key),
                    radius: 90,
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: dataMap.keys.map((key) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 14,
                          decoration: BoxDecoration(color: _getColor(key)),
                        ),
                        SizedBox(width: 14),
                        Text(key),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor(String key) {
    switch (key) {
      case 'Branch A':
        return Color.fromRGBO(8, 24, 57, 1);
      case 'Branch B':
        return Color.fromARGB(255, 93, 91, 94);
      case 'Branch C':
        return Color.fromARGB(255, 198, 202, 203);
      case 'Branch D':
        return Color.fromARGB(234, 182, 137, 221);
      case 'Branch E':
        return Color.fromARGB(144, 22, 4, 126);
      default:
        return Colors.grey;
    }
  }
}
