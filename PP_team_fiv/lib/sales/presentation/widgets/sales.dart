import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/BranchdataL.dart';
import 'package:clean_a/shared/constants/dataR.dart';
import 'package:clean_a/shared/constants/disposedData.dart';
import 'package:clean_a/shared/constants/salesdata.dart';
import 'package:flutter/material.dart';

class Sales extends StatelessWidget {
  const Sales({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      DataM(
        MedicineName: 'panadol',
     Catagory: 'painkiller',
        Dosage: '30mg',
        Instock: '4',
        PricePerunit: '100birr',
      ),
      DataM(
        MedicineName: 'panadol',
     Catagory: 'painkiller',
        Dosage: '30mg',
        Instock: '4',
        PricePerunit: '100birr',
      ),
      DataM(
        MedicineName: 'panadol',
     Catagory: 'painkiller',
        Dosage: '30mg',
        Instock: '4',
        PricePerunit: '100birr',
      ),
      DataM(
        MedicineName: 'panadol',
     Catagory: 'painkiller',
        Dosage: '30mg',
        Instock: '4',
        PricePerunit: '100birr',
      ),
      DataM(
        MedicineName: 'panadol',
     Catagory: 'painkiller',
        Dosage: '30mg',
        Instock: '4',
        PricePerunit: '100birr',
      ),
    ];

    return Scaffold(
      appBar: Header(title: 'Sales'),
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
                    'Daily Sales',
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
                              Text('Filter By', style: TextStyle(color: Colors.white)),
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
                              Text('Add to Cart', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(width: isTablet ? 40 : 20),
                        
                      ],
                    ),
                  ),
                  
                  Container(
              
                   color: Colors.white,
                     child: Padding(padding:  EdgeInsets.all(isTablet ? 12.0 : 8.0),
                     child: Row(
                        children: [
Text('Available Terms',style: TextStyle(fontSize: 20),),
          SizedBox(height: isTablet ? 40 : 20),
          Icon(Icons.search),


                        ],

                     ),
                     
                     
                     ),

                  ),
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
        _buildHeaderCell('Medicine Name', isTablet),
        _buildHeaderCell('Catagory', isTablet),
        _buildHeaderCell('Dosage', isTablet),
        _buildHeaderCell('Instock', isTablet),
        _buildHeaderCell('Priceperunit', isTablet),
        _buildHeaderCell('Actions', isTablet),
      ],
    );
  }

  TableRow _buildDataRow(DataM data, bool isTablet) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildDataCell(data.MedicineName, isTablet),
        _buildDataCell(data.Catagory, isTablet),
        _buildDataCell(data.Dosage, isTablet),
        _buildDataCell(data.Instock, isTablet),
        _buildDataCell(data.PricePerunit, isTablet),
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
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {
                    // Add your checkbox functionality here
                  },
                ),
                SizedBox(width: 8.0),
                Container(
                  width: 50,
                  height: 24,
                  color: Colors.white,
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
