import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/BranchdataL.dart';
import 'package:clean_a/shared/constants/dataR.dart';
import 'package:clean_a/shared/constants/disposedData.dart';
import 'package:flutter/material.dart';

class BranchList extends StatelessWidget {
  const BranchList({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      DataBL(
        Branch_id: '01',
        Name: 'yohannes dereje',
        BranchMananger: 'abel',
        Adress: 'Gulele',
        Email: 'AbelaTechB@gmail.com',
      ),
      DataBL(
        Branch_id: '01',
        Name: 'yohannes dereje',
        BranchMananger: 'abel',
        Adress: 'Gulele',
        Email: 'AbelaTechB@gmail.com',
      ),
      DataBL(
        Branch_id: '01',
        Name: 'yohannes dereje',
        BranchMananger: 'abel',
        Adress: 'Gulele',
        Email: 'AbelaTechB@gmail.com',
      ),
      DataBL(
        Branch_id: '01',
        Name: 'yohannes dereje',
        BranchMananger: 'abel',
        Adress: 'Gulele',
        Email: 'AbelaTechB@gmail.com',
      ),
      DataBL(
        Branch_id: '01',
        Name: 'yohannes dereje',
        BranchMananger: 'abel',
        Adress: 'Gulele',
        Email: 'AbelaTechB@gmail.com',
      ),
      DataBL(
        Branch_id: '01',
        Name: 'yohannes dereje',
        BranchMananger: 'abel',
        Adress: 'Gulele',
        Email: 'AbelaTechB@gmail.com',
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
                    'Branch List',
                    style: TextStyle(fontSize: isTablet ? 23 : 20),
                  ),
                  Text(
                    'View and Edit branch',
                    style: TextStyle(fontSize: isTablet ? 23 : 20),
                  ),
                  SizedBox(height: isTablet ? 40 : 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            backgroundColor: Color.fromARGB(236, 27, 228, 4),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.add, color: Colors.white, size: isTablet ? 17 : 15),
                              SizedBox(width: isTablet ? 17 : 10),
                              Text('Add Items', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(width: isTablet ? 40 : 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.format_line_spacing_sharp, color: Colors.black, size: isTablet ? 17 : 15),
                              SizedBox(width: isTablet ? 17 : 10),
                              Text('Selected By', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(width: isTablet ? 40 : 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            backgroundColor: const Color.fromARGB(255, 230, 79, 68),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.white, size: isTablet ? 17 : 15),
                              SizedBox(width: isTablet ? 17 : 10),
                              Text('Delete Items', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isTablet ? 40 : 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Table(
                      columnWidths: {
                        0: FixedColumnWidth(isTablet ? 150 : 120),
                        1: FixedColumnWidth(isTablet ? 150 : 120),
                        2: FixedColumnWidth(isTablet ? 150 : 120),
                        3: FixedColumnWidth(isTablet ? 150 : 120),
                        4: FixedColumnWidth(isTablet ? 150 : 120),
                        5: FixedColumnWidth(isTablet ? 150 : 120),
                      },
                      children: [
                        _buildHeaderRow(isTablet),
                        ...data.map((item) => _buildDataRow(item, isTablet)).toList(),
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

  TableRow _buildHeaderRow(bool isTablet) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildHeaderCell('Branch_Id', isTablet),
        _buildHeaderCell('Name', isTablet),
        _buildHeaderCell('Branch_Manager', isTablet),
        _buildHeaderCell('Adress', isTablet),
        _buildHeaderCell('Email', isTablet),
        _buildHeaderCell('Actions', isTablet),
      ],
    );
  }

  TableRow _buildDataRow(DataBL data, bool isTablet) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildDataCell(data.Branch_id, isTablet),
        _buildDataCell(data.Name, isTablet),
        _buildDataCell(data.BranchMananger, isTablet),
        _buildDataCell(data.Adress, isTablet),
        _buildDataCell(data.Email, isTablet),
        _buildDataCell('', isAction: true, isTablet),
      ],
    );
  }

  Widget _buildHeaderCell(String text, bool isTablet) {
    return Padding(
      padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet, {bool isAction = false}) {
    return Padding(
      padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
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
            ),
    );
  }
}
