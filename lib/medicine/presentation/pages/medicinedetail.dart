import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';

import 'package:clean_a/shared/constants/medicine_data.data.dart';
import 'package:flutter/widgets.dart'; // Adjust import path as needed
// Adjust import path as needed

class MedicineDetail extends StatefulWidget {
  const MedicineDetail({super.key});

  @override
  MedicineDetailState createState() => MedicineDetailState();
}

class MedicineDetailState extends State<MedicineDetail> {
  bool isSideMenuOpen = false;

  void toggleSideMenu() {
    setState(() {
      isSideMenuOpen = !isSideMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = 3;
    final data = [
      DataMD(
        medicineName: 'amoxicillin',
        id: '29/40',
        genericName: 'hefted',
        category: 'painkiller',
        weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: true,
        isTaxable: true,
      ),
      DataMD(
        medicineName: 'amoxicillin',
        id: '2940',
        genericName: 'heated',
        category: 'painkiller',
        weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: false,
        isTaxable: true,
      ),
      DataMD(
        medicineName: 'amoxicillin',
        id: '2940',
        genericName: 'hefted',
        category: 'painkiller',
        weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: true,
        isTaxable: false,
      ),
      DataMD(
        medicineName: 'amoxicillin',
        id: '2940',
        genericName: 'keyed',
        category: 'painkiller',
        weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: false,
        isTaxable: true,
      ),
      DataMD(
        medicineName: 'amoxicillin',
        id: '2940',
        genericName: 'eyed',
        category: 'painkiller',
        weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: true,
        isTaxable: true,
      ),
      DataMD(
        medicineName: 'amoxicillin',
        id: '2940',
        genericName: 'leyte',
        category: 'painkiller',
        weight: '200mg',
        expiryDate: '12/12/23',
        isPrescribed: true,
        isTaxable: true,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F0),
      body: SafeArea(
        child: Stack(
          children: [
            // Main content area
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar (only for desktop)
                if (ResponsiveD.isDesktop(context))
                  Expanded(
                    child: SideMenu(
                      onClose: toggleSideMenu,
                    ),
                  ),
                // Main content
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      HeaderPage(
                        onMenuPressed: toggleSideMenu,
                        isSideMenuOpen: isSideMenuOpen,
                      ),
                      // Static Title
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          top: 20,
                        ),
                        child: Text(
                          'Medicine Detail',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins.regular',
                          ),
                        ),
                      ),
                      // Content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: _buildMedicineDetailTable(data, totalPages),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Sidebar (for mobile and tablet)
            if (!ResponsiveD.isDesktop(context) && isSideMenuOpen)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: SideMenu(
                  onClose: toggleSideMenu,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicineDetailTable(List<DataMD> data, int totalPages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              child: const Text(
                'Filter By',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(236, 27, 228, 4)),
              onPressed: () {},
              child: const Text(
                'Sort By',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              _buildHeaderRow(),
              const SizedBox(height: 10.0),
              ...data.map((item) => _buildDataRow(item)).toList(),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
children: [
ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    backgroundColor: Color.fromARGB(236, 27, 228, 4)),
  onPressed: (
 

  ){
_Addmedicine(context);


  }, child: Text('Add Medicine',style: TextStyle(color: Colors.white),)),
const SizedBox(width: 20.0),

ElevatedButton(
   style: ElevatedButton.styleFrom(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    backgroundColor: Colors.blue),
  onPressed: (

  ){

    updatemedicine(context);
  }, child: Text('Update Medicine',style: TextStyle(color: Colors.white),)),
const SizedBox(width: 20.0),


ElevatedButton(
   style: ElevatedButton.styleFrom(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    backgroundColor: Colors.red),
  onPressed: (

  ){
    _deletedialog(context);
  }, child: Text('Delete Medicine',style: TextStyle(color: Colors.white),)),
],






        ),
          const SizedBox(height: 20.0),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
              onPressed: () {}, // No functionality needed
              child: const Text(
                'Prev',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(width: 1.0),
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
              child: const Text(
                'Next',
              ),
            ),
          ],
        ),
      ],
    );
  }
void _Addmedicine(BuildContext context){

showDialog(
  context: context, 
  builder: (BuildContext context){

return Dialog(
child: Container(
 width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(20),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Add new medicine',style: TextStyle(fontSize: 23),),
SizedBox(height: 10,),
Text('You can  add new medicine here',style: TextStyle(fontSize: 13),),
SizedBox(height: 20,),
Expanded(
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
    children: [
    TextField(
      decoration: InputDecoration(
    labelText: 'Medicine name',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Medicine ID',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Catagory',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Weight',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Generic name',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Supplier price',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Selling price',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Expiry date',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Stock',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Taxable',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Prescription based',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      maxLines: 4,
      decoration: InputDecoration(
    labelText: 'Details',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
children: [
ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4)),
  onPressed: (){}, child: Text('Submit',style: TextStyle(color: Colors.white),)),
SizedBox(width: 20,),
ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
  onPressed: (){}, child: Text('Reset',style: TextStyle(color: Colors.white),)),



],



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
  
  
  );




}

void updatemedicine(BuildContext context){
showDialog(
  context: context, 
  builder: (BuildContext context){

return Dialog(
child: Container(
 width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(20),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Update medicine',style: TextStyle(fontSize: 23),),
SizedBox(height: 10,),
Text('You can update the medicines here',style: TextStyle(fontSize: 13),),
SizedBox(height: 20,),
Expanded(
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
    children: [
    TextField(
      decoration: InputDecoration(
    labelText: 'Medicine name',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Medicine ID',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Catagory',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Weight',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Generic name',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Supplier price',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Selling price',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Expiry date',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Stock',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Taxable',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      decoration: InputDecoration(
    labelText: 'Prescription based',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
     TextField(
      maxLines: 4,
      decoration: InputDecoration(
    labelText: 'Details',
    border: OutlineInputBorder(),
    ),
    ),
    SizedBox(height: 10,),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
children: [
ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4)),
  onPressed: (){}, child: Text('Submit',style: TextStyle(color: Colors.white),)),
SizedBox(width: 20,),
ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
  onPressed: (){}, child: Text('Reset',style: TextStyle(color: Colors.white),)),



],



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
  
  
  );









}



  void _deletedialog(BuildContext context){
showDialog(
  context: context,
 builder:(BuildContext context) {
return AlertDialog(
title: Text('Are you sure?'),

content: Text('these data will be completly erased'),
actions: [
TextButton(
  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
  onPressed: (){}, child: Text('Discard',style: TextStyle(color: Colors.white),),),
ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4)),
  onPressed: (){}, child: Text('Delete',style: TextStyle(color: Colors.white),))

],



);


 },
 
 );


  
 




    
  }

  Widget _buildHeaderRow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _buildHeaderCell('Medicine Name'),
            _buildHeaderCell('Medicine Id'),
            _buildHeaderCell('Generic Name'),
            _buildHeaderCell('Category'),
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
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _buildDataCell(data.medicineName),
            _buildDataCell(data.id),
            _buildDataCell(data.genericName),
            _buildDataCell(data.category),
            _buildDataCell(data.weight),
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
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text,
      {bool isPrescribed = false, bool isTaxable = false}) {
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
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
    );
  }
}
