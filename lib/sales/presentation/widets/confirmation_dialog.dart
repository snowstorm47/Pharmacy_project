<<<<<<< HEAD
import 'package:clean_a/sales/presentation/widgets/screen/sucess_screen.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
=======
import 'package:clean_a/sales/presentation/widgets/screen/success_screen.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Purchase'),
<<<<<<< HEAD
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
=======
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
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
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
