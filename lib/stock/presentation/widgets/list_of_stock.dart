import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:clean_a/stock/presentation/widgets/popup/add_medicine_popup.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';

import 'popup/delete_medicine_popup.dart';
// Import the new add medicine page

class ListOfStockPage extends StatefulWidget {
  const ListOfStockPage({super.key});

  @override
  ListOfStockPageState createState() => ListOfStockPageState();
}

class ListOfStockPageState extends State<ListOfStockPage> {
  bool showSideMenu = false;
  List<bool> checkboxValues = List<bool>.generate(10, (index) => false);

  TextStyle _getStatusTextStyle(String status) {
    switch (status) {
      case 'Completed':
        return const TextStyle(color: Colors.green);
      case 'Pending':
        return const TextStyle(color: Colors.yellow);
      case 'Cancelled':
        return const TextStyle(color: Colors.red);
      default:
        return const TextStyle(color: Colors.grey);
    }
  }

  void _showDeletePopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteMedicinePopup(
          onDeleteConfirmed: () {
            // Add your delete logic here
          },
        );
      },
    );
  }

  void _navigateToAddMedicinePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddMedicinePage()),
    );
  }

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
                              'List of Stock',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'List of Medicine in Stock',
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
                                const SizedBox(width: 8),
                                // Branch button
                                Expanded(
                                  child: SizedBox(
                                    width: 120, // Adjust the width as needed
                                    height: 35, // Adjust the height as needed
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Adjust the roundness
                                        ),
                                        child: DropdownButton<String>(
                                          isExpanded:
                                              true, // Ensure the dropdown button fills the available width
                                          items: <String>[
                                            'Branch A',
                                            'Branch B',
                                            'Branch C',
                                            'Branch D'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Center(
                                                child: Text(
                                                  value,
                                                  textAlign: TextAlign
                                                      .center, // Center the text
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            // Implement dropdown change logic
                                          },
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.white),
                                          underline: const SizedBox(
                                            width: 10,
                                          ),
                                          style: const TextStyle(
                                              color: Colors.white),
                                          value:
                                              'Branch A', // Set the default value to the first option
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            // Replace the rows property in DataTable with a ListView.builder
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: 20.0,
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.blue),
                                dividerThickness: 0, // Remove the dividers
                                columns: const <DataColumn>[
                                  DataColumn(label: SizedBox(width: 20)),
                                  DataColumn(label: SizedBox(width: 40)),
                                  DataColumn(
                                    label: Text('Medicine Name',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Medicine ID',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Generic Name',
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
                                    label: Text('Location Code',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Expiry Date',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Status',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Padding(
                                      padding: EdgeInsets.only(right: 14.0),
                                      child: Icon(Icons.more_vert,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  7, // Change this to the number of rows you have
                                  (index) {
                                    // Example status values
                                    List<String> statuses = [
                                      'Completed',
                                      'Pending',
                                      'Cancelled',
                                      'Completed',
                                      'Pending',
                                      'Cancelled',
                                      'Completed'
                                    ];
                                    String status = statuses[index];
                                    return DataRow(
                                      color: MaterialStateColor.resolveWith(
                                          (states) {
                                        // Alternating colors
                                        return index % 2 == 0
                                            ? Colors.white10
                                            : Colors.white70;
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
                                        DataCell(Text('$index')),
                                        DataCell(Text('Medicine Name $index')),
                                        DataCell(Text('Medicine ID $index')),
                                        DataCell(Text('Generic Name $index')),
                                        DataCell(Text('Category $index')),
                                        DataCell(Text('Weight $index')),
                                        DataCell(Text('Location Code $index')),
                                        DataCell(Text('Expiry Date $index')),
                                        DataCell(
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    (_getStatusTextStyle(
                                                            status))
                                                        .color,
                                                radius:
                                                    4.0, // Adjust the radius as needed
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                status,
                                                style:
                                                    _getStatusTextStyle(status),
                                              ),
                                            ],
                                          ),
                                        ),
                                        DataCell(
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 14.0),
                                            child: IconButton(
                                              icon: const Icon(Icons.more_vert),
                                              onPressed: () {
                                                // Handle "More" button press
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            // Row for buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: _navigateToAddMedicinePage,
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Adjust the radius as needed
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                      child: const Text(
                                        'Add Medicine to Stock',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    ElevatedButton(
                                      onPressed: _showDeletePopup,
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Adjust the radius as needed
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                      child: const Text(
                                        'Delete from Stock',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle navigate to medicine detail page
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Adjust the radius as needed
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                  child: const Text('To Medicine Detail Page',
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
