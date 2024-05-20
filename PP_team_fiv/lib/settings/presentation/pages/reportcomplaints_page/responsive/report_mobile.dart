import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:viewrolespage/constants.dart';
// import 'package:viewrolespage/util/my_tile.dart';
// import 'package:viewrolespage/util/my_box.dart';
import '../util/constants.dart';
import '../util/my_tile.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Report Complaints',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'View and take actions to complaints on report',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          ElevatedButton.icon(
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
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              // Add recycle functionality
            },
            icon: Icon(
                Icons.refresh,
                color: Colors.black,
            ), // Assuming you want to use the refresh icon
            label: Text(
              'Refresh',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF1EFEF)), // Adjust the background color as needed
            ),
          ),
          SizedBox(height: 16),

          Container(
            color: Color(0xFF7193E9),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'NO',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Employee Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Time stamp',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Status',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Actions',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),


          // Tiles below it
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Specify the number of tiles here
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
}