import 'package:flutter/material.dart';

class DeleteEmployeePopup extends StatelessWidget {
  final String employeeName;

  const DeleteEmployeePopup({super.key, required this.employeeName});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Employee'),
      content: Text('Are you sure you want to delete $employeeName?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
