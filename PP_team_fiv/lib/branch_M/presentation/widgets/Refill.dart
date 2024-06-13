import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/DataB.dart';
import 'package:flutter/material.dart';

class RefillRequest extends StatelessWidget {
  const RefillRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      DataB(
        Branch_id: '01',
        Name: 'yohannes dereje',
        Request: 'abel',
        Date: 'Gulele',
        Requested_By: 'AbelaTechB@gmail.com',
      ),
      DataB(
        Branch_id: '01',
        Name: 'yohannes dereje',
        Request: 'abel',
        Date: 'Gulele',
        Requested_By: 'AbelaTechB@gmail.com',
      ),
      DataB(
        Branch_id: '01',
        Name: 'yohannes dereje',
        Request: 'abel',
        Date: 'Gulele',
        Requested_By: 'AbelaTechB@gmail.com',
      ),
      DataB(
        Branch_id: '01',
        Name: 'yohannes dereje',
        Request: 'abel',
        Date: 'Gulele',
        Requested_By: 'AbelaTechB@gmail.com',
      ),
      DataB(
        Branch_id: '01',
        Name: 'yohannes dereje',
        Request: 'abel',
        Date: 'Gulele',
        Requested_By: 'AbelaTechB@gmail.com',
      ),
      DataB(
        Branch_id: '01',
        Name: 'yohannes dereje',
        Request: 'abel',
        Date: 'Gulele',
        Requested_By: 'AbelaTechB@gmail.com',
      ),
    ];

    return Scaffold(
      appBar: Header(title: 'Return'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          double padding = isTablet ? 46.0 : 16.0;

          return Padding(
            padding: EdgeInsets.all(padding),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Refill requests',
                    style: TextStyle(fontSize: isTablet ? 23 : 20),
                  ),
                  Text(
                    'List of refill requests',
                    style: TextStyle(fontSize: isTablet ? 23 : 20),
                  ),
                  SizedBox(height: isTablet ? 40 : 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        _buildHeaderRow(isTablet),
                        Column(
                          children: data.map((item) => _buildDataRow(item, isTablet)).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeaderRow(bool isTablet) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildHeaderCell('Branch_Id', isTablet),
            _buildHeaderCell('Name', isTablet),
            _buildHeaderCell('Request', isTablet),
            _buildHeaderCell('Date', isTablet),
            _buildHeaderCell('Requested By', isTablet),
            _buildHeaderCell('Actions', isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataB data, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildDataCell(data.Branch_id, isTablet),
            _buildDataCell(data.Name, isTablet),
            _buildDataCell(data.Request, isTablet),
            _buildDataCell(data.Date, isTablet),
            _buildDataCell(data.Requested_By, isTablet),
            _buildDataCell('', isAction: true, isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, bool isTablet) {
    return Container(
      width: isTablet ? 150 : 120,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet, {bool isAction = false}) {
    return Container(
      width: isTablet ? 150 : 120,
      child: isAction
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.message,
                  color: Colors.black,
                  size: isTablet ? 17 : 15,
                ),
                SizedBox(width: isTablet ? 17 : 10),
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: isTablet ? 17 : 15,
                ),
                SizedBox(width: isTablet ? 17 : 10),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: isTablet ? 17 : 15,
                ),
              ],
            )
          : Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: isTablet ? 16 : 14,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
