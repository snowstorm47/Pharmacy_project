import 'package:clean_a/customer/data/user_data.dart';

import 'package:clean_a/customer/providers/customerProviders.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
//import 'package:clean_a/shared/constants/user_data.dart'; // Import your DataModel class
import 'package:provider/provider.dart';
//import 'package:clean_a/shared/provider/user_provider.dart'; // Import your UserProvider class

class AddAuthorizedUser extends StatefulWidget {
  const AddAuthorizedUser({super.key});

  @override
  State<AddAuthorizedUser> createState() => _AddAuthorizedUserState();
}

class _AddAuthorizedUserState extends State<AddAuthorizedUser> {
  final TextEditingController _firstNameController = TextEditingController();
    final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
final TextEditingController _adressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _subcityController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _employeeidController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F0),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                 if (ResponsiveD.isDesktop(context))
                Expanded(
                  child: SideMenu(
                    onClose: () {
                       setState(() {
                          
                        });
                      // Handle closing of side menu
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        HeaderPage(
                          onMenuPressed: () {
                            // Handle menu press
                          },
                          isSideMenuOpen: false, // Update this as needed
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'Add Authorized User',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins.regular',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              const Text(
                                'You can add a new authorized user here',
                                style: TextStyle(fontFamily: 'Poppins.regular'),
                              ),
                              const SizedBox(height: 20.0),
                              TextField(
                                controller: _firstNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Name',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextField(
                                controller: _lastNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Last Name',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextField(
                                controller: _phoneController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Phone Number',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextField(
                                controller: _companyNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Company Name',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                                TextField(
                                controller: _adressController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Address',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                                TextField(
                                controller: _subcityController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'subcity',
                                ),
                              ),
                           const SizedBox(height: 20.0),
                                  TextField(   
                                controller: _cityController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'City',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                                TextField(
                                controller: _roleController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Role/Position',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                                TextField(
                                controller: _employeeidController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Employee Id',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                                TextField(
                                maxLines: 4,
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Description',
                                ),
                              ),
                              
                              const SizedBox(height: 20.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(236, 27, 228, 4)),
                                onPressed: () {
                                   try {
     Provider.of<CustomerProvider>(context, listen: false).addCreditUser(employeeId:_employeeidController.text, firstName: _firstNameController.text, lastName: _lastNameController.text, email: _emailController.text, company: _companyNameController.text, address: _adressController.text, city: _cityController.text, subCity: _subcityController.text, role: _roleController.text, details:_descriptionController.text, phone: _phoneController.text);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User ${_firstNameController.text} ${_lastNameController.text} added successfully')));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error deleting user: $e')));
                }
                                  _firstNameController.clear();
                                  _phoneController.clear();
                                  _companyNameController.clear();
                                  _emailController.clear();
                                  _lastNameController.clear();
                              _phoneController.clear();
                              _adressController.clear();
                                _cityController.clear();
                              _subcityController.clear();
                              _roleController.clear();
                                _employeeidController.clear();
                              _descriptionController.clear();

                                  // Navigate back or handle as needed
                                },
                                child: const Text('Add User',style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}