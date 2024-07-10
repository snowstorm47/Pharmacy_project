import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
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

  void _showAddExpenseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add Expense',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: categoryController,
                        decoration: const InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: invoiceIdController,
                        decoration: const InputDecoration(
                          labelText: 'Invoice ID',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: dateController,
                        decoration: const InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: expenseHeadController,
                        decoration: const InputDecoration(
                          labelText: 'Expense Head',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2CBF29),
                      ),
                      child: const Text('Add Expense',
                          style: TextStyle(fontFamily: 'Poppins')),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text('Cancel',
                          style: TextStyle(fontFamily: 'Poppins')),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: ListView(
                          padding: const EdgeInsets.all(16.0),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Expense',
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
                                        minimumSize: const Size(100, 36),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      icon: const Icon(Icons.filter_list,
                                          color: Colors.white, size: 20),
                                      label: const Text('Filter By',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        _showAddExpenseDialog(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        minimumSize: const Size(100, 36),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white, size: 20),
                                      label: const Text('Add Expense',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Expense List',
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
                                    minWidth:
                                        MediaQuery.of(context).size.width),
                                child: DataTable(
                                  columnSpacing: 20.0,
                                  headingRowColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.blue),
                                  dividerThickness: 0,
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text('Invoice Id',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Category',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Expense Head',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Amount',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Date',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    6,
                                    (index) => DataRow(
                                      color: MaterialStateColor.resolveWith(
                                          (states) {
                                        return index % 2 == 0
                                            ? Colors.grey[200]!
                                            : Colors.white;
                                      }),
                                      cells: <DataCell>[
                                        DataCell(Text('Invoice $index')),
                                        DataCell(Text('Category $index')),
                                        DataCell(Text('Expense Head $index')),
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
                                    backgroundColor: const Color(0xFFF1EFEF),
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
                                    backgroundColor: const Color(0xFFF1EFEF),
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
                                    backgroundColor: const Color(0xFFF1EFEF),
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
                                    backgroundColor: const Color(0xFFF1EFEF),
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
                                    backgroundColor: const Color(0xFFF1EFEF),
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
