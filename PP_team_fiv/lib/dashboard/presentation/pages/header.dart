import 'package:flutter/material.dart';
import '../../../shared/utility/responsiveDrawer.dart';

class HeaderPage extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final bool isSideMenuOpen;

  const HeaderPage({
    super.key,
    required this.onMenuPressed,
    required this.isSideMenuOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.0),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!ResponsiveD.isDesktop(context))
            IconButton(
              icon: isSideMenuOpen
                  ? const Icon(Icons.arrow_back, color: Colors.grey)
                  : const Icon(Icons.menu, color: Colors.grey),
              onPressed: onMenuPressed,
            ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: false,
              ),
              onChanged: (value) {
                // Handle search logic here
              },
            ),
          ),
          const Spacer(),
          const Row(
            children: [
              Icon(Icons.notifications, color: Colors.grey),
              SizedBox(width: 16),
              Icon(Icons.settings, color: Colors.grey),
              SizedBox(width: 16),
              Icon(Icons.account_circle, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
