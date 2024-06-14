
import 'package:flutter/material.dart';
import 'package:clean_a/header.dart';

class AddMed extends StatefulWidget {
  const AddMed({super.key});

  @override
  State<AddMed> createState() => _AddAutoState();
}

class _AddAutoState extends State<AddMed> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      appBar: Header(
        title: 'Medicine',
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
          'Add Medicine',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        SizedBox(height: 7),
        Text(
          'You can add your new medicine here',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        SizedBox(height: 20),
        buildTextFieldsColumn(),
        SizedBox(height: 20),
        buildDescriptionAndButton(),
      ],
    );
  }

  Widget buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Medicine',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        SizedBox(height: 7),
        Text(
          'You can add your new medicine here',
          style: TextStyle(fontFamily: 'Poppins.regular'),
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
                        labelText: 'Medicine Name',
                      ),
                    ),
                    SizedBox(height: 30),
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
                        labelText: 'Stock',
                      ),
                    ),
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
                        labelText: 'Medicine Id',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Supplier price',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Taxable',
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
                        labelText: 'Catagory',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Selling Price',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Prescription Based',
                      ),
                    ),
                  ],
                ),
              ),
            ),
  SizedBox(width: 20),
              Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'weight',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expiry Date',
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
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
            labelText: 'Medicine Name',
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
            labelText: 'Stock',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Medicine Id',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Supplier Price',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Taxable',
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
            labelText: 'Selling Price',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Prescription Based',
          ),
        ),
          SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Weight',
          ),
        ),
          SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Expiry Date',
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
            labelText: 'Details...',
          ),
        ),
        SizedBox(height: 40),
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
                  'Add medicine',
                  style: TextStyle(color: Colors.white),
                ),
              ),
SizedBox(width: 20,),
 ElevatedButton(
            
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              backgroundColor: const Color.fromARGB(255, 237, 75, 64),
              minimumSize: Size(130, 40),
            ),
            onPressed: () {
              // Add button action
            },
            child: Text(
              'Reset',
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
