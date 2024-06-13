import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/dataR.dart';
import 'package:flutter/material.dart';

class GeneratedSReports extends StatelessWidget {
  const GeneratedSReports({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      DataR(
        no: '1',
        medicinename: 'Medicine A',
        Date: '2023-01-01',
        Price: '100',
        quantity: '10',
        Status: 'Available',
      ),
      DataR(
        no: '2',
        medicinename: 'Medicine B',
        Date: '2023-02-01',
        Price: '200',
        quantity: '20',
        Status: 'Out of Stock',
      ),
      DataR(
        no: '3',
        medicinename: 'Medicine C',
        Date: '2023-03-01',
        Price: '300',
        quantity: '30',
        Status: 'Available',
      ),
      DataR(
        no: '4',
        medicinename: 'Medicine D',
        Date: '2023-04-01',
        Price: '400',
        quantity: '40',
        Status: 'Out of Stock',
      ),
      DataR(
        no: '5',
        medicinename: 'Medicine E',
        Date: '2023-05-01',
        Price: '500',
        quantity: '50',
        Status: 'Available',
      ),
    ];

    return Scaffold(
      appBar: Header(title: 'Report'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sales Reports',
              style: TextStyle(fontSize: 23),
            ),
            SizedBox(height: 40),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  // Small screen layout
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 198, 195, 195),
                        alignment: Alignment.center,
                        width: 100,
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Export',
                                style: TextStyle(fontSize: 13),
                              ),
                              PopupMenuButton<String>(
                                onSelected: (String value) {
                                  // Handle the selected value here
                                  print(value);
                                },
                                icon: Icon(Icons.arrow_drop_down),
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem(
                                    value: 'Export as PDF',
                                    child: Text('Export as PDF'),
                                  ),
                                  PopupMenuItem(
                                    value: 'Export as Excel',
                                    child: Text('Export as Excel'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 198, 195, 195),
                            filled: true,
                            hintText: 'Search',
                            suffixIcon: Icon(
                              Icons.search,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  // Large screen layout
                  return Row(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 198, 195, 195),
                        alignment: Alignment.center,
                        width: 100,
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Export',
                                style: TextStyle(fontSize: 13),
                              ),
                              PopupMenuButton<String>(
                                onSelected: (String value) {
                                  // Handle the selected value here
                                  print(value);
                                },
                                icon: Icon(Icons.arrow_drop_down),
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem(
                                    value: 'Export as PDF',
                                    child: Text('Export as PDF'),
                                  ),
                                  PopupMenuItem(
                                    value: 'Export as Excel',
                                    child: Text('Export as Excel'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 198, 195, 195),
                            filled: true,
                            hintText: 'Search',
                            suffixIcon: Icon(
                              Icons.search,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderRow(),
                    SizedBox(height: 10),
                    Column(
                      children: data.map((item) => _buildDataRow(item)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            _buildHeaderCell('No'),
            _buildHeaderCell('Medicine Name'),
            _buildHeaderCell('Date'),
            _buildHeaderCell('Price'),
            _buildHeaderCell('Quantity'),
            _buildHeaderCell('Status'),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataR data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            _buildDataCell(data.no),
            _buildDataCell(data.medicinename),
            _buildDataCell(data.Date),
            _buildDataCell(data.Price),
            _buildDataCell(data.quantity),
            _buildDataCell(data.Status),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Container(
      width: 100, // Specify a fixed width to make it scrollable
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Container(
      width: 100, // Specify a fixed width to make it scrollable
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
