import 'package:flutter/material.dart';
// import 'package:viewrolespage/constants.dart';
import '../util/constants.dart';
import '../util/my_tile.dart';

class desktopScaffold extends StatefulWidget {
  const desktopScaffold({super.key});

  @override
  State<desktopScaffold> createState() => _desktopScaffoldState();
}

class _desktopScaffoldState extends State<desktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      appBar: myAppBar,
      body: Row(
        children: [
          //open dreawer
          myDrawer,

          //rest of body
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'View Roles',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8), // Add spacing between title and search bar
                          Expanded(
                            flex: 2, // Adjust flex to make search bar smaller
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search for roles',
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 8), // Add spacing between search bar and filter button
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
                        ],
                      ),
                      SizedBox(height: 4), // Add spacing below the title
                      Text(
                        'Edit, Update and Remove roles',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
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
                              'NO',
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
                              'Employee name',
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
                              'Role',
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
                              'Permitted Action',
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
                              'System Access',
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
                              'Actions',
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
                      itemCount: 3, // Specify the number of tiles here
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
          )
        ],
      ),
    );
  }
}
