import 'package:flutter/material.dart';
import '../util/constants.dart';
import '../util/my_tile.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController invoiceIdController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController expenseHeadController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Expense',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 150, // Adjust the width as needed
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add filter functionality
                  },
                  icon: Icon(Icons.menu),
                  label: Text(
                    'Filter by',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF7193E9)),
                  ),
                ),
              ),
              SizedBox(width: 10), // Space between the buttons
              SizedBox(
                width: 150, // Adjust the width as needed
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showAddExpenseDialog(context); // Show the add expense dialog
                  },
                  icon: Icon(Icons.add),
                  label: Text(
                    'Add Expense',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2CBF29)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(), // Placeholder for alignment
              ),
              Expanded(
                child: Text(
                  'Expense List',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(), // Placeholder for alignment
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            color: Color(0xFF7193E9),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Invoice ID',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Category',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Expense Head',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Amount',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Date',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tiles below it
          Expanded(
            child: ListView.builder(
              itemCount: 4, // Specify the number of tiles here
              itemBuilder: (context, index) {
                return const MyTile();
              },
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to previous page
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF1EFEF), // Set background color here
                ),
                child: Text(
                  'Prev',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to previous page
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF1EFEF), // Set background color here
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to previous page
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF1EFEF), // Set background color here
                    ),
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to previous page
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF1EFEF), // Set background color here
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to previous page
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF1EFEF), // Set background color here
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Color(0xFFF1EFEF),
              child: Text(
                'Page 1/22',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
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
                Text('Add Expense', style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.bold)),
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
                          labelText: 'Expense Head',
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
                        // Add Expense functionality
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2CBF29), // Set background color here
                      ),
                      child: Text('Add Expense', style: TextStyle(fontFamily: 'Poppins')),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Set background color here
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
}