
import 'package:clean_a/customer/domain/entities/corp_employee.dart';

import 'package:clean_a/customer/providers/customerProviders.dart';
import 'package:clean_a/navigationprov.dart';
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
  @override
   @override
  void initState(){
    super.initState();
    Future.microtask(() {
      Provider.of<CustomerProvider>(context, listen: false).getAllcustomers();
    });
  }

  void _editUser(BuildContext context, Corpemployee user) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController firstNameController = TextEditingController(text: user.firstName );
    final TextEditingController lastNameController = TextEditingController(text: user.lastName );
    final TextEditingController phoneController = TextEditingController(text: user.phone);

    final TextEditingController emailController = TextEditingController(text: user.email);
    final TextEditingController addressController = TextEditingController(text: user.address);
    final TextEditingController subCityController = TextEditingController(text: user.subCity);
    final TextEditingController cityController = TextEditingController(text: user.city);
    final TextEditingController roleController = TextEditingController(text: user.role);
    final TextEditingController creditController= TextEditingController(text:user.credit.toString());
    

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
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter first name' : null,
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter an last name' : null,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                  validator: (value) => value!.isEmpty ? 'Please enter a phone number' : null,
                ),
              
              
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) => value!.isEmpty ? 'Please enter an email' : null,
                ),
                  TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) => value!.isEmpty ? 'Please enter adress' : null,
                ),
                  TextFormField(
                  controller: subCityController,
                  decoration: const InputDecoration(labelText: 'Sub-City'),
                  validator: (value) => value!.isEmpty ? 'Please enter SubCity' : null,
                ),
                  TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(labelText: 'City'),
                  validator: (value) => value!.isEmpty ? 'Please enter city' : null,
                ),
                  TextFormField(
                  controller: roleController,
                  decoration: const InputDecoration(labelText: 'Role/Position'),
                  validator: (value) => value!.isEmpty ? 'Please enter Role' : null,
                ),
                  TextFormField(
                  controller: creditController,
                  decoration: const InputDecoration(labelText: 'Credit'),
                  validator: (value) => value!.isEmpty ? 'Please enter an Credit' : null,
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
              onPressed: () async{
                if (_formKey.currentState!.validate()) {
                 final customer = Corpemployee(
                  employeeId:user.employeeId,
                  details:user.details,
                  firstName:firstNameController.text,
                  lastName:lastNameController.text,
                  email:emailController.text,
                  company:user.company,
                  role:roleController.text,
                  phone:phoneController.text,
                  address:addressController.text,
                  city:cityController.text,
                  subCity:subCityController.text,
                  credit:double.parse(creditController.text)
                 );
  try {
                               await  Provider.of<CustomerProvider>(context, listen: false).editCustomer(user.company,user.employeeId,updatedData:customer.toMap());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User ${user.firstName} ${user.lastName} edited successfully')));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error editing user: $e')));
                  Navigator.of(context).pop();
                }
                 // print('Updated User: $updatedUser')

                  
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(BuildContext context, Corpemployee user) {
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
              onPressed: ()async {
                 try {
                  await Provider.of<CustomerProvider>(context, listen: false).deleteCustomer(user.company, user.employeeId);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User ${user.firstName} ${user.lastName} deleted successfully')));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error deleting user: $e')));
                   Navigator.of(context).pop();
                }
               
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
    List<Corpemployee>? users = Provider.of<CustomerProvider>(context).employee;
if(users !=null){
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
                                      Provider.of<NavigationProvider>(context,listen:false).navigateTo('/customer/add_authorized_user');
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
                                      DataColumn(label: Text('First Name')),
                                      DataColumn(label:Text('Last Name')),
                                      DataColumn(label: Text('Phone')),
                                      DataColumn(label: Text('Company Name')),
                                      DataColumn(label: Text('Email')),
                                      DataColumn(label: Text('Actions')),
                                    ],
                                    rows: users!
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
                                              // DataCell(Text(item.employeeId)),
                                              DataCell(Text(item.firstName)),
                                              DataCell(Text(item.lastName)),
                                              DataCell(Text(item.phone)),
                                              DataCell(Text(item.company)),
                                              DataCell(Text(item.email)),
                                              DataCell(Row(
                                                children: [
                                              //     IconButton(
                                              //       icon: const Icon(
                                              //         Icons.message,
                                              //         color: Colors.black54,
                                              //         size: 17,
                                              //   ),
                                              //   onPressed: () {
                                              //     // Implement message action
                                              //   },
                                              // ),
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
);}
else{
  return Container(
    child:Scaffold(
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
                        )
              ]),
                  )
                  )
          ])
                 ] )
                 )
                 ));
}
  }}