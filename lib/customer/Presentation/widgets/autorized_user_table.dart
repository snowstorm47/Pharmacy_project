import 'package:clean_a/shared/constants/data_model.dart';
import 'package:flutter/material.dart';

class UserDataTable extends StatelessWidget {
  final List<DataModel> data;

  const UserDataTable({required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTableTheme(
        data: DataTableThemeData(
          headingRowColor: MaterialStateProperty.all(Colors.blue),
          dataRowColor: MaterialStateProperty.all(Colors.grey[200]),
          headingTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          dataTextStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Employee_Id')),
            DataColumn(label: Text('Employee_Name')),
            DataColumn(label: Text('Phone')),
            DataColumn(label: Text('Company Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Actions')),
          ],
          rows: data
              .map(
                (item) => DataRow(
                  cells: [
                    DataCell(Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (bool? value) {
                            // Add your checkbox functionality here
                          },
                        ),
                        const SizedBox(width: 8.0),
                        Text(item.employeeId),
                      ],
                    )),
                    DataCell(Text(item.employeeName)),
                    DataCell(Text(item.phone)),
                    DataCell(Text(item.companyName)),
                    DataCell(Text(item.email)),
                    const DataCell(Row(
                      children: [
                        Icon(
                          Icons.message,
                          color: Colors.black54,
                          size: 17,
                        ),
                        SizedBox(width: 7.0),
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 17,
                        ),
                        SizedBox(width: 7.0),
                        Icon(
                          Icons.edit,
                          color: Colors.black54,
                          size: 17,
                        ),
                      ],
                    )),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
