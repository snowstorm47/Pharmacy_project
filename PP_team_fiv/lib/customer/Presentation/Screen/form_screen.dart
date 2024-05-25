// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../widgets/input_field.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Define variables to hold the form field values
  String? _companyName;
  String? _companyContactName;
  String? _companyContactEmail;
  String? _companyAddress;
  String? _paymentTerms;
  String? _creditLimit;
  String? _authorizedUsers;
  String? _additionalNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Header")),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Check the screen size and adjust the layout accordingly
          if (constraints.maxWidth >= 1200) {
            // For desktop screens
            return Row(
              children: [
                const SidebarPlaceholder(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: _buildForm(),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // For smaller screens, hide the sidebar
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: _buildForm(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add New Corporate Company",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "You can add new corporate company here",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          InputFields(
            onCompanyNameSaved: (value) {
              _companyName = value;
            },
            onCompanyContactNameSaved: (value) {
              _companyContactName = value;
            },
            onCompanyContactEmailSaved: (value) {
              _companyContactEmail = value;
            },
            onCompanyContactPhoneSaved: (value) {},
            onCompanyAddressSaved: (value) {
              _companyAddress = value;
            },
            onPaymentTermsSaved: (value) {
              _paymentTerms = value;
            },
            onCreditLimitSaved: (value) {
              _creditLimit = value;
            },
            onAuthorizedUsersSaved: (value) {
              _authorizedUsers = value;
            },
            onAdditionalNotesSaved: (value) {
              _additionalNotes = value;
            },
            formKey: _formKey,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
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
    );
  }
}

// Placeholder widget for the sidebar
class SidebarPlaceholder extends StatelessWidget {
  const SidebarPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
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
}
