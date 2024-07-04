import 'package:clean_a/sales/presentation/widgets/screen/sucess_screen.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Purchase'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Total:'),
            trailing: const Text('\$60.00'), // Replace with dynamic total
          ),
          const Divider(),
          ListTile(
            title: const Text('Payment Method:'),
            subtitle: const Text(
                'Credit/Debit Card'), // Replace with selected payment method
          ),
        ],
      ),
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
  }

  void _showSuccessScreen(BuildContext context) {
    Navigator.of(context).pop(); // Close confirmation dialog
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SuccessScreen(),
    ));
  }
}
