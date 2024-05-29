import 'package:flutter/material.dart';

class Invoice_details extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController();

  Invoice_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                  child: Container(
                    height: 50.0,
                    child: Column(
                      children: [
                        Text(
                          'Invoice #7ki904',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text(
                            'Created At: 18 Dec,2019 01:02 PM',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45.0, left: 650.0),
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle form submission here
                        print('Description: ${_descriptionController.text}');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .white, // Set the background color of the "Save" button
                        foregroundColor: Colors
                            .black, // Set the text color of the "Save" button
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Back'),
                          SizedBox(
                            width: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Container(
                height: 450.0,
                width: 1000.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors
                        .black, // Change this to your desired border color
                    width: 1.0, // Change this to your desired border width
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(0.5), // Set shadow color with opacity
                      offset: Offset(4.0, 4.0), // Offset the shadow slightly
                      blurRadius: 4.0, // Adjust blur radius for shadow softness
                      spreadRadius: 0.0, // Optional: Spread the shadow slightly
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 450.0, top: 10.0, right: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.grey,
                            child: Center(child: Text("Logo")),
                            width: 88.0,
                            height: 70.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle form submission here
                              print(
                                  'Description: ${_descriptionController.text}');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color of the "Save" button
                              foregroundColor: Colors
                                  .black, // Set the text color of the "Save" button
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: Icon(
                                  Icons.print,
                                  color: Color.fromARGB(255, 14, 196, 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    "INVOICE TO",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    "Gregory Ander son",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color.fromARGB(255, 14, 196, 20),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 28.0, top: 10.0),
                                      child: Text(
                                          "House #65, 4328 Marion Street Newbury, VT 05051"),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Color.fromARGB(255, 14, 196, 20),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 28.0, top: 10.0),
                                      child: Text("+012 8764 556"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 180.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    "INVOICE",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color.fromARGB(255, 14, 196, 20),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 50.0),
                                  child: Text("INVOICE ID : 66k5w3"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: Text("DATE : 26 Jan,2020"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                      child: Table(
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: Color(0xFFECEDF7),
                            ),
                            // Table row
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 12.0,
                                    right: 12.0,
                                    left: 50.0,
                                    bottom: 12.0),
                                child: Text(
                                  'Invoice ID',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 14, 196, 20),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Category',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 14, 196, 20),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 12.0,
                                    right: 12.0,
                                    left: 100.0,
                                    bottom: 12.0),
                                child: Text(
                                  'Price',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 14, 196, 20),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 12.0,
                                    right: 12.0,
                                    left: 60.0,
                                    bottom: 12.0),
                                child: Text(
                                  'QTY',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 14, 196, 20),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Amount',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 14, 196, 20),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            // Table row
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 12.0,
                                    right: 12.0,
                                    left: 50.0,
                                    bottom: 12.0),
                                child: Text(
                                  '#7jhy78',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 12.0, left: 1.0, bottom: 12.0),
                                child: Text(
                                  '#Zimax - Group of Azithromycin',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 12.0,
                                    right: 12.0,
                                    left: 100.0,
                                    bottom: 12.0),
                                child: Text(
                                  '40.0',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 12.0,
                                    right: 12.0,
                                    left: 60.0,
                                    bottom: 12.0),
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  '20,000',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            // Table row
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 12.0, left: 50.0, bottom: 12.0),
                                child: Text(
                                  '#R6hyW4',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 1.0, bottom: 12.0),
                                child: Text(
                                  'Cosmotics',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 12.0, left: 100.0, bottom: 12.0),
                                child: Text(
                                  '56.0',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 12.0, left: 60.0, bottom: 12.0),
                                child: Text(
                                  '10',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 12.0, bottom: 12.0, right: 12.0),
                                child: Text(
                                  '100,000',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Subtotal:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                                Text(
                                  "Processing Fee:",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  "TAX",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Grand Total:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 100.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "435,000",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  Text(
                                    "10.0",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "43.50",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "478,500",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ],
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
            // SizedBox(
            //   height: 40,
            // ),
            // if (Responsive.isMobile(context))
            //   SingleChildScrollView(
            //     child: Container(
            //       color: Colors.yellow,
            //       child: Column(
            //         // Parent container for all elements
            //         children: [
            //           _buildTextButton('Role Name',
            //               width: 400.0, height: 40.0),
            //           SizedBox(height: 15), // Spacing between buttons
            //           _buildTextButton('Permitted Action',
            //               width: 400.0, height: 40.0),
            //           SizedBox(height: 15),
            //           _buildTextButton('Assigned Staff',
            //               width: 400.0, height: 40.0),
            //           SizedBox(height: 15),
            //           _buildTextButton('System Access',
            //               width: 400.0, height: 40.0),
            //           SizedBox(height: 15),
            //           Padding(
            //             padding: const EdgeInsets.only(right: 95.0),
            //             child: TextField(
            //               controller: _descriptionController,
            //               maxLines:
            //               Responsive.isTablet(context, context) ? 2 : 2,
            //               decoration: InputDecoration(
            //                 hintText: 'Description',
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(18.0),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 15),
            //           Padding(
            //             padding: const EdgeInsets.all(
            //                 0.0), // No padding needed here
            //             child: Container(
            //               // width: MediaQuery.of(context).size.width *
            //               //     0.8, // Set width as needed
            //               child: Row(
            //                 children: [
            //                   ElevatedButton(
            //                     onPressed: () {
            //                       // Handle form submission here
            //                       print(
            //                           'Description: ${_descriptionController.text}');
            //                     },
            //                     style: ElevatedButton.styleFrom(
            //                       backgroundColor: const Color.fromARGB(
            //                           255,
            //                           14,
            //                           196,
            //                           20), // Set the background color of the "Save" button
            //                       foregroundColor: Colors
            //                           .white, // Set the text color of the "Save" button
            //                     ),
            //                     child: Text('Save'),
            //                   ),
            //                   // SizedBox(width: 16.0),
            //                   ElevatedButton(
            //                     onPressed: () {
            //                       // Handle form submission here
            //                       print(
            //                           'Description: ${_descriptionController.text}');
            //                     },
            //                     style: ElevatedButton.styleFrom(
            //                       backgroundColor: Colors
            //                           .red, // Set the background color of the "Save" button
            //                       foregroundColor: Colors
            //                           .white, // Set the text color of the "Save" button
            //                     ),
            //                     child: Text('Discard'),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // // if (Responsive.isMobile(context))
            // //   SingleChildScrollView(
            // //     child: Column(
            // //       children: <Widget>[
            // //         Expanded(
            // //           child: _buildTextButton('Role Name',
            // //               width: 400.0, height: 40.0),
            // //         ),
            // //         SizedBox(height: 15), // Add spacing between buttons
            // //         Expanded(
            // //           child: _buildTextButton('Permitted Action',
            // //               width: 400.0, height: 40.0),
            // //         ),
            // //         SizedBox(height: 15),
            // //         Expanded(
            // //           child: _buildTextButton('Assigned Staff',
            // //               width: 400.0, height: 40.0),
            // //         ),
            // //         SizedBox(height: 15), // Add spacing between buttons
            // //         Expanded(
            // //           child: _buildTextButton('System Access',
            // //               width: 400.0, height: 40.0),
            // //         ),
            // //         SizedBox(height: 15),
            // //         Padding(
            // //           padding: const EdgeInsets.only(right: 95.0),
            // //           child: TextField(
            // //             controller: _descriptionController,
            // //             maxLines:
            // //                 Responsive.isTablet(context, context) ? 2 : 2,
            // //             decoration: InputDecoration(
            // //               hintText: 'Description',
            // //               border: OutlineInputBorder(
            // //                 borderRadius: BorderRadius.circular(18.0),
            // //               ),
            // //             ),
            // //           ),
            // //         ),
            // //         SizedBox(height: 15),
            // //         Padding(
            // //           padding:
            // //               const EdgeInsets.all(0.0), // No padding needed here
            // //           child: Container(
            // //             width: MediaQuery.of(context).size.width *
            // //                 0.8, // Adjust width as needed
            // //             child: Row(
            // //               children: <Widget>[
            // //                 ElevatedButton(
            // //                   onPressed: () {
            // //                     // Handle form submission here
            // //                     print(
            // //                         'Description: ${_descriptionController.text}');
            // //                   },
            // //                   style: ElevatedButton.styleFrom(
            // //                     backgroundColor: const Color.fromARGB(
            // //                         255,
            // //                         14,
            // //                         196,
            // //                         20), // Set the background color of the "Save" button
            // //                     foregroundColor: Colors
            // //                         .white, // Set the text color of the "Save" button
            // //                   ),
            // //                   child: Text('Save'),
            // //                 ),
            // //                 SizedBox(width: 16.0),
            // //                 ElevatedButton(
            // //                   onPressed: () {
            // //                     // Handle form submission here
            // //                     print(
            // //                         'Description: ${_descriptionController.text}');
            // //                   },
            // //                   style: ElevatedButton.styleFrom(
            // //                     backgroundColor: Colors
            // //                         .red, // Set the background color of the "Save" button
            // //                     foregroundColor: Colors
            // //                         .white, // Set the text color of the "Save" button
            // //                   ),
            // //                   child: Text('Discard'),
            // //                 ),
            // //               ],
            // //             ),
            // //           ),
            // //         ),
            // //       ],
            // //     ),
            // //   ),
            //
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: _buildTextButton('Role Name',
            //           width: 400.0, height: 40.0),
            //     ),
            //     SizedBox(width: 50), // Add spacing between buttons
            //     Expanded(
            //       child: _buildTextButton('Permitted Action',
            //           width: 400.0, height: 40.0),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 15.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: _buildTextButton('Assigned Staff',
            //           width: 400.0, height: 40.0),
            //     ),
            //     SizedBox(width: 50), // Add spacing between buttons
            //     Expanded(
            //       child: _buildTextButton('System Access',
            //           width: 400.0, height: 40.0),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 35.0),
            // Padding(
            //   padding: const EdgeInsets.only(right: 95.0),
            //   child: TextField(
            //     controller: _descriptionController,
            //     maxLines: Responsive.isTablet(context, context) ? 2 : 2,
            //     decoration: InputDecoration(
            //       hintText: 'Description',
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(18.0),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10.0),
            // Padding(
            //   padding: const EdgeInsets.all(0.0), // No padding needed here
            //   child: Container(
            //     width: MediaQuery.of(context).size.width *
            //         0.8, // Adjust width as needed
            //     child: Row(
            //       children: <Widget>[
            //         ElevatedButton(
            //           onPressed: () {
            //             // Handle form submission here
            //             print('Description: ${_descriptionController.text}');
            //           },
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: const Color.fromARGB(255, 14, 196,
            //                 20), // Set the background color of the "Save" button
            //             foregroundColor: Colors
            //                 .white, // Set the text color of the "Save" button
            //           ),
            //           child: Text('Save'),
            //         ),
            //         SizedBox(width: 16.0),
            //         ElevatedButton(
            //           onPressed: () {
            //             // Handle form submission here
            //             print('Description: ${_descriptionController.text}');
            //           },
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors
            //                 .red, // Set the background color of the "Save" button
            //             foregroundColor: Colors
            //                 .white, // Set the text color of the "Save" button
            //           ),
            //           child: Text('Discard'),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
