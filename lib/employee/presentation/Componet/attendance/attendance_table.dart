import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';

class AttendanceTable extends StatelessWidget {
  const AttendanceTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: ResponsiveD.isMobile(context) ? 50.0 : 100.0,
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.blue),
            columns: const [
              DataColumn(label: Text('Member')),
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Sign In')),
              DataColumn(label: Text('Sign Out')),
              DataColumn(label: Text('Stay Time')),
              DataColumn(label: Text('Actions')), // New Column for icons
            ],
            rows: const [
              // Add multiple rows here
              DataRow(cells: [
                DataCell(
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Text('JD'),
                        ),
                        SizedBox(width: 10),
                        Text('John Doe'),
                      ],
                    ),
                  ),
                ),
                DataCell(Text('2024-06-03')),
                DataCell(Text('08:00 AM')),
                DataCell(Text('05:00 PM')),
                DataCell(Text('9 hours')),
                DataCell(Icon(Icons.edit)), // New Data for icons
              ]),
              DataRow(cells: [
                DataCell(
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Text('AS'),
                        ),
                        SizedBox(width: 10),
                        Text('Alice Smith'),
                      ],
                    ),
                  ),
                ),
                DataCell(Text('2024-06-03')),
                DataCell(Text('08:30 AM')),
                DataCell(Text('05:30 PM')),
                DataCell(Text('9 hours')),
                DataCell(Icon(Icons.edit)), // New Data for icons
              ]),
              DataRow(cells: [
                DataCell(
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Text('BM'),
                        ),
                        SizedBox(width: 10),
                        Text('Bob Martin'),
                      ],
                    ),
                  ),
                ),
                DataCell(Text('2024-06-03')),
                DataCell(Text('09:00 AM')),
                DataCell(Text('06:00 PM')),
                DataCell(Text('9 hours')),
                DataCell(Icon(Icons.edit)), // New Data for icons
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
