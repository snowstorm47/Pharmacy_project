import 'package:flutter/material.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  AddMedicinePageState createState() => AddMedicinePageState();
}

class AddMedicinePageState extends State<AddMedicinePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _genericNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _locationCodeController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _stockBoxController = TextEditingController();
  final TextEditingController _supplierPriceController =
      TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _genericNameController.dispose();
    _categoryController.dispose();
    _weightController.dispose();
    _locationCodeController.dispose();
    _expiryDateController.dispose();
    _stockBoxController.dispose();
    _supplierPriceController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  void _saveMedicine() {
    if (_formKey.currentState!.validate()) {
      // Implement the save logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Medicine added to stock')),
      );
      Navigator.pop(context); // Navigate back to previous page
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _idController.clear();
    _genericNameController.clear();
    _categoryController.clear();
    _weightController.clear();
    _locationCodeController.clear();
    _expiryDateController.clear();
    _stockBoxController.clear();
    _supplierPriceController.clear();
    _detailsController.clear();
  }

  InputDecoration _inputDecoration(String labelText) {
    return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context); // Navigate back to previous page
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Add New Medicine To Stock',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Add new medicines to stock',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 50, 200, 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: _inputDecoration('Medicine Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the medicine name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _idController,
                            decoration: _inputDecoration(
                              'Medicine ID',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the medicine ID';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _weightController,
                            decoration: _inputDecoration('Weight'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the weight';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _genericNameController,
                            decoration: _inputDecoration('Generic Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the generic name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _locationCodeController,
                            decoration: _inputDecoration('Location Code'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the location code';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _categoryController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 16.0),
                              labelText: 'Category',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.arrow_drop_down),
                                onPressed: () {
                                  // Handle dropdown menu here
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the category';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _expiryDateController,
                            decoration: _inputDecoration('Expiry Date'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the expiry date';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _stockBoxController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 16.0),
                              labelText: 'Stock/Box',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      int value = int.tryParse(
                                              _stockBoxController.text) ??
                                          0;
                                      if (value > 0) {
                                        setState(() {
                                          _stockBoxController.text =
                                              (value - 1).toString();
                                        });
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      int value = int.tryParse(
                                              _stockBoxController.text) ??
                                          0;
                                      setState(() {
                                        _stockBoxController.text =
                                            (value + 1).toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the stock/box';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _supplierPriceController,
                            decoration: _inputDecoration('Supplier Price'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the supplier price';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                      controller: _detailsController,
                      maxLines: 4,
                      decoration: _inputDecoration('Medicine Details'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the medicine details';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _saveMedicine,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            'Add Medicine',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 40),
                        ElevatedButton(
                          onPressed: _resetForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Reset',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    // Your form fields here...
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
