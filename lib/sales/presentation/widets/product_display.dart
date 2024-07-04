import 'package:flutter/material.dart';

class ProductDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.75,
      ),
      itemCount: 10, // Replace with actual product count
      itemBuilder: (context, index) {
        return ProductCard(
          productName: 'Product ${index + 1}',
          description: 'Description of Product ${index + 1}',
          price: '\$10.00', // Replace with actual price
          isTaxable: index % 2 == 0, // Example of taxable status
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String description;
  final String price;
  final bool isTaxable;

  const ProductCard({
    required this.productName,
    required this.description,
    required this.price,
    required this.isTaxable,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(description, style: TextStyle(fontSize: 14)),
          Text(price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(isTaxable ? 'Taxable' : 'Non-taxable',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          ElevatedButton(
            onPressed: () {
              // Implement add to cart functionality
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
