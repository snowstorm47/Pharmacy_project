import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: SizedBox(
            width: 10,
            height: 40,
            child: Image.asset(
              'lib/image/hub.jpg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: _buildActions(screenWidth),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  List<Widget> _buildActions(double screenWidth) {
    if (screenWidth > 600) {
      // For larger screens
      SizedBox(width: 40,);
      return [
        const Icon(Icons.search, color: Colors.grey),
        const SizedBox(width: 40),
        const Text('Search', style: TextStyle(color: Colors.grey)),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: IconButton(
            icon: Image.asset(
              'lib/image/Icon Notification.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              // Handle notifications icon press
            },
          ),
        ),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: IconButton(
            icon: Image.asset(
              'lib/image/Vector.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              // Handle person icon press
            },
          ),
        ),
      ];
    } else {
      // For smaller screens
      return [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.grey),
          onPressed: () {
            // Handle search icon press
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: Image.asset(
              'lib/image/Icon Notification.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              // Handle notifications icon press
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: Image.asset(
              'lib/image/Vector.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              // Handle person icon press
            },
          ),
        ),
      ];
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
