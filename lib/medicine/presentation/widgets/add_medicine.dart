import 'package:clean_a/medicine/data/medicine_data.data.dart';
import 'package:clean_a/medicine/providers/medicine_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import '../providers/medicine_provider.dart'; // Adjust the path as per your project structure
//import '../data_md.dart'; // Adjust the path as per your project structure

class AddMedScreen extends StatefulWidget {
  @override
  _AddMedScreenState createState() => _AddMedScreenState();
}

class _AddMedScreenState extends State<AddMedScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _medicineName;
  late String _id;
  late String _genericName;
  late String _category;
  late String _weight;
  late String _expiryDate;
  late bool _isPrescribed = false;
  late bool _isTaxable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Medicine Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter medicine name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _medicineName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  _id = value!;
                },
              ),
              // Add more TextFormField widgets for other fields
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    DataMD newMedicine = DataMD(
                      medicineName: _medicineName,
                      id: _id,
                      genericName: _genericName,
                      category: _category,
                      weight: _weight,
                      expiryDate: _expiryDate,
                      isPrescribed: _isPrescribed,
                      isTaxable: _isTaxable,
                    );

                    Provider.of<MedicineProvider>(context, listen: false);
                       

                    Navigator.pop(context); // Close the screen after adding
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
