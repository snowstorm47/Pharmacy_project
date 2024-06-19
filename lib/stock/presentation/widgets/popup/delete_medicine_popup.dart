// delete_medicine_popup.dart
import 'package:flutter/material.dart';

class DeleteMedicinePopup extends StatelessWidget {
  final Function() onDeleteConfirmed;

  const DeleteMedicinePopup({super.key, required this.onDeleteConfirmed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Medicine'),
      content: const Text(
          'Are you sure you want to delete this medicine from stock?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            onDeleteConfirmed();
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text('Delete', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
