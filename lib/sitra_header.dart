import 'package:flutter/material.dart';

class NewHeader extends StatelessWidget {
  final String title;

  const NewHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
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
              actions: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 40),
                const Text('Search', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 900),
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
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          const Expanded(
            child: Center(child: Text('')),
          ),
        ],
      ),
    );
  }
}
