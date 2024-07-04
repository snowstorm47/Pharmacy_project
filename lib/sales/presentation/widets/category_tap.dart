import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
=======
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
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

<<<<<<< HEAD
  const CategoryTab(this.category, this.isActive);
=======
  const CategoryTab(this.category, this.isActive, {super.key});
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61

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
