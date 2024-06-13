import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/dataR.dart';
import 'package:clean_a/shared/constants/disposedData.dart';
import 'package:flutter/material.dart';

class DisposedList extends StatelessWidget {
  const DisposedList({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      DataDis(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Catagory: 'painkiller',
        Date: '2023-01-01',
        Price: '100 etb.',
        ExpiryDate: '12/12/23',
      ),
      DataDis(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Catagory: 'painkiller',
        Date: '2023-01-01',
        Price: '100 etb.',
        ExpiryDate: '12/12/23',
      ),
      DataDis(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Catagory: 'painkiller',
        Date: '2023-01-01',
        Price: '100 etb.',
        ExpiryDate: '12/12/23',
      ),
      DataDis(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Catagory: 'painkiller',
        Date: '2023-01-01',
        Price: '100 etb.',
        ExpiryDate: '12/12/23',
      ),
      DataDis(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Catagory: 'painkiller',
        Date: '2023-01-01',
        Price: '100 etb.',
        ExpiryDate: '12/12/23',
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
                    'Disposed Items',
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
                    child: Column(
                      children: [
                        _buildHeaderRow(isTablet),
                        SizedBox(height: 10),
                        ...data.map((item) => Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: _buildDataRow(item, isTablet),
                        )).toList(),
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

  Widget _buildHeaderRow(bool isTablet,) {
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
            _buildHeaderCell('Date', isTablet),
            _buildHeaderCell('Price', isTablet),
            _buildHeaderCell('Category', isTablet),
            _buildHeaderCell('ExpiryDate', isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataDis data, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildDataCell(data.Batch, isTablet,),
            _buildDataCell(data.ProductName, isTablet),
            _buildDataCell(data.Date, isTablet),
            _buildDataCell(data.Price, isTablet),
            _buildDataCell(data.Catagory, isTablet),
            _buildDataCell(data.ExpiryDate, isTablet),
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
}
