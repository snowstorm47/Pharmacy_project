
import 'package:flutter/material.dart';
import 'package:clean_a/header.dart';

class AddBranch extends StatefulWidget {
  const AddBranch({super.key});

  @override
  State<AddBranch> createState() => _AddAutoState();
}

class _AddAutoState extends State<AddBranch> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      appBar: Header(
        title: 'Branch',
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
          'Add Branch',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        SizedBox(height: 7),
        Text(
          'Add branch Details',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(236, 27, 228, 4), ),
  onPressed: (){}, child: Text('Save',style: TextStyle(color: Colors.white),)),
  SizedBox(width: 20),
ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor:const Color.fromARGB(255, 212, 94, 86), ),
  onPressed: (){}, child: Text('Discard',style: TextStyle(color: Colors.white)))
        ],),
        SizedBox(height: 20),
        buildTextFieldsColumn(),
        SizedBox(height: 20),
        buildDescriptionAndButton(),
        SizedBox(height: 30),
          SizedBox(
           
            width: 170,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(235, 198, 232, 194), ),
              onPressed: (){}, child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('import file',style: TextStyle(color: Colors.black),),
                  SizedBox(width: 20,),
                  Icon(Icons.import_export),
                ],
              )),
          ),
      ],
    );
  }

  Widget buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Branch',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
         SizedBox(height: 17),
        Text(
          'Add Branch Details',
          style: TextStyle(fontFamily: 'Poppins.regular',fontSize: 20),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(235, 198, 232, 194), ),
  onPressed: (){}, child: Row(

    children: [
      Text('import file',style: TextStyle(color: Colors.black),),
SizedBox(width: 20,),
      Icon(Icons.import_export),
    ],
  )),
  SizedBox(width: 400),
ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(236, 27, 228, 4), ),
  onPressed: (){}, child: Text('Save',style: TextStyle(color: Colors.white),)),
  SizedBox(width: 20),
ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor:const Color.fromARGB(255, 212, 94, 86), ),
  onPressed: (){}, child: Text('Discard',style: TextStyle(color: Colors.white),),),
        ],),
       
        SizedBox(height: 17),
       
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
                        labelText: 'Branch Name',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Branch Manager',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Store Capacity',
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
                        labelText: 'Branch Adress',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Open hours',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Total employees',
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
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
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
            labelText: 'Branch Name',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Branch Manager',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Stock Capacity',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Adress',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Open hours',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Total employee',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone number',
          ),
        ),
      ],
    );
  }

  Widget buildDescriptionAndButton() {
    return SizedBox(
      width: 880,
      child: Padding(
        padding: const EdgeInsets.all(.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter additional description here...',
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
