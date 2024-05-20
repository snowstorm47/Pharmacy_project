import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  const MyTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material( // Wrap MyTile with Material widget
        color: Colors.transparent, // Set the color to transparent for debugging
        child: Container(
          color: Color(0xFFF1EFEF),
          height: 100,
          child: Row(
            children: [
              Expanded(
                child: Container(// Adjust the height here
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(// Adjust the height here
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Ayele Kebede',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(// Adjust the height here
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Pharmacicst',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Read',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Medicine',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Report',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Return',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align icons side by side
                    children: [
                      Icon(Icons.delete, size: 16, color: Colors.red,),
                      Icon(Icons.edit, size: 16, color: Colors.black,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
