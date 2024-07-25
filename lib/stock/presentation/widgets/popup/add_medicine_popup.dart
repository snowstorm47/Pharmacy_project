import 'package:clean_a/medicine/domain/entities/batch.dart';
import 'package:clean_a/medicine/providers/medicine_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  final TextEditingController _supplierPriceController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  DateTime? expiryDate;
  bool taxable= false;
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
    _sellingPriceController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  void _saveMedicine() async {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<MedicineProvider>(context, listen: false);

      final batch = Batch(
        medName: _nameController.text,
        branchName: _idController.text,
        location: _locationCodeController.text,
        expiryDate: expiryDate!,
        stock: int.parse(_stockBoxController.text),
        suppliersPrice: double.parse(_supplierPriceController.text),
        sellingPrice: double.parse(_sellingPriceController.text), 
        batchNumber: DateTime.now().toString(), 
        dateAdded: DateTime.now(), 
        taxable: taxable,
      );

      await provider.editBatch(_nameController.text,updateData: batch.toMap() );

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
    _sellingPriceController.clear();
    _detailsController.clear();
  }

  InputDecoration _inputDecoration(String labelText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
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
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 50),
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
                            decoration: _inputDecoration('Branch Name'),
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
                          Row(
                            children: [
                              Checkbox(
                                value: taxable,
                                onChanged: (bool? value) {
                                  setState(() {
                                    taxable = value!;
                                  });
                                  print(value);
                                },
                              ),
                              const Text('Taxable'),
                            ],
                          ),
                        const SizedBox(width: 30),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _categoryController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
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
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    setState(() {
                                      expiryDate = pickedDate;
                                    });
                                  }
                                },
                                child: const Text('Select Expiry Date'),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                expiryDate != null
                                    ? 'Expiry Date: ${expiryDate.toString().split(' ')[0]}'
                                    : 'No date selected',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _stockBoxController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
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
                                      int value = int.tryParse(_stockBoxController.text) ?? 0;
                                      if (value > 0) {
                                        setState(() {
                                          _stockBoxController.text = (value - 1).toString();
                                        });
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      int value = int.tryParse(_stockBoxController.text) ?? 0;
                                      setState(() {
                                        _stockBoxController.text = (value + 1).toString();
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
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _sellingPriceController,
                            decoration: _inputDecoration('Selling Price'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the selling price';
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
                          child: const Text('Reset', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
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
