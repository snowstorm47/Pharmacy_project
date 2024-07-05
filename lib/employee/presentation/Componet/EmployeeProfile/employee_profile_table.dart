import 'package:flutter/material.dart';

import 'delete_employee_popup.dart';
import 'edit_employee_popup.dart';

class EmployeeProfileTable extends StatefulWidget {
  final List<Map<String, String>> employees;

  const EmployeeProfileTable({super.key, required this.employees});

  @override
  EmployeeProfileTableState createState() => EmployeeProfileTableState();
}

class EmployeeProfileTableState extends State<EmployeeProfileTable> {
  void _showEditEmployeePopup(int index) async {
    final editedEmployee = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) =>
          EditEmployeePopup(employee: widget.employees[index]),
    );

    if (editedEmployee != null) {
      setState(() {
        widget.employees[index] = editedEmployee;
      });
    }
  }

  void _showDeleteEmployeePopup(int index) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => DeleteEmployeePopup(
          employeeName: widget.employees[index]['name'] ?? ''),
    );

    if (shouldDelete == true) {
      setState(() {
        widget.employees.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 50), // Adjust the padding around the table
        child: DataTable(
          columnSpacing:
              20, // Adjust this value to decrease the spacing between columns
          columns: const [
            DataColumn(
                label: Text('Name', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Position', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Address', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Location', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Phone', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Email', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Actions', style: TextStyle(color: Colors.white))),
          ],
          rows: List.generate(
            widget.employees.length,
            (index) => DataRow(
              cells: [
                DataCell(Text(widget.employees[index]['name'] ?? '')),
                DataCell(Text(widget.employees[index]['position'] ?? '')),
                DataCell(Text(widget.employees[index]['address'] ?? '')),
                DataCell(Text(widget.employees[index]['location'] ?? '')),
                DataCell(Text(widget.employees[index]['phone'] ?? '')),
                DataCell(Text(widget.employees[index]['email'] ?? '')),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showEditEmployeePopup(index);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _showDeleteEmployeePopup(index);
                      },
                    ),
                  ],
                )),
              ],
            ),
          ),
          headingRowColor: MaterialStateProperty.all(Colors.blue),
        ),
      ),
    );
  }
}
