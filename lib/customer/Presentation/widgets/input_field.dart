import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function(String?) onCompanyNameSaved;
  final void Function(String?) onCompanyContactNameSaved;
  final void Function(String?) onCompanyContactEmailSaved;
  final void Function(String?) onCompanyAddressSaved;
  final void Function(String?) onPaymentTermsSaved;
  final void Function(String?) onCreditLimitSaved;
  final void Function(String?) onAuthorizedUsersSaved;
  final void Function(String?) onAdditionalNotesSaved;

  const InputFields({
    Key? key,
    required this.formKey,
    required this.onCompanyNameSaved,
    required this.onCompanyContactNameSaved,
    required this.onCompanyContactEmailSaved,
    required this.onCompanyAddressSaved,
    required this.onPaymentTermsSaved,
    required this.onCreditLimitSaved,
    required this.onAuthorizedUsersSaved,
    required this.onAdditionalNotesSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Company Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a company name';
            }
            return null;
          },
          onSaved: onCompanyNameSaved,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(labelText: 'Contact Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a contact name';
            }
            return null;
          },
          onSaved: onCompanyContactNameSaved,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(labelText: 'Contact Email'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a contact email';
            } else if (!value.contains('@')) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          onSaved: onCompanyContactEmailSaved,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(labelText: 'Company Address'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a company address';
            }
            return null;
          },
          onSaved: onCompanyAddressSaved,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(labelText: 'Payment Terms'),
          onSaved: onPaymentTermsSaved,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(labelText: 'Credit Limit'),
          keyboardType: TextInputType.number,
          onSaved: onCreditLimitSaved,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(labelText: 'Authorized Users'),
          onSaved: onAuthorizedUsersSaved,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(labelText: 'Additional Notes'),
          maxLines: 3,
          onSaved: onAdditionalNotesSaved,
        ),
      ],
    );
  }
}
