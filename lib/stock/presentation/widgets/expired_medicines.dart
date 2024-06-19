import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';

class ExpiredMedicinesPage extends StatefulWidget {
  const ExpiredMedicinesPage({super.key});

  @override
  ExpiredMedicinesPageState createState() => ExpiredMedicinesPageState();
}

class ExpiredMedicinesPageState extends State<ExpiredMedicinesPage> {
  bool showSideMenu = false;
  List<bool> checkboxValues = List<bool>.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F0),
      body: SafeArea(
        child: Stack(
          children: [
            // Main content area
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar (only for desktop)
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
                // Main content
                Expanded(
                  flex: 4, // Adjust flex ratio as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      HeaderPage(
                        onMenuPressed: () {
                          setState(() {
                            showSideMenu = !showSideMenu;
                          });
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      // Content
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(16.0),
                          children: [
                            const Text(
                              'Expired Medicines',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'List of Expired Medicines',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                // Search placeholder
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search...',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 16.0),
                                      ),
                                    ),
                                  ),
                                ),
                                // Filter by button
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // Add filter functionality here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Adjust the radius as needed
                                      ),
                                    ),
                                    icon: const Icon(Icons.filter_list,
                                        color: Colors.white),
                                    label: const Text('Filter By',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),

                                // Branch button
                              ],
                            ),
                            const SizedBox(height: 40),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: 20.0,
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.blue),
                                dividerThickness: 0, // Remove the dividers
                                columns: const <DataColumn>[
                                  DataColumn(label: SizedBox(width: 20)),
                                  DataColumn(
                                    label: Text('Medicine Name',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Medicine ID',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Category',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Weight',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Expiry Date',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Quantity',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Duration',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Additional Info',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Padding(
                                      padding: EdgeInsets.only(right: 16.0),
                                      child: Icon(Icons.more_vert,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  7, // Change this to the number of rows you have
                                  (index) => DataRow(
                                    color: MaterialStateColor.resolveWith(
                                        (states) {
                                      // Alternating colors
                                      return index % 2 == 0
                                          ? Colors.grey[200]!
                                          : Colors.white;
                                    }),
                                    cells: <DataCell>[
                                      DataCell(
                                        Checkbox(
                                          value: checkboxValues[index],
                                          onChanged: (value) {
                                            setState(() {
                                              checkboxValues[index] = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      DataCell(Text('Medicine Name $index')),
                                      DataCell(Text('Medicine ID $index')),
                                      DataCell(Text('Category $index')),
                                      DataCell(Text('Weight $index')),
                                      DataCell(Text('Expiry Date $index')),
                                      DataCell(Text('Quantity $index')),
                                      DataCell(Text(
                                          'Duration $index')), // Add duration cell
                                      DataCell(Text('Additional Info $index')),
                                      DataCell(
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: IconButton(
                                            icon: const Icon(Icons.more_vert),
                                            onPressed: () {
                                              // Handle "More" button press
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Row for buttons
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle add medicine to stock
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text('Delete Medicine',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Sidebar (for mobile and tablet)
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
}
