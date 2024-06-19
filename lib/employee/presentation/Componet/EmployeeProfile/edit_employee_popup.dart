import 'package:flutter/material.dart';

class EditEmployeePopup extends StatefulWidget {
  final Map<String, String> employee;

  const EditEmployeePopup({super.key, required this.employee});

  @override
  EditEmployeePopupState createState() => EditEmployeePopupState();
}

class EditEmployeePopupState extends State<EditEmployeePopup> {
  late TextEditingController _nameController;
  late TextEditingController _positionController;
  late TextEditingController _addressController;
  late TextEditingController _locationController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.employee['name']);
    _positionController =
        TextEditingController(text: widget.employee['position']);
    _addressController =
        TextEditingController(text: widget.employee['address']);
    _locationController =
        TextEditingController(text: widget.employee['location']);
    _phoneController = TextEditingController(text: widget.employee['phone']);
    _emailController = TextEditingController(text: widget.employee['email']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    _addressController.dispose();
    _locationController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
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
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _positionController,
              decoration: const InputDecoration(labelText: 'Position'),
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
          onPressed: () {
            Navigator.of(context).pop({
              'name': _nameController.text,
              'position': _positionController.text,
              'address': _addressController.text,
              'location': _locationController.text,
              'phone': _phoneController.text,
              'email': _emailController.text,
            });
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
