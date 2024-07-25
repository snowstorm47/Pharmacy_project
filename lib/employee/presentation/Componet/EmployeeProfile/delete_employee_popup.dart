import 'package:clean_a/employee/provider/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteEmployeePopup extends StatelessWidget {
  final String employeeName;
  final String uid;
  final String lastName;

  const DeleteEmployeePopup({super.key, required this.employeeName,required this.uid, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Employee'),
      content: Text("Are you sure you want to delete '$employeeName  $lastName' ?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async{
            final provider = Provider.of<EmployeeProvider>(context,listen:false);
            await provider.removeEmployee(uid);
            Navigator.of(context).pop();
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
