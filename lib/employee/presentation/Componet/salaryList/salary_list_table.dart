import 'package:flutter/material.dart';

class SalaryListTable extends StatelessWidget {
  const SalaryListTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 50.0,
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Colors.blue),
        columns: const [
          DataColumn(label: SizedBox.shrink()), // Empty column for checkbox
          DataColumn(label: Text('Batch')),
          DataColumn(label: Text('Member Name')),
          DataColumn(label: Text('Total Salary')),
          DataColumn(label: Text('Working Days')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('More')),
        ],
        rows: const [
          // Add multiple rows here
          DataRow(cells: [
            DataCell(Checkbox(value: false, onChanged: null)),
            DataCell(Text('Batch A')),
            DataCell(Text('John Doe')),
            DataCell(Text('\$5000')),
            DataCell(Text('20')),
            DataCell(Text('2024-06-03')),
            DataCell(Text('Paid')),
            DataCell(Icon(Icons.more_vert)),
          ]),
          DataRow(cells: [
            DataCell(Checkbox(value: false, onChanged: null)),
            DataCell(Text('Batch B')),
            DataCell(Text('Alice Smith')),
            DataCell(Text('\$5500')),
            DataCell(Text('22')),
            DataCell(Text('2024-06-03')),
            DataCell(Text('Unpaid')),
            DataCell(Icon(Icons.more_vert)),
          ]),
          DataRow(cells: [
            DataCell(Checkbox(value: false, onChanged: null)),
            DataCell(Text('Batch C')),
            DataCell(Text('Bob Martin')),
            DataCell(Text('\$4800')),
            DataCell(Text('18')),
            DataCell(Text('2024-06-03')),
            DataCell(Text('Paid')),
            DataCell(Icon(Icons.more_vert)),
          ]),
          DataRow(cells: [
            DataCell(Checkbox(value: false, onChanged: null)),
            DataCell(Text('Batch D')),
            DataCell(Text('Hirut Chela')),
            DataCell(Text('\$4800')),
            DataCell(Text('18')),
            DataCell(Text('2024-06-03')),
            DataCell(Text('Unpaid')),
            DataCell(Icon(Icons.more_vert)),
          ]),
          // Add more rows as needed
        ],
      ),
    );
  }
}
