import 'package:flutter/material.dart';

typedef SaveCallback = void Function(String?);

class InputFields extends StatelessWidget {
  final SaveCallback onCompanyNameSaved;
  final SaveCallback onCompanyContactNameSaved;
  final SaveCallback onCompanyContactEmailSaved;
  final SaveCallback onCompanyContactPhoneSaved;
  final SaveCallback onCompanyAddressSaved;
  final SaveCallback onPaymentTermsSaved;
  final SaveCallback onCreditLimitSaved;
  final SaveCallback onAuthorizedUsersSaved;
  final SaveCallback onAdditionalNotesSaved;
  final GlobalKey<FormState> formKey;

  const InputFields({
    super.key,
    required this.onCompanyNameSaved,
    required this.onCompanyContactNameSaved,
    required this.onCompanyContactEmailSaved,
    required this.onCompanyContactPhoneSaved,
    required this.onCompanyAddressSaved,
    required this.onPaymentTermsSaved,
    required this.onCreditLimitSaved,
    required this.onAuthorizedUsersSaved,
    required this.onAdditionalNotesSaved,
    required this.formKey,
  });

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildFormFields(context),
    );
  }

  List<Widget> _buildFormFields(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      return _buildDesktopFormFields();
    } else if (screenWidth >= 600 && screenWidth < 1200) {
      return _buildTabletFormFields();
    } else {
      return _buildMobileFormFields();
    }
  }

  List<Widget> _buildMobileFormFields() {
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
        child: Column(
          children: [
            _companyNameField(),
            _companyContactNameField(),
            _companyContactEmailField(),
            _companyContactPhoneField(),
            _companyAddressField(),
            _buildPaymentTermsField(),
            _companyNameField(),
            _companyContactNameField(),
            _companyContactEmailField(),
            _buildAuthorizedUsersField(),
            _buildAdditionalComment(),
            _buildPaymentTermsField(),
          ],
        ),
      )
    ];

    // Add other form fields here
  }

  List<Widget> _buildTabletFormFields() {
    return [
      Row(
        children: [
          Expanded(child: (_companyNameField())),
          const SizedBox(width: 20),
          Expanded(child: (_companyContactNameField())),
        ],
      ),
      const SizedBox(height: 14),
      Row(
        children: [
          Expanded(child: (_companyContactEmailField())),
          const SizedBox(width: 20),
          Expanded(child: (_companyContactPhoneField())),
        ],
      ),
      Row(
        children: [
          Expanded(child: (_companyAddressField())),
          const SizedBox(width: 20),
          Expanded(child: (_buildPaymentTermsField())),
        ],
      ),
      Row(
        children: [
          Expanded(child: _companyNameField()),
          const SizedBox(width: 20),
          Expanded(child: _companyContactNameField()),

          // Add more TextFormField widgets here
        ],
      ),
      Row(
        children: [
          Expanded(child: _companyNameField()),
          const SizedBox(width: 20),
          Expanded(child: _companyContactNameField()),

          // Add more TextFormField widgets here
        ],
      ),
      Row(
        children: [
          Expanded(child: _buildAuthorizedUsersField()),
          const SizedBox(width: 20),
          Expanded(child: _buildAdditionalComment()),

          // Add more TextFormField widgets here
        ],
      ),

      // Add more rows with two TextFormFields here if needed
    ];
  }

  List<Widget> _buildDesktopFormFields() {
    return [
      Row(
        children: [
          Expanded(child: _companyNameField()),
          const SizedBox(width: 30),
          Expanded(child: _companyContactNameField()),
          const SizedBox(width: 30),
          Expanded(child: _companyContactEmailField()),
          // Add more TextFormField widgets here
        ],
      ),
      const SizedBox(height: 5),
      Row(
        children: [
          Expanded(child: _companyContactPhoneField()),
          const SizedBox(width: 30),
          Expanded(child: _companyAddressField()),
          const SizedBox(width: 30),
          Expanded(child: _buildPaymentTermsField()),
          // Add more TextFormField widgets here
        ],
      ),
      const SizedBox(height: 5),
      Row(
        children: [
          Expanded(child: _companyContactPhoneField()),
          const SizedBox(width: 30),
          Expanded(child: _companyAddressField()),
          const SizedBox(width: 30),
          Expanded(child: _buildPaymentTermsField()),
          // Add more TextFormField widgets here
        ],
      ),
      const SizedBox(height: 5),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildAuthorizedUsersField()),
          const SizedBox(width: 30),
          Expanded(child: _buildAdditionalComment()),
          const SizedBox(width: 30),
          Expanded(child: _buildPaymentTermsField()),
          // Add more TextFormField widgets here
        ],
      ),
      // Add more rows if needed
    ];
  }

  // Define TextFormField widgets here

  Widget _companyNameField() {
    return _buildLabeledField(
      'Company Name',
      TextFormField(
        decoration: _buildInputDecoration(),
        style: const TextStyle(fontSize: 12),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Company name is required';
          }
          return null;
        },
        onSaved: onCompanyNameSaved,
      ),
    );
  }

  Widget _companyContactNameField() {
    return _buildLabeledField(
      'Company Contact Name',
      TextFormField(
        decoration: _buildInputDecoration(),
        style: const TextStyle(fontSize: 12), // Adjust font size
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Company contact name is required';
          }
          return null;
        },
        onSaved: onCompanyContactNameSaved,
      ),
    );
  }

  Widget _companyContactEmailField() {
    return _buildLabeledField(
      'Company Contact Email',
      TextFormField(
        decoration: _buildInputDecoration(),
        style: const TextStyle(fontSize: 12),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Company contact email is required';
          }
          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Enter a valid email address';
          }
          return null;
        },
        onSaved: onCompanyContactEmailSaved,
      ),
    );
  }

  Widget _companyContactPhoneField() {
    return _buildLabeledField(
      'Company Contact Phone Number',
      TextFormField(
          decoration: _buildInputDecoration(),
          style: const TextStyle(fontSize: 12),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Company contact phone is required';
            }
            if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
              return 'Enter a valid phone number';
            }
            return null;
          },
          onSaved: onCompanyContactPhoneSaved),
    );
  }

  Widget _companyAddressField() {
    return _buildLabeledField(
      'Company Address',
      TextFormField(
          decoration: _buildInputDecoration(),
          style: const TextStyle(fontSize: 12),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Company address is required';
            }
            return null;
          },
          onSaved: onCompanyAddressSaved),
    );
  }

  Widget _buildPaymentTermsField() {
    return _buildLabeledField(
      'Payment Terms',
      TextFormField(
          decoration: _buildInputDecoration(),
          style: const TextStyle(fontSize: 12),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Payment terms are required';
            }
            return null;
          },
          onSaved: onPaymentTermsSaved),
    );
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
            onSaved: onAuthorizedUsersSaved),
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
}
