import 'package:clean_a/employee/domain/entities/employee.dart';
import 'package:flutter/material.dart';

import 'delete_employee_popup.dart';
import 'edit_employee_popup.dart';

class EmployeeProfileTable extends StatelessWidget {
  final List<Employee> employees;
  final Function(int) onEditEmployee;
  final Function(int) onDeleteEmployee;

  const EmployeeProfileTable({
    super.key,
    required this.employees,
    required this.onEditEmployee,
    required this.onDeleteEmployee,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: DataTable(
          columnSpacing: 20,
          columns: const [
            DataColumn(
                label: Text('First Name', style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('Last Name', style: TextStyle(color: Colors.white))),
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
            employees.length,
            (index) => DataRow(
              cells: [
                DataCell(Text(employees[index].FirstName ?? '')),
                DataCell(Text(employees[index].LastName ?? '')),
                DataCell(Text(employees[index].role ?? '')),
                DataCell(Text(employees[index].Address ?? '')),
                DataCell(Text(employees[index].location ?? '')),
                DataCell(Text(employees[index].Phone ?? '')),
                DataCell(Text(employees[index].email ?? '')),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => onEditEmployee(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => onDeleteEmployee(index),
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
