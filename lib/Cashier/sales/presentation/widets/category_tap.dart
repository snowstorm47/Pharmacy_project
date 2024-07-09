import 'package:flutter/material.dart';

class CategoryTabsCashier extends StatelessWidget {
  const CategoryTabsCashier({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryTabCashier('Medicine', true), // Active tab example
          CategoryTabCashier('Personal Care', false), // Inactive tab example
          CategoryTabCashier('Supplements', false), // Inactive tab example
        ],
      ),
    );
  }
}

class CategoryTabCashier extends StatelessWidget {
  final String category;
  final bool isActive;

  const CategoryTabCashier(this.category, this.isActive, {super.key});

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
