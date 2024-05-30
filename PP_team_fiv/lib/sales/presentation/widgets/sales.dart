import 'package:clean_a/header.dart';
import 'package:clean_a/shared/constants/datamodel.dart';
import 'package:clean_a/shared/constants/salesdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class sales extends StatelessWidget {
  const sales({super.key});

  @override
  Widget build(BuildContext context) {
    int _totalPages = 3;
    final data = [
      DataM(
         MedicineName: 'MedicineName',
          Catagory: 'Catagory',
          Dosage: 'Dosage',
          Instock: 'Instock',
          PricePerunit: 'PricePerunit'),
          DataM(
          MedicineName: 'Advil',
          Catagory: 'Painkiller',
          Dosage: '200mg',
          Instock: '38',
          PricePerunit: '4'),
          DataM(
          MedicineName: 'Alieve',
          Catagory: 'PainRelief',
          Dosage: '200mg',
          Instock: '40',
          PricePerunit: '7'),
          DataM(
          MedicineName: 'Mucinex',
          Catagory: 'cold&flu',
          Dosage: '200mg',
          Instock: '27',
          PricePerunit: '21'),
          DataM(
          MedicineName: 'Gas-x',
          Catagory: 'digestion',
          Dosage: '200mg',
          Instock: '40',
          PricePerunit: '3'),
          DataM(
          MedicineName: 'mucinex',
          Catagory: 'cold&flu',
          Dosage: '200mg',
          Instock: '27',
          PricePerunit: '21'),
    ];

    return Scaffold(
      appBar: Header(title: 'Sales'),
      
      body: Padding(
        padding: const EdgeInsets.all(49.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
              Text('Daily Sales',style: TextStyle(fontSize: 24),),
           
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 113, 181, 237),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
                  ),
                  onPressed: () {},
                  child: Text(
                    'Filter By',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
              width: 20,
            ),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                    backgroundColor: Color.fromARGB(236, 27, 228, 4),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
  SizedBox(
              height: 20,
            ),
       Container(
        height: 40,
        color: Colors.white,
child: Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Text('Available terms',style: TextStyle(fontSize: 20),),
  SizedBox(width: 40,),
  Icon(Icons.search),
  
  ],
  
  ),
),



       ),


 SizedBox(
              height: 20,
            ),


 _buildHeaderRow(),
 Expanded(
   child: ListView.separated(
  itemBuilder: (context, index) => _buildDataRow(data[index]),
    separatorBuilder: (context, index) => SizedBox(height: 10,), 
    itemCount: data.length,
    ),
 ),

 SizedBox(
              height: 20,
            ),
            Row(
         children: [
ElevatedButton(
  style: ElevatedButton.styleFrom(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))

  ),
  onPressed: (){}, child: Text('Prev',style: TextStyle(color: Colors.black),)),

for(int i=1; i<=_totalPages;i++)
ElevatedButton(
  style: ElevatedButton.styleFrom(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))

  ),onPressed: (){}, child: Text('$i',style: TextStyle(color: Colors.black45),)),


ElevatedButton(
  style: ElevatedButton.styleFrom(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))

  ),onPressed: (){}, child: Text('Next',style: TextStyle(color: Colors.black),)),

SizedBox(
              width: 600,
            ),
ElevatedButton(
  style: ElevatedButton.styleFrom(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)
),
backgroundColor: Color.fromARGB(236, 27, 228, 4)
  ),onPressed: (){}, child: Text('Add To Cart',style: TextStyle(color: Colors.white),)),

ElevatedButton(
  style: ElevatedButton.styleFrom(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))

  ),onPressed: (){}, child: Text('Cancel',style: TextStyle(color: Colors.black),))




         ],


            )



          ],
        ),
      ),
      );
  }



  ///////////////////////////////////////////
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
            _buildHeaderCell('MedicineName'),
            _buildHeaderCell('Catagory'),
            _buildHeaderCell('Dosage'),
            _buildHeaderCell('Instock'),
            _buildHeaderCell('PricePerunit'),
            _buildHeaderCell('Quantity'),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataM data) {
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
            
            _buildDataCell(data.MedicineName),
            _buildDataCell(data.MedicineName),
            _buildDataCell(data.Catagory),
            _buildDataCell(data.Dosage),
            _buildDataCell(data.Instock),
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
          ?  Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {
                      // Add your checkbox functionality here
                    },
                  ),
                  SizedBox(width: 8.0),
                 //
                 // _buildDataCell(data.MedicineName),
                 Container(
                  width: 100,
                  height: 24,
                  color: Colors.white,
                 )
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





