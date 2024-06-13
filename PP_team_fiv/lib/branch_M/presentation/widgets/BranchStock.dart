import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/BranchdataL.dart';
import 'package:clean_a/shared/constants/Bsdata.dart';
import 'package:clean_a/shared/constants/DataB.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BranchStock extends StatefulWidget {
  const BranchStock({super.key});

  @override
  State<BranchStock> createState() => _SupplierListsState();
}

class _SupplierListsState extends State<BranchStock> {
  @override
  Widget build(BuildContext context) {
    int _totalPages = 3;
    final data = [
      DataBS(
        Batch: '1013/23',
        ProductName: 'paracetamol',
        Catagory: 'Painkiller',
        price: '243Birr',
        expiryDate: '23/12/23',
        Quantity: '120',
      ),
      DataBS(
        Batch: '1013/23',
        ProductName: 'Amoxcillin',
        Catagory: 'Painkiller',
        price: '243Birr',
        expiryDate: '23/06/24',
        Quantity: '120',
      ),
      DataBS(
        Batch: '1013/23',
        ProductName: 'omyprazol',
        Catagory: 'Painkiller',
        price: '243Birr',
        expiryDate: '23/07/24',
        Quantity: '120',
      ),
      DataBS(
        Batch: '1013/23',
        ProductName: 'panadol',
        Catagory: 'Painkiller',
        price: '243Birr',
        expiryDate: '23/08/23',
        Quantity: '120',
      ),
      DataBS(
        Batch: '1013/23',
        ProductName: 'paracetamol',
        Catagory: 'Painkiller',
        price: '243Birr',
        expiryDate: '23/09/24',
        Quantity: '120',
      ),
      DataBS(
        Batch: '1013/23',
        ProductName: 'insulin',
        Catagory: 'Painkiller',
        price: '243Birr',
        expiryDate: '3/07/24',
        Quantity: '120',
      ),
    ];

    return Scaffold(
      appBar: Header(title: 'Branches'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          bool isMobile = constraints.maxWidth < 600;
          EdgeInsets padding = isTablet ? EdgeInsets.all(50.0) : EdgeInsets.all(20.0);

          return Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Branch Stock',
                  style: TextStyle(
                    fontSize: isTablet ? 24 : 20,
                    fontFamily: 'Poppins.regular',
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'AshewaMeda Branch',
                  style: TextStyle(fontSize: isTablet ? 18 : 16),
                ),
                SizedBox(height: 20.0),
                isTablet
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                onPressed: () {},
                                child: Text(
                                  'Filter By',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
SizedBox(height: 10.0),
                          _buildStatusKey(),

                            ],
                          ),
                          
                           SizedBox(height: 20.0),
                _buildHeaderRow(isTablet),
                        ],
                      )
                    : Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                            onPressed: () {},
                            child: Text(
                              'Filter By',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                            SizedBox(height: 20.0),
                          _buildStatusKey(),
                          
                        ],
                      ),
               
                SizedBox(height: 10.0),
                Expanded(
                  child: isMobile
                      ? ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) => _buildDataListTile(data[index]),
                        )
                      : ListView.separated(
                          itemCount: data.length,
                          separatorBuilder: (context, index) => SizedBox(height: 10.0),
                          itemBuilder: (context, index) => _buildDataRow(data[index], isTablet, isMobile),
                        ),
                ),
                SizedBox(height: 20.0),
                _buildPaginationControls(_totalPages, isTablet, isMobile),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeaderRow(bool isTablet ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildHeaderCell('Batch', isTablet),
            _buildHeaderCell('Product Name', isTablet),
            _buildHeaderCell('Catagory', isTablet),
            _buildHeaderCell('Price', isTablet),
            _buildHeaderCell('Expiry Date', isTablet),
            _buildHeaderCell('Quantity', isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataBS data, bool isTablet, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        color: _getStatusColor(data.expiryDate),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDataCell(data.Batch, isTablet, isMobile),
            _buildDataCell(data.ProductName, isTablet, isMobile),
            _buildDataCell(data.Catagory, isTablet, isMobile),
            _buildDataCell(data.price, isTablet, isMobile),
            _buildDataCell(data.expiryDate, isTablet, isMobile),
            _buildDataCell(data.Quantity, isTablet, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildDataListTile(DataBS data) {
    return ListTile(
      tileColor: _getStatusColor(data.expiryDate),
      title: Text(data.ProductName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Batch: ${data.Batch}'),
          Text('Catagory: ${data.Catagory}'),
          Text('Price: ${data.price}'),
          Text('Expiry Date: ${data.expiryDate}'),
          Text('Quantity: ${data.Quantity}'),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text, bool isTablet) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: isTablet ? 14 : 7,
          
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet, bool isMobile) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: isTablet ? 14 : (isMobile ? 10 : 12),
          
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
      return Color.fromARGB(255, 203, 239, 59); // pending
    } else {
      return const Color.fromARGB(255, 97, 190, 101); // safe
    }
  }

  Widget _buildPaginationControls(int totalPages, bool isTablet, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
          onPressed: () {}, // No functionality needed
          child: Text(
            'Prev',
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(width: 1.0),
        for (int i = 1; i <= totalPages; i++)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))),
            onPressed: null, // No functionality needed
            child: Text('$i'),
          ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
          onPressed: () {}, // No functionality needed
          child: Text(
            'Next',
          ),
        ),
      ],
    );
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
