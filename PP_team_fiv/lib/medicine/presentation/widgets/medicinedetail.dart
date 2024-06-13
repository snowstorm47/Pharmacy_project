import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/constants.dart';
import 'package:clean_a/shared/constants/datamodel.dart';
import 'package:clean_a/shared/constants/meddata.dart';
import 'package:flutter/material.dart';

class MedicineDetail extends StatelessWidget {
  const MedicineDetail({super.key});

  @override
  Widget build(BuildContext context) {
    int _totalPages = 3;
    final data = [
      DataMD(
        medicineName: 'amoxcillin',
        Id: '29/40',
        GenericName: 'yeyetd',
        Catagory: 'painkiller',
        Weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: true,
        isTaxable: true,
      ),
      DataMD(
        medicineName: 'amoxcillin',
        Id: '2940',
        GenericName: 'yeyetd',
        Catagory: 'painkiller',
        Weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: false,
        isTaxable: true,
      ),
      DataMD(
        medicineName: 'amoxcillin',
        Id: '2940',
        GenericName: 'yeyetd',
        Catagory: 'painkiller',
        Weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: true,
        isTaxable: false,
      ),
      DataMD(
        medicineName: 'amoxcillin',
        Id: '2940',
        GenericName: 'yeyetd',
        Catagory: 'painkiller',
        Weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: false,
        isTaxable: true,
      ),
      DataMD(
        medicineName: 'amoxcillin',
        Id: '2940',
        GenericName: 'yeyetd',
        Catagory: 'painkiller',
        Weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: true,
        isTaxable: true,
      ),
      DataMD(
        medicineName: 'amoxcillin',
        Id: '2940',
        GenericName: 'yeyetd',
        Catagory: 'painkiller',
        Weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: true,
        isTaxable: true,
      ),
    ];

    return Scaffold(
      appBar: Header(title: 'Medicine'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Medicine Details',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins.regular',
              ),
            ),
            SizedBox(height: 20.0),
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
                    'Sort By',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  _buildHeaderRow(),
                  SizedBox(height: 10.0),
                  ...data.map((item) => _buildDataRow(item)).toList(),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  onPressed: (){}, // No functionality needed
                  child: Text('Prev',style: TextStyle(color: Colors.black),),
                ),
                SizedBox(width: 1.0),
                for (int i = 1; i <= _totalPages; i++)
                  ElevatedButton(
                    style:  ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                    onPressed: null, // No functionality needed
                    child: Text('$i'),
                  ),
                ElevatedButton(
                  style:  ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  onPressed: (){}, // No functionality needed
                  child: Text('Next',),
                ),
              ],
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
            _buildHeaderCell('Medicine Name'),
            _buildHeaderCell('Medicine Id'),
            _buildHeaderCell('Generic Name'),
            _buildHeaderCell('Catagory'),
            _buildHeaderCell('Weight (mg)'),
            _buildHeaderCell('Expiry Date'),
            _buildHeaderCell('Taxable'),
            _buildHeaderCell('Prescription'),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataMD data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            _buildDataCell(data.medicineName),
            _buildDataCell(data.Id),
            _buildDataCell(data.GenericName),
            _buildDataCell(data.Catagory),
            _buildDataCell(data.Weight),
            _buildDataCell(data.expiryDate),
            _buildDataCell('', isTaxable: data.isTaxable),
            _buildDataCell('', isPrescribed: data.isPrescribed),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Container(
      width: 120,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, {bool isPrescribed = false, bool isTaxable = false}) {
    return Container(
      width: 120,
      child: isPrescribed || isTaxable
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isPrescribed)
                  Checkbox(
                    value: isPrescribed,
                    onChanged: (bool? value) {},
                  ),
                if (isTaxable)
                  Checkbox(
                    value: isTaxable,
                    onChanged: (bool? value) {},
                  ),
              ],
            )
          : Text(
              text,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
    );
  }
}
