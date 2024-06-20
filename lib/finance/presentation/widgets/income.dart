import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';

import 'package:clean_a/shared/utility/responsive.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  bool showSideMenu = false;
  List<bool> checkboxValues = List<bool>.generate(6, (index) => false);

  final TextEditingController categoryController = TextEditingController();
  final TextEditingController invoiceIdController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController expenseHeadController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    categoryController.dispose();
    invoiceIdController.dispose();
    dateController.dispose();
    expenseHeadController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _showAddIncomeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Adjust the border radius as needed
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            width: 500, // Set width to make it a square
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Income',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: categoryController,
                        decoration: InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(), // Add border
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: invoiceIdController,
                        decoration: InputDecoration(
                          labelText: 'Invoice ID',
                          border: OutlineInputBorder(), // Add border
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: dateController,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(), // Add border
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: expenseHeadController,
                        decoration: InputDecoration(
                          labelText: 'Income Head',
                          border: OutlineInputBorder(), // Add border
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(), // Add border
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add Income functionality
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2CBF29), // Set background color here
                      ),
                      child: Text('Add Income', style: TextStyle(fontFamily: 'Poppins')),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey, // Set background color here
                      ),
                      child: Text('Cancel', style: TextStyle(fontFamily: 'Poppins')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Income',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // Add filter functionality here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        minimumSize: Size(100, 36),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      icon: const Icon(Icons.filter_list,
                                          color: Colors.white, size: 20),
                                      label: const Text('Filter By',
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        _showAddIncomeDialog(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        minimumSize: Size(100, 36),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white, size: 20),
                                      label: const Text('Add Income',
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Income List',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minWidth: MediaQuery.of(context).size.width),
                                child: DataTable(
                                  columnSpacing: 20.0,
                                  headingRowColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.blue),
                                  dividerThickness: 0, // Remove the dividers
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text('Invoice Id',
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Category',
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Income Head',
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Permitted Action',
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Amount',
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Date',
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    6, // Number of rows
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
                                        DataCell(Text('Category $index')),
                                        DataCell(Text('Income Head $index')),
                                        DataCell(Text('Permitted Action $index')),
                                        DataCell(Text('Amount $index')),
                                        DataCell(Text('Date $index')),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to previous page
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFF1EFEF), // Set background color here
                                  ),
                                  child: const Text(
                                    'Prev',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to page 1
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFF1EFEF), // Set background color here
                                  ),
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to page 2
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFF1EFEF), // Set background color here
                                  ),
                                  child: const Text(
                                    '2',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to page 3
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFF1EFEF), // Set background color here
                                  ),
                                  child: const Text(
                                    '3',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to next page
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:  const Color(0xFFF1EFEF), // Set background color here
                                  ),
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                color: const Color(0xFFF1EFEF),
                                child: const Text(
                                  'Page 1/22',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                  ),
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