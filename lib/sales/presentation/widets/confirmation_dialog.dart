import 'package:clean_a/sales/presentation/widgets/screen/sucess_screen.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Purchase'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Total:'),
            trailing: Text('\$60.00'), // Replace with dynamic total
          ),
          Divider(),
          ListTile(
            title: Text('Payment Method:'),
            subtitle: Text(
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
