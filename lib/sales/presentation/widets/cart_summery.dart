import 'package:clean_a/sales/presentation/widgets/screen/sucess_screen.dart';
import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Replace with actual cart items count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Product ${index + 1}'),
                  subtitle:
                      const Text('Quantity: 2'), // Replace with actual quantity
                  trailing: const Text('\$20.00'), // Replace with actual price
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Total:'),
            trailing: const Text('\$60.00'), // Replace with actual total amount
          ),
          ElevatedButton(
            onPressed: () {
              _showConfirmationDialog(context);
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Purchase'),
          content: const Text('Total: \$60.00'), // Replace with dynamic total
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _showSuccessScreen(context);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessScreen(BuildContext context) {
    Navigator.of(context).pop(); // Close confirmation dialog
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SuccessScreen(),
    ));
  }
}
