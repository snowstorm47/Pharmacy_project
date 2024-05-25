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
                    '#7k1456',
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
                    'Tablet',
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
                child: Container(// Adjust the height here
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Sales Rate',
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
                    '2000000',
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
                    '22/02/23',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
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
