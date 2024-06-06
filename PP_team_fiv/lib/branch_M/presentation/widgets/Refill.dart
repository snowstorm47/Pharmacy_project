


import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/DataB.dart';

import 'package:flutter/material.dart';

class RefillRequest extends StatefulWidget {
  const RefillRequest({super.key});

  @override
  State<RefillRequest> createState() => _SupplierListsState();
}

class _SupplierListsState extends State<RefillRequest> {
  @override
  Widget build(BuildContext context) {
     int _totalPages = 3;
    final data = [
      DataB(
        Branch_id: '01',
      Name: 'yohannes dereje',
       Request: 'Paractamol',
     Date: '2/12/23',
        Requested_By: 'JohnD',
      ),
      DataB(
       Branch_id: '01',
      Name: 'yohannes dereje',
       Request: 'Paractamol',
     Date: '2/12/23',
        Requested_By: 'JohnD',
      ),
      DataB(
         Branch_id: '01',
      Name: 'yohannes dereje',
       Request: 'Paractamol',
     Date: '2/12/23',
        Requested_By: 'JohnD',
      ),
      DataB(
       Branch_id: '01',
      Name: 'yohannes dereje',
       Request: 'Paractamol',
     Date: '2/12/23',
        Requested_By: 'JohnD',
      ),
      DataB(
       Branch_id: '01',
      Name: 'yohannes dereje',
       Request: 'Paractamol',
     Date: '2/12/23',
        Requested_By: 'JohnD',
      ),
      DataB(
       Branch_id: '01',
      Name: 'yohannes dereje',
    Request: 'Paractamol',
     Date: '2/12/23',
        Requested_By: 'JohnD',
      ),
     
    ];

    return Scaffold(
      appBar: Header(title: 'Branches'),
      
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Refill Requests',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins.regular',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'List of refill requests',
              style: TextStyle(fontSize: 18),
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
               
              ],
            ),
            SizedBox(height: 20.0),
            _buildHeaderRow(),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.separated(
                itemCount: data.length,
                separatorBuilder: (context, index) => SizedBox(height: 10.0),
                itemBuilder: (context, index) => _buildDataRow(data[index]),
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
            SizedBox(width: 700.0),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildHeaderCell('Branch_Id'),
            _buildHeaderCell('Name'),
            _buildHeaderCell('Request'),
            _buildHeaderCell('Date'),
            _buildHeaderCell('Requested By'),
            _buildHeaderCell('Actions'),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataB data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {
                      // Add your checkbox functionality here
                    },
                  ),
                  SizedBox(width: 8.0),
                  _buildDataCell(data.Branch_id),
                ],
              ),
            ),
            _buildDataCell(data.Name),
            _buildDataCell(data.Request),
            _buildDataCell(data.Date),
            _buildDataCell(data.Requested_By),
            _buildDataCell('', isAction: true),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, {bool isAction = false}) {
    return Expanded(
      child: isAction
          ? Row(
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