import 'package:flutter/material.dart';
import 'package:clean_a/header.dart';

class AddAuto extends StatefulWidget {
  const AddAuto({super.key});

  @override
  State<AddAuto> createState() => _AddAutoState();
}

class _AddAutoState extends State<AddAuto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Customer',
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Container(
          width: 1440,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    // First Column
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add authorized User',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: 'Poppins.regular'),
                            ),
                            SizedBox(height: 7),
                            Text(
                              'You can add your new authorized user information here',
                              style: TextStyle(fontFamily: 'Poppins.regular'),
                            ),
                            SizedBox(height: 43),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Employee Name',
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Address',
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Role/position',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 40), // Space between the columns
                
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 90), // Aligns with the first column
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Phone number',
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'City',
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Employee Id',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 40), // Space between the columns
                    // Third Column
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 90), // Aligns with the first column
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
                                labelText: 'Sub City',
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Company Name',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // New Row with description and button
              Padding(
                padding: const EdgeInsets.all( 20.0),
                child: Row(
                  children: [
                    Container(
                      width: 700,
                      child: Expanded(
                        child: TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter additional description here...',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 200),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Container(
                       
                        width: 140,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4), ),
                          onPressed: () {
                            // Add button action
                          },
                          child: Text('Add User',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
