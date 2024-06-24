import 'package:flutter/material.dart';

class InvoiceDetails extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController();

  InvoiceDetails({super.key});

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
                const Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 30.0),
                  child: SizedBox(
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
                    child: const Row(
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
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
                      offset:
                          const Offset(4.0, 4.0), // Offset the shadow slightly
                      blurRadius: 4.0, // Adjust blur radius for shadow softness
                      spreadRadius: 0.0, // Optional: Spread the shadow slightly
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 450.0, top: 10.0, right: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.grey,
                            width: 88.0,
                            height: 70.0,
                            child: const Center(child: Text("Logo")),
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
                            child: const Center(
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40.0),
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
                                  "Gregory Andre son",
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
                                    padding:
                                        EdgeInsets.only(left: 28.0, top: 10.0),
                                    child: Text(
                                        "House #65, 4328 Marion StreetNewburg, VT 05051"),
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
                                    padding:
                                        EdgeInsets.only(left: 28.0, top: 10.0),
                                    child: Text("+012 8764 556"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 180.0),
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
                                padding: EdgeInsets.only(top: 10.0, left: 50.0),
                                child: Text("INVOICE ID : 66k5w3"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 50.0),
                                child: Text("DATE : 26 Jan,2020"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 10.0),
                      child: Table(
                        children: const [
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
                                  '#Zama - Group of Azithromycin',
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
                                  'Cosmetics',
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
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
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
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 100.0),
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
                        ],
                      ),
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
}
