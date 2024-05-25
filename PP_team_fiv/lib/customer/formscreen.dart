// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class TextFormScreen extends StatefulWidget {
  const TextFormScreen({super.key});

  @override
  State<TextFormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<TextFormScreen> {
  late String _companyName;
  late String _companyContactName;
  late String _companyContactEmail;
  late String _companyContactPhone;
  late String _companyAddress;
  late String _paymentTerms;
  late String _creditLimit;
  late String _medicalInsuranceProvider;
  late String _policyNumber;
  late String _emergencyContactPhone;
  late String _authorizedUsers;
  late String _additionalNotes;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildSidebarPlaceholder() {
    return Container(
      width: 306,
      height: 1024,
      color: Colors.grey[300],
      child: const Center(
        child: Text(
          'Sidebar Placeholder',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildLabeledField(String label, Widget field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        field,
      ],
    );
  }

  Widget _buildCompanyNameField() {
    return _buildLabeledField(
      'Company Name',
      TextFormField(
        decoration: _buildInputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Company name is required';
          }
          return null;
        },
        onSaved: (value) {
          _companyName = value!;
        },
      ),
    );
  }

  Widget _buildCompanyContactNameField() {
    return _buildLabeledField(
      'Company Contact Name',
      TextFormField(
        decoration: _buildInputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Company contact name is required';
          }
          return null;
        },
        onSaved: (value) {
          _companyContactName = value!;
        },
      ),
    );
  }

  Widget _buildCompanyContactEmailField() {
    return _buildLabeledField(
      'Company Contact Email',
      TextFormField(
        decoration: _buildInputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Company contact email is required';
          }
          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Enter a valid email address';
          }
          return null;
        },
        onSaved: (value) {
          _companyContactEmail = value!;
        },
      ),
    );
  }

  Widget _buildCompanyContactPhoneField() {
    return _buildLabeledField(
      'Company Contact Phone Number',
      TextFormField(
        decoration: _buildInputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Company contact phone is required';
          }
          if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
            return 'Enter a valid phone number';
          }
          return null;
        },
        onSaved: (value) {
          _companyContactPhone = value!;
        },
      ),
    );
  }

  Widget _buildCompanyAddressField() {
    return _buildLabeledField(
      'Company Address',
      TextFormField(
        decoration: _buildInputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Company address is required';
          }
          return null;
        },
        onSaved: (value) {
          _companyAddress = value!;
        },
      ),
    );
  }

  Widget _buildPaymentTermsField() {
    return _buildLabeledField(
      'Payment Terms',
      TextFormField(
        decoration: _buildInputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Payment terms are required';
          }
          return null;
        },
        onSaved: (value) {
          _paymentTerms = value!;
        },
      ),
    );
  }

  Widget _buildCreditLimitField() {
    return _buildLabeledField(
      'Credit Limit',
      TextFormField(
        decoration: _buildInputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Credit limit is required';
          }
          if (!isNumeric(value)) {
            return 'Please enter a valid number';
          }
          return null;
        },
        onSaved: (value) {
          _creditLimit = value!;
        },
      ),
    );
  }

  bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  Widget _buildAuthorizedUsersField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Authorized Users',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: 7,
          decoration: InputDecoration(
            hintText: 'Upload Excel file with the following columns:\n'
                '- Employee ID\n'
                '- Employee Name\n'
                '- Employee Contact Name\n'
                '- Employee Contact Phone\n'
                '- Company Name',
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 125.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add your upload file functionality here
                },
                icon: const Icon(Icons.upload_rounded),
                label: const Text(
                  'Upload Excel',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Authorized users information is required';
            }
            return null;
          },
          onSaved: (value) {
            _authorizedUsers = value!;
          },
        ),
      ],
    );
  }

  Widget _buildAdditionalComment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Additional Comments',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: 7,
          decoration: InputDecoration(
            hintText: 'Type your additional comments here...',
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          validator: (value) {
            // Add validation logic if needed
            return null;
          },
          onSaved: (value) {
            // Save the entered value if needed
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Header")),
      body: Row(
        children: [
          _buildSidebarPlaceholder(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Add New Corporate Company",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "You can add new corporate company here",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          Row(
                            children: [
                              Flexible(child: _buildCompanyNameField()),
                              const SizedBox(width: 10),
                              Flexible(child: _buildCompanyContactNameField()),
                              const SizedBox(width: 10),
                              Flexible(child: _buildCompanyContactEmailField()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Flexible(child: _buildCompanyContactPhoneField()),
                              const SizedBox(width: 10),
                              Flexible(child: _buildCompanyAddressField()),
                              const SizedBox(width: 10),
                              Flexible(child: _buildPaymentTermsField()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Flexible(child: _buildCreditLimitField()),
                              const SizedBox(width: 10),
                              Flexible(child: _buildCreditLimitField()),
                              const SizedBox(width: 10),
                              Flexible(child: _buildCreditLimitField()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(child: _buildAuthorizedUsersField()),
                              const SizedBox(width: 10),
                              Flexible(child: _buildAdditionalComment()),
                              const SizedBox(width: 10),
                              Flexible(child: _buildCreditLimitField()),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              _formKey.currentState!.save();
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
