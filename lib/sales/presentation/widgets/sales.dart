import 'package:clean_a/shared/constants/sales_data.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  SalesState createState() => SalesState();
}

class SalesState extends State<Sales> {
  bool showSideMenu = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    final data = [
      DataM(
        medicineName: 'Panadol',
        category: 'Painkiller',
        dosage: '30mg',
        inStock: '4',
        pricePerUnit: '100birr',
      ),
       DataM(
        medicineName: 'Panadol',
        category: 'Painkiller',
        dosage: '30mg',
        inStock: '4',
        pricePerUnit: '100birr',
      ),
       DataM(
        medicineName: 'Panadol',
        category: 'Painkiller',
        dosage: '30mg',
        inStock: '4',
        pricePerUnit: '100birr',
      ),
       DataM(
        medicineName: 'Panadol',
        category: 'Painkiller',
        dosage: '30mg',
        inStock: '4',
        pricePerUnit: '100birr',
      ),
       DataM(
        medicineName: 'Panadol',
        category: 'Painkiller',
        dosage: '30mg',
        inStock: '4',
        pricePerUnit: '100birr',
      ),
      // Add more items as needed
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F0),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (ResponsiveD.isDesktop(context))
                  Expanded(
                    child: SideMenu(
                      onClose: () {
                        setState(() {
                          showSideMenu = false;
                        });
                      },
                    ),
                  ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeaderPage(
                        onMenuPressed: () {
                          setState(() {
                            showSideMenu = !showSideMenu;
                          });
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Search',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          prefixIcon: Icon(Icons.search,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      backgroundColor:
                                          const Color.fromARGB(236, 27, 228, 4),
                                    ),
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Icon(Icons.filter_list,
                                            color: Colors.white),
                                        SizedBox(width: 10),
                                        Text('Filter By',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      backgroundColor:
                                          const Color.fromRGBO(33, 150, 243, 1),
                                    ),
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Icon(Icons.add_shopping_cart,
                                            color: Colors.white),
                                        SizedBox(width: 10),
                                        Text('Add to Cart',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  IconButton(
                                    onPressed: () {
                                      _showCalculatorDialog(context);
                                    },
                                    icon: const Icon(Icons.calculate),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Sales List Table
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Table(
                                    columnWidths: {
                                      0: FixedColumnWidth(isMobile ? 120 : 150),
                                      1: FixedColumnWidth(isMobile ? 120 : 150),
                                      2: FixedColumnWidth(isMobile ? 120 : 150),
                                      3: FixedColumnWidth(isMobile ? 120 : 150),
                                      4: FixedColumnWidth(isMobile ? 120 : 150),
                                      5: FixedColumnWidth(isMobile ? 120 : 150),
                                    },
                                    children: [
                                      _buildHeaderRow(isMobile),
                                      ...data
                                          .map((item) =>
                                              _buildDataRow(item, isMobile))
                                          .toList(),
                                    ],
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
            if (!ResponsiveD.isDesktop(context) && showSideMenu)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: SideMenu(
                  onClose: () {
                    setState(() {
                      showSideMenu = false;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  TableRow _buildHeaderRow(bool isMobile) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildHeaderCell('Medicine Name', isMobile),
        _buildHeaderCell('Category', isMobile),
        _buildHeaderCell('Dosage', isMobile),
        _buildHeaderCell('In Stock', isMobile),
        _buildHeaderCell('Price per Unit', isMobile),
        _buildHeaderCell('Actions', isMobile),
      ],
    );
  }

  TableRow _buildDataRow(DataM data, bool isMobile) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildDataCell(data.medicineName, isMobile),
        _buildDataCell(data.category, isMobile),
        _buildDataCell(data.dosage, isMobile),
        _buildDataCell(data.inStock, isMobile),
        _buildDataCell(data.pricePerUnit, isMobile),
        _buildActionCell(),
      ],
    );
  }

  Widget _buildHeaderCell(String text, bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 8.0 : 12.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 8.0 : 12.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: isMobile ? 14 : 16,
        ),
      ),
    );
  }

  Widget _buildActionCell() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: false,
                onChanged: (bool? value) {
                  // Add your checkbox functionality here
                },
              ),
              const SizedBox(width: 8.0),
              Container(
                width: 50,
                height: 24,
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    hintText: 'Qty',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCalculatorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Calculator'),
          content: Container(
            width: 200,
            height: 300,
            child: const Placeholder(), // Replace with your calculator widget
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
