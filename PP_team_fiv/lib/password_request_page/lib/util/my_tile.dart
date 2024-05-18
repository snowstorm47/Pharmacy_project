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
                    'ayele@gmail.com',
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
                    ' Friday, March 22, 2024 at 10:55 AM EAT',
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
                        '192.168.0.9',
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
                child: Container(// Adjust the height here
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    ' 1',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Add action functionality
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF7193E9)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Actions',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
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
