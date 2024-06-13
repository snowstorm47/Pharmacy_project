import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/DataB.dart';
import 'package:clean_a/shared/constants/dataS.dart';
import 'package:flutter/material.dart';

class SupplierLists extends StatelessWidget {
  const SupplierLists({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      DataS(
        Supplier_id: '01',
        Name: 'yohannes dereje',
        Phone: 'abel',
       Status: 'Gulele',
       Adress: 'AbelaTechB@gmail.com',
      ),
      DataS(
        Supplier_id: '01',
        Name: 'yohannes dereje',
        Phone: 'abel',
       Status: 'Gulele',
       Adress: 'AbelaTechB@gmail.com',
      ),
      DataS(
        Supplier_id: '01',
        Name: 'yohannes dereje',
        Phone: 'abel',
       Status: 'Gulele',
       Adress: 'AbelaTechB@gmail.com',
      ),
      DataS(
        Supplier_id: '01',
        Name: 'yohannes dereje',
        Phone: 'abel',
       Status: 'Gulele',
       Adress: 'AbelaTechB@gmail.com',
      ),
      DataS(
        Supplier_id: '01',
        Name: 'yohannes dereje',
        Phone: 'abel',
       Status: 'Gulele',
       Adress: 'AbelaTechB@gmail.com',
      ),
      
      
    ];

    return Scaffold(
      appBar: Header(title: 'Supplier'),
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
                    'Supplier Lists',
                    style: TextStyle(fontSize: isTablet ? 23 : 20),
                  ),
                    SizedBox(height: 20),
                  Text(
                    'Here are your list of suppliers ',
                    style: TextStyle(fontSize: isTablet ? 23 : 20),
                  ),
                  SizedBox(height: isTablet ? 40 : 20),
                    Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {},
                  child: Text(
                    'Filter By',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(236, 27, 228, 4)),
                  onPressed: () {},
                  child: Text(
                    '+  Add User',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
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
            _buildHeaderCell('Supplier_Id', isTablet),
            _buildHeaderCell('Name', isTablet),
            _buildHeaderCell('Phone', isTablet),
            _buildHeaderCell('Status', isTablet),
            _buildHeaderCell('Adress', isTablet),
            _buildHeaderCell('Actions', isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataS data, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildDataCell(data.Supplier_id, isTablet),
            _buildDataCell(data.Name, isTablet),
            _buildDataCell(data.Phone, isTablet),
            _buildDataCell(data.Status, isTablet),
            _buildDataCell(data.Adress, isTablet),
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
