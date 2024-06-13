

import 'package:flutter/material.dart';
import 'package:clean_a/header.dart';

class AddDisposed extends StatefulWidget {
  const AddDisposed({super.key});

  @override
  State<AddDisposed> createState() => _AddAutoState();
}

class _AddAutoState extends State<AddDisposed> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      appBar: Header(
        title: 'Return',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: isMobile ? buildMobileLayout() : buildDesktopLayout(),
        ),
      ),
    );
  }

  Widget buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(
          'Add Disposed Items',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        SizedBox(height: 17),
        
        Text(
          'You can add disposed items by filling the form below',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        
          SizedBox(height: 30),
          Center(
            child: SizedBox(
             
              width: 170,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                 
                  backgroundColor:Color.fromARGB(235, 198, 232, 194), ),
                onPressed: (){}, child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('import file',style: TextStyle(color: Colors.black),),
                    SizedBox(width: 20,),
                    Icon(Icons.import_export),
                  ],
                )),
            ),
          ),
            SizedBox(height: 20),
        buildTextFieldsColumn(),
        SizedBox(height: 20),
        buildDescriptionAndButton(),
          SizedBox(height: 30),
          

      ],
    );
  }

  Widget buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(
          'Add disposed Items',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        SizedBox(height: 7),
        
        Text(
          'You can add disposed items by filling the form below',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        SizedBox(height: 20),

         SizedBox(height: 30),
          SizedBox(
           
            width: 170,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
               
                backgroundColor:Color.fromARGB(235, 198, 232, 194), ),
              onPressed: (){}, child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('import file',style: TextStyle(color: Colors.black),),
                  SizedBox(width: 20,),
                  Icon(Icons.import_export),
                ],
              )),
          ),
            SizedBox(height: 20),
        Row(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            // First Column
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Batch',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Type',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Quantitiy in price',
                      ),
                    ),
                     SizedBox(height: 30),
                    
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Branch_no',
                      ),
                    ),
                     SizedBox(height: 30),
                   
                     SizedBox(height: 30),
                    
                  ],
                ),
              ),
            ),
            SizedBox(width: 20), // Space between columns

            // Second Column
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Product_no',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Catagory',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Price',
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            SizedBox(width: 20), // Space between columns

            // Third Column
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Generic Name',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Amount',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      
        buildDescriptionAndButton(),
      ],
    );
  }

  Widget buildTextFieldsColumn() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Batch',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Type',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Quantity Price',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Branch_no',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Product_no',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Catagory',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Price',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Generic Name',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Amount',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Date',
          ),
        ),
      ],
    );
  }

  Widget buildDescriptionAndButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter additional description here...',
          ),
        ),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Color.fromARGB(236, 27, 228, 4),
                  minimumSize: Size(130, 40),
                ),
                onPressed: () {
                  // Add button action
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
  SizedBox(width: 20),
                ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  backgroundColor: const Color.fromARGB(255, 239, 88, 77),
                  minimumSize: Size(130, 40),
                ),
                onPressed: () {
                  // Add button action
                },
                child: Text(
                  'Discard',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
