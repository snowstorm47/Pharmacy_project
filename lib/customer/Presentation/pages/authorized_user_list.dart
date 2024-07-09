import 'package:clean_a/customer/data/user_data.dart';
import 'package:clean_a/customer/model/providerC.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';

class AuthorizedUser extends StatefulWidget {
  const AuthorizedUser({Key? key}) : super(key: key);

  @override
  _AuthorizedUserState createState() => _AuthorizedUserState();
}

class _AuthorizedUserState extends State<AuthorizedUser> {
  bool showSideMenu = false;

  void _editUser(BuildContext context, DataModel user) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController employeeIdController = TextEditingController(text: user.employeeId);
    final TextEditingController employeeNameController = TextEditingController(text: user.employeeName);
    final TextEditingController phoneController = TextEditingController(text: user.phone);
    final TextEditingController companyNameController = TextEditingController(text: user.companyName);
    final TextEditingController emailController = TextEditingController(text: user.email);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit User'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: employeeIdController,
                  decoration: const InputDecoration(labelText: 'Employee ID'),
                  validator: (value) => value!.isEmpty ? 'Please enter an employee ID' : null,
                ),
                TextFormField(
                  controller: employeeNameController,
                  decoration: const InputDecoration(labelText: 'Employee Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter an employee name' : null,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                  validator: (value) => value!.isEmpty ? 'Please enter a phone number' : null,
                ),
                TextFormField(
                  controller: companyNameController,
                  decoration: const InputDecoration(labelText: 'Company Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter a company name' : null,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) => value!.isEmpty ? 'Please enter an email' : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final updatedUser = DataModel(
                    employeeId: employeeIdController.text,
                    employeeName: employeeNameController.text,
                    phone: phoneController.text,
                    companyName: companyNameController.text,
                    email: emailController.text,
                  );

                 // print('Updated User: $updatedUser');

                  Provider.of<UserProvider>(context, listen: false).updateUser(updatedUser);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(BuildContext context, DataModel user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: const Text('Are you sure you want to delete this user?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false).deleteUser(user);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<DataModel> users = Provider.of<UserProvider>(context).users;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (MediaQuery.of(context).size.width > 768)
                  Expanded(
                    child: SideMenu(
                      onClose: () {
                        setState(() {
                          showSideMenu = false;
                        });
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
                            setState(() {
                              showSideMenu = !showSideMenu;
                            });
                          },
                          isSideMenuOpen: showSideMenu,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'Authorized Users List',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Poppins.regular',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              const Text(
                                'Here are the Authorized Users of Corporate Customers',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 20.0),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                      ),
                                      onPressed: () {
                                        // Implement filtering logic
                                      },
                                      child: const Text(
                                        'Filter By',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(236, 27, 228, 4),
                                      ),
                                      onPressed: () {
                                        // Navigate to add user screen or show dialog
                                        // Example:
                                        Navigator.pushNamed(context, '/add_authorized_user');
                                      },
                                      child: const Text(
                                        '+  Add User',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTableTheme(
                                  data: DataTableThemeData(
                                    headingRowColor: MaterialStateProperty.all(Colors.blue),
                                    dataRowColor: MaterialStateProperty.all(Colors.grey[200]),
                                    headingTextStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    dataTextStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: DataTable(
                                    columns: const [
                                      DataColumn(label: Text('Employee_Id')),
                                      DataColumn(label: Text('Employee_Name')),
                                      DataColumn(label: Text('Phone')),
                                      DataColumn(label: Text('Company Name')),
                                      DataColumn(label: Text('Email')),
                                      DataColumn(label: Text('Actions')),
                                    ],
                                    rows: users
                                        .map(
                                          (item) => DataRow(
                                            cells: [
                                              DataCell(Row(
                                                children: [
                                                  Checkbox(
                                                    value: false,
                                                    onChanged: (bool? value) {
                                                      // Add your checkbox functionality here
                                                    },
                                                  ),
                                                  const SizedBox(width: 8.0),
                                                  Text(item.employeeId),
                                                ],
                                              )),
                                              DataCell(Text(item.employeeName)),
                                              DataCell(Text(item.phone)),
                                              DataCell(Text(item.companyName)),
                                              DataCell(Text(item.email)),
                                              DataCell(Row(
                                                children: [
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.message,
                                                      color: Colors.black54,
                                                      size: 17,
                                                ),
                                                onPressed: () {
                                                  // Implement message action
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 17,
                                                ),
                                                onPressed: () {
                                                  _deleteUser(context, item);
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Colors.black54,
                                                  size: 17,
                                                ),
                                                onPressed: () {
                                                  _editUser(context, item);
                                                },
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
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
        if (showSideMenu && MediaQuery.of(context).size.width <= 768)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showSideMenu = false;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                color: Colors.black54.withOpacity(0.5),
              ),
            ),
          ),
      ],
    ),
  ),
);
  }}