import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryTab('Medicine', true), // Active tab example
          CategoryTab('Personal Care', false), // Inactive tab example
          CategoryTab('Supplements', false), // Inactive tab example
        ],
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String category;
  final bool isActive;

  const CategoryTab(this.category, this.isActive, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(category),
        backgroundColor: isActive ? Colors.blue : Colors.blue.withOpacity(0.3),
      ),
    );
  }
}
