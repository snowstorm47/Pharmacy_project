import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';

class DashBoardScreenFinance extends StatefulWidget {
  const DashBoardScreenFinance({super.key});

  @override
  DashBoardScreenFinanceState createState() => DashBoardScreenFinanceState();
}

class DashBoardScreenFinanceState extends State<DashBoardScreenFinance> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF3F6F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: SideMenu(
        onClose: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: InvoiceDetails(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InvoiceDetails extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController();

  InvoiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
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
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 150,
            ),
            width: 1000.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                ),
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 450.0, top: 10.0, right: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/download.jpg",
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle form submission here
                            print(
                                'Description: ${_descriptionController.text}');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
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
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  right: 12.0,
                                  left: 50.0,
                                  bottom: 12.0),
                              child: Text(
                                'Sl No.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 12.0, bottom: 12.0),
                              child: Text(
                                'Item',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 12.0, bottom: 12.0),
                              child: Text(
                                'Unit Price',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 12.0, bottom: 12.0),
                              child: Text(
                                'Quantity',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 12.0, bottom: 12.0),
                              child: Text(
                                'Discount',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 12.0, bottom: 12.0),
                              child: Text(
                                'Tax',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 50.0, bottom: 12.0),
                              child: Text(
                                'Total',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  right: 12.0,
                                  left: 50.0,
                                  bottom: 12.0),
                              child: Text(
                                '01',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 12.0, bottom: 12.0),
                              child: Text(
                                'Honey',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 12.0, bottom: 12.0),
                              child: Text(
                                '34',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 12.0, bottom: 12.0),
                              child: Text(
                                '5',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 12.0, bottom: 12.0),
                              child: Text(
                                '2%',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 12.0, bottom: 12.0),
                              child: Text(
                                '2%',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 50.0, bottom: 12.0),
                              child: Text(
                                '\$200.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(top: 15.0, left: 50.0, right: 50.0),
                    child: Divider(
                      color: Color.fromARGB(255, 129, 128, 128),
                      thickness: 2.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Table(
                      children: const [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFECEDF7),
                          ),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  right: 12.0,
                                  left: 300.0,
                                  bottom: 12.0),
                              child: Text(
                                'Sub Total',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 50.0, bottom: 12.0),
                              child: Text(
                                '\$2,245.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  right: 12.0,
                                  left: 300.0,
                                  bottom: 12.0),
                              child: Text(
                                'Discount',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 50.0, bottom: 12.0),
                              child: Text(
                                '-\$20.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  right: 12.0,
                                  left: 300.0,
                                  bottom: 12.0),
                              child: Text(
                                'Tax',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 50.0, bottom: 12.0),
                              child: Text(
                                '\$24.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  right: 12.0,
                                  left: 300.0,
                                  bottom: 12.0),
                              child: Text(
                                'Shipping',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 50.0, bottom: 12.0),
                              child: Text(
                                '\$40.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  right: 12.0,
                                  left: 300.0,
                                  bottom: 12.0),
                              child: Text(
                                'Grand Total',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, right: 50.0, bottom: 12.0),
                              child: Text(
                                '\$2,245.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 20.0),
                    child: Container(
                      height: 60.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Invoice was created on a computer and is valid without the signature and seal.',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
