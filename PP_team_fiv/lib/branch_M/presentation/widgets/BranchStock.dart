import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/Bsdata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BranchStock extends StatelessWidget {
  const BranchStock({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      DataBS(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Catagory: 'painkiller',
        price: '100 etb.',
        expiryDate: '23/12/23',
        Quantity: '120',
      ),
      DataBS(
        Batch: '1014/23',
        ProductName: 'Medicine B',
        Catagory: 'antibiotic',
        price: '200 etb.',
        expiryDate: '23/06/24',
        Quantity: '150',
      ),
      
      DataBS(
        Batch: '1015/23',
        ProductName: 'Medicine C',
        Catagory: 'vitamin',
        price: '150 etb.',
        expiryDate: '14/12/23',
        Quantity: '100',),
        DataBS(
        Batch: '1015/23',
        ProductName: 'Medicine d',
        Catagory: 'vitamin',
        price: '150 etb.',
        expiryDate: '23/07/24',
        Quantity: '100',
      ),
      DataBS(
        Batch: '1015/23',
        ProductName: 'Medicine e',
        Catagory: 'vitamin',
        price: '150 etb.',
        expiryDate: '14/08/23',
        Quantity: '100',),
         DataBS(
        Batch: '1015/23',
        ProductName: 'Medicine C',
        Catagory: 'vitamin',
        price: '150 etb.',
        expiryDate: '22/06/24',
        Quantity: '100',),
        
      // Add more data items as needed
    ];

    return Scaffold(
      appBar: Header(title: 'Branch'),
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
                    'Branch Stock',
                    style: TextStyle(fontSize: isTablet ? 23 : 20),
                  ),
                  Text(
                    'AshewaMeda Branch',
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
                            backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.format_line_spacing_sharp, color: Colors.black, size: isTablet ? 17 : 15),
                              SizedBox(width: isTablet ? 17 : 10),
                              Text('Filter By', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isTablet ? 40 : 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        _buildStatusKey(),
                        SizedBox(height: 10),
                        _buildHeaderRow(isTablet),
                        SizedBox(height: 10),
                        Column(
                          children: data.map((item) => Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: _buildDataRow(item, isTablet),
                          )).toList(),
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
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildHeaderCell('Batch', isTablet),
            _buildHeaderCell('Product Name', isTablet),
            _buildHeaderCell('Category', isTablet),
            _buildHeaderCell('Price', isTablet),
            _buildHeaderCell('ExpiryDate', isTablet),
            _buildHeaderCell('Quantity', isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataBS data, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: _getStatusColor(data.expiryDate), // Use the color coding function
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildDataCell(data.Batch, isTablet),
            _buildDataCell(data.ProductName, isTablet),
            _buildDataCell(data.Catagory, isTablet),
            _buildDataCell(data.price, isTablet),
            _buildDataCell(data.expiryDate, isTablet),
            _buildDataCell(data.Quantity, isTablet),
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
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet) {
    return Container(
      width: isTablet ? 150 : 120,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Color _getStatusColor(String expiryDate) {
    final now = DateTime.now();
    final expiry = DateFormat('dd/MM/yy').parse(expiryDate);
    if (expiry.isBefore(now)) {
      return const Color.fromARGB(255, 234, 109, 100); // expired
    } else if (expiry.difference(now).inDays <= 30) {
      return const Color.fromARGB(255, 203, 239, 59); // pending
    } else {
      return const Color.fromARGB(255, 97, 190, 101); // safe
    }
  }

  Widget _buildStatusKey() {
    return Row(
      children: [
        _buildKey(Color.fromARGB(255, 234, 109, 100), 'Expired'),
        SizedBox(width: 10),
        _buildKey(Color.fromARGB(255, 203, 239, 59), 'Pending'),
        SizedBox(width: 10),
        _buildKey(Color.fromARGB(255, 97, 190, 101), 'Safe'),
      ],
    );
  }

  Widget _buildKey(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}
