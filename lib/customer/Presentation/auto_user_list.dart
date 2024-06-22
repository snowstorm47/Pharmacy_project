import 'package:clean_a/shared/constants/data_model.dart';
import 'package:flutter/material.dart';

import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';

import 'package:clean_a/shared/constants/medicine_data.data.dart';
import 'package:flutter/widgets.dart';

class AuthorizedUser extends StatelessWidget {
  const AuthorizedUser({super.key});

  @override



  Widget build(BuildContext context) {
    int totalPages = 3;
    final data = [
      DataModel(
        employeeId: '01',
        employeeName: 'Johannes Dereje',
        phone: '+2311149021',
        companyName: 'Metec',
        email: '@example.com',
      ),
      DataModel(
        employeeId: '02',
        employeeName: 'Eyuna Ketene',
        phone: '+2311149021',
        companyName: 'ABC',
        email: '@example.com',
      ),
      DataModel(
        employeeId: '03',
        employeeName: 'Johann',
        phone: '+2311149021',
        companyName: 'XY',
        email: '@example.com',
      ),
      DataModel(
        employeeId: '04',
        employeeName: 'Chalutz Chela',
        phone: '+2311149021',
        companyName: 'LT',
        email: '@example.com',
      ),
      DataModel(
        employeeId: '05',
        employeeName: 'eric',
        phone: '+2311149021',
        companyName: 'AY',
        email: '@example.com',
      ),
      DataModel(
        employeeId: '06',
        employeeName: 'Wertz Zend',
        phone: '+2311149021',
        companyName: 'SIT',
        email: '@example.com',
      ),
    ];

    return Scaffold(



      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Authorized Users List',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins.regular',
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Here are the Authorized Users of Corporate Customers',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: const Text(
                      'Filter By',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(236, 27, 228, 4)),
                    onPressed: () {},
                    child: const Text(
                      '+  Add User',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
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
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {}, // No functionality needed
                  child: const Text(
                    'Prev',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 1.0),
                for (int i = 1; i <= totalPages; i++)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: null, // No functionality needed
                    child: Text('$i'),
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {}, // No functionality needed
                  child: const Text(
                    'Next',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
