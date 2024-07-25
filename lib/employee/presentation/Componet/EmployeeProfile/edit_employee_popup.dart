import 'package:clean_a/employee/domain/entities/employee.dart';
import 'package:clean_a/employee/provider/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditEmployeePopup extends StatefulWidget {
  final Employee employee;

  const EditEmployeePopup({super.key, required this.employee});

  @override
  EditEmployeePopupState createState() => EditEmployeePopupState();
}

class EditEmployeePopupState extends State<EditEmployeePopup> {
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _positionController;
  late TextEditingController _addressController;
  late TextEditingController _locationController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.employee.FirstName);
    _lastNameController = TextEditingController(text:widget.employee.LastName);
    _positionController =
        TextEditingController(text: widget.employee.role);
    _addressController =
        TextEditingController(text: widget.employee.Address);
    _locationController =
        TextEditingController(text: widget.employee.location);
    _phoneController = TextEditingController(text: widget.employee.Phone);
    _emailController = TextEditingController(text: widget.employee.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    _addressController.dispose();
    _locationController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Employee'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _positionController,
              decoration: const InputDecoration(labelText: 'Position/Role'),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async{
            final provider = Provider.of<EmployeeProvider>(context,listen:false);
            final data = {
                 'FirstName': _nameController.text,
                 'LastName':_lastNameController.text,
              'role': _positionController.text,
              'address': _addressController.text,
              'location': _locationController.text,
              'Phone': _phoneController.text,
              'email': _emailController.text,
            };
            await provider.editEmployee(
              widget.employee.uid,updatedData:data
            );

            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
