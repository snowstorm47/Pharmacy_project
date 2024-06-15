import 'package:flutter/material.dart';

class AddNewCorporateCustomer extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController();
  // final isMobile = Responsive.isMobile(BuildContext, context);
  // final bool isMobile = Responsive.isMobile(BuildContext, context);

  AddNewCorporateCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add New Corporate Customer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'You Can Add New Corporate Customers Here',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 30,
                ),
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
                //                   Responsive.isTablet(context, context) ? 2 : 2,
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
                // if (Responsive.isMobile(context))
                //   SingleChildScrollView(
                //     child: Column(
                //       children: <Widget>[
                //         Expanded(
                //           child: _buildTextButton('Role Name',
                //               width: 400.0, height: 40.0),
                //         ),
                //         SizedBox(height: 15), // Add spacing between buttons
                //         Expanded(
                //           child: _buildTextButton('Permitted Action',
                //               width: 400.0, height: 40.0),
                //         ),
                //         SizedBox(height: 15),
                //         Expanded(
                //           child: _buildTextButton('Assigned Staff',
                //               width: 400.0, height: 40.0),
                //         ),
                //         SizedBox(height: 15), // Add spacing between buttons
                //         Expanded(
                //           child: _buildTextButton('System Access',
                //               width: 400.0, height: 40.0),
                //         ),
                //         SizedBox(height: 15),
                //         Padding(
                //           padding: const EdgeInsets.only(right: 95.0),
                //           child: TextField(
                //             controller: _descriptionController,
                //             maxLines:
                //                 Responsive.isTablet(context, context) ? 2 : 2,
                //             decoration: InputDecoration(
                //               hintText: 'Description',
                //               border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(18.0),
                //               ),
                //             ),
                //           ),
                //         ),
                //         SizedBox(height: 15),
                //         Padding(
                //           padding:
                //               const EdgeInsets.all(0.0), // No padding needed here
                //           child: Container(
                //             width: MediaQuery.of(context).size.width *
                //                 0.8, // Adjust width as needed
                //             child: Row(
                //               children: <Widget>[
                //                 ElevatedButton(
                //                   onPressed: () {
                //                     // Handle form submission here
                //                     print(
                //                         'Description: ${_descriptionController.text}');
                //                   },
                //                   style: ElevatedButton.styleFrom(
                //                     backgroundColor: const Color.fromARGB(
                //                         255,
                //                         14,
                //                         196,
                //                         20), // Set the background color of the "Save" button
                //                     foregroundColor: Colors
                //                         .white, // Set the text color of the "Save" button
                //                   ),
                //                   child: Text('Save'),
                //                 ),
                //                 SizedBox(width: 16.0),
                //                 ElevatedButton(
                //                   onPressed: () {
                //                     // Handle form submission here
                //                     print(
                //                         'Description: ${_descriptionController.text}');
                //                   },
                //                   style: ElevatedButton.styleFrom(
                //                     backgroundColor: Colors
                //                         .red, // Set the background color of the "Save" button
                //                     foregroundColor: Colors
                //                         .white, // Set the text color of the "Save" button
                //                   ),
                //                   child: Text('Discard'),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildTextButton('Company Name',
                                width: 300.0, height: 40.0),
                          ),
                          SizedBox(width: 50), // Add spacing between buttons
                          Expanded(
                            child: _buildTextButton('Company Contact Name',
                                width: 300.0, height: 40.0),
                          ),
                          SizedBox(width: 50),
                          Expanded(
                            child: _buildTextButton('Company Contact Email',
                                width: 300.0, height: 40.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildTextButton(
                                'Company Contact Phone Number',
                                width: 300.0,
                                height: 40.0),
                          ),
                          SizedBox(width: 50), // Add spacing between buttons
                          Expanded(
                            child: _buildTextButton('Company Address',
                                width: 300.0, height: 40.0),
                          ),
                          SizedBox(width: 50),
                          Expanded(
                            child: _buildTextButton('Payment Terms',
                                width: 300.0, height: 40.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildTextButton('Credit limit',
                                width: 300.0, height: 40.0),
                          ),
                          SizedBox(width: 50), // Add spacing between buttons
                          Expanded(
                            child: _buildTextButton(
                                'Medical Insurance Provider',
                                width: 300.0,
                                height: 40.0),
                          ),
                          SizedBox(width: 50),
                          Expanded(
                            child: _buildTextButton('Policy Number',
                                width: 300.0, height: 40.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: _textField(
                                'Authorized Users',
                                "Upload Excell File with the following columns:-\n"
                                    "- Employee id\n"
                                    "- Employee name\n"
                                    "- Employee contact email\n"
                                    "- Employee phone number\n"
                                    "- company name",
                                width: 400.0,
                                height: 100.0),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: _buildTextButton('Add Notes or Comments',
                                width: 300.0, height: 100.0),
                          ),
                          SizedBox(width: 30),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 60.0, right: 20.0),
                            child: Expanded(
                              child: _buildTextButton('Emergency Contact Phone',
                                  width: 300.0, height: 40.0),
                            ),
                          ),
                          // TextField(
                          //   controller: _descriptionController,
                          //   maxLines: 2,
                          //   decoration: InputDecoration(
                          //     hintText: 'Description',
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(18.0),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 900.0), // No padding needed here
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.8, // Adjust width as needed
                          child: Row(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  // Handle form submission here
                                  print(
                                      'Description: ${_descriptionController.text}');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                      255,
                                      14,
                                      196,
                                      20), // Set the background color of the "Save" button
                                  foregroundColor: Colors
                                      .white, // Set the text color of the "Save" button
                                ),
                                child: Text('Submit'),
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
      ),
    );
  }

  Widget _buildTextButton(String title,
      {double width = 150, double height = 60}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: width,
          height: height,
          child: TextField(
            decoration: InputDecoration(
              // hintText: title,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade400, // Set the border color
                  width: 1.0, // Set the border width
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _textField(String title, String description,
    {double width = 150, double height = 60}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      SizedBox(height: 8),
      SizedBox(
        width: width,
        height: height,
        child: TextField(
          style: TextStyle(
            fontSize: 12.0,
          ),
          decoration: InputDecoration(
            hintText: description,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.grey.shade400, // Set the border color
                width: 1.0, // Set the border width
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
