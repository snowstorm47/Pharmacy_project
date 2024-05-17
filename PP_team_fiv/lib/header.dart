import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 202, 202),
      appBar: AppBar(
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Image.asset(
                'lib/image/hub.jpg',
                 // Increase the width to make the logo larger
               // Ensure the image fits within the available space
              ), // Replace with your logo image
            ),
            const SizedBox(width: 8.0), // Add some space between the logo and the search icon
            const Icon(Icons.search, color: Colors.grey),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Image.asset(
                'lib/image/Icon Notification.png',
                width: 24, // Adjust the width to your desired size
                height: 24, // Adjust the height to your desired size
              ),
              onPressed: () {
                // Handle notifications icon press
              },
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Image.asset(
                'lib/image/Vector.png',
                width: 24, // Adjust the width to your desired size
                height: 24, // Adjust the height to your desired size
              ),
              onPressed: () {
                // Handle person icon press
              },
            ),
          ),
        ],
        backgroundColor: Colors.white, // Set the AppBar background color
        elevation: 0, // Remove the default AppBar shadow
      ),
    );
  }
}