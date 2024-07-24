import 'package:clean_a/customer/data/user_data.dart';
import 'package:clean_a/customer/model/providerC.dart';
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
  TextEditingController _employeeNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
TextEditingController _adressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _subcityController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _employeeidController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
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
                                controller: _employeeNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Employee Name',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Phone Number',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextField(
                                controller: _companyNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Company Name',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                                TextField(
                                controller: _adressController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Adress',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                                TextField(
                                controller: _subcityController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'subcity',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                                TextField(
                                controller: _roleController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'role/position',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                                TextField(
                                controller: _employeeidController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Employee_Id',
                                ),
                              ),
                              
                              const SizedBox(height: 20.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4)),
                                onPressed: () {
                                  // Create a new DataModel instance
                                  DataModel newUser = DataModel(
                                    employeeId: '', // Assign as needed
                                    employeeName: _employeeNameController.text,
                                    phone: _phoneController.text,
                                    companyName: _companyNameController.text,
                                    email: _emailController.text,
                                   
                                  );

                                  // Access the UserProvider and add the user
                                  Provider.of<UserProvider>(context, listen: false).addUser(newUser);

                                  // Clear text fields after adding
                                  _employeeNameController.clear();
                                  _phoneController.clear();
                                  _companyNameController.clear();
                                  _emailController.clear();

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