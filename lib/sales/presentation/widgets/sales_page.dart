import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/medicine/domain/entities/batch.dart';
import 'package:clean_a/medicine/domain/entities/medicine.dart';
import 'package:clean_a/medicine/providers/medicine_provider.dart';

import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_pop_up.dart';
import 'sales_table.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  SalesState createState() => SalesState();
}

class SalesState extends State<Sales> {
  bool showSideMenu = false;
  // final List<DataM> data = [
  //   DataM(
  //     medicineName: 'Panadol',
  //     category: 'Painkiller',
  //     dosage: '30mg',
  //     inStock: '4',
  //     pricePerUnit: '100',
  //   ),
  //   // Add more items as needed
  // ];
  @override
  void initState() {
    super.initState();
    // Fetch data from provider
    Future.microtask(() async{
      final provider = Provider.of<MedicineProvider>(context, listen: false);
      await provider.getMedicines();
    });
  }
   

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    final provider = Provider.of<MedicineProvider>(context,listen:false);
    final List<Batch> data = provider.batches ?? [];
    final List<Medicine> med = provider.medicines ?? [];
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
                                    onPressed: () {
                                      _showCartPopup(context);
                                    },
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
                              Expanded(
                                child: SalesTable(),
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

  void _showCartPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CartPopup();
      },
    );
  }
}
