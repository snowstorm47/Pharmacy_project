import 'package:flutter/material.dart';

class FingerprintDialog extends StatelessWidget {
  const FingerprintDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Hey', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          const Icon(Icons.fingerprint, size: 100, color: Colors.blue),
          const SizedBox(height: 20),
          const Text('Scan your fingerprint', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
