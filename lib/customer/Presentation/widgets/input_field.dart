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
<<<<<<< HEAD
    Key? key,
=======
    super.key,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
    required this.formKey,
    required this.onCompanyNameSaved,
    required this.onCompanyContactNameSaved,
    required this.onCompanyContactEmailSaved,
    required this.onCompanyAddressSaved,
    required this.onPaymentTermsSaved,
    required this.onCreditLimitSaved,
    required this.onAuthorizedUsersSaved,
    required this.onAdditionalNotesSaved,
<<<<<<< HEAD
  }) : super(key: key);
=======
  });
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
<<<<<<< HEAD
=======
          // ignore: prefer_const_constructors
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
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
<<<<<<< HEAD
          decoration: InputDecoration(labelText: 'Contact Name'),
=======
          decoration: const InputDecoration(labelText: 'Contact Name'),
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
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
<<<<<<< HEAD
          decoration: InputDecoration(labelText: 'Contact Email'),
=======
          decoration: const InputDecoration(labelText: 'Contact Email'),
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
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
<<<<<<< HEAD
          decoration: InputDecoration(labelText: 'Company Address'),
=======
          decoration: const InputDecoration(labelText: 'Company Address'),
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
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
<<<<<<< HEAD
          decoration: InputDecoration(labelText: 'Payment Terms'),
=======
          decoration: const InputDecoration(labelText: 'Payment Terms'),
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
          onSaved: onPaymentTermsSaved,
        ),
        const SizedBox(height: 12),
        TextFormField(
<<<<<<< HEAD
          decoration: InputDecoration(labelText: 'Credit Limit'),
=======
          decoration: const InputDecoration(labelText: 'Credit Limit'),
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
          keyboardType: TextInputType.number,
          onSaved: onCreditLimitSaved,
        ),
        const SizedBox(height: 12),
        TextFormField(
<<<<<<< HEAD
          decoration: InputDecoration(labelText: 'Authorized Users'),
=======
          decoration: const InputDecoration(labelText: 'Authorized Users'),
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
          onSaved: onAuthorizedUsersSaved,
        ),
        const SizedBox(height: 12),
        TextFormField(
<<<<<<< HEAD
          decoration: InputDecoration(labelText: 'Additional Notes'),
=======
          decoration: const InputDecoration(labelText: 'Additional Notes'),
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
          maxLines: 3,
          onSaved: onAdditionalNotesSaved,
        ),
      ],
    );
  }
}
