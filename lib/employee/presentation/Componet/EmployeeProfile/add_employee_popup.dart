import 'dart:typed_data';

import 'package:clean_a/employee/provider/employee_provider.dart';
import 'package:clean_a/shared/models/puser.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../shared/services/providers/registrationProvider.dart';

class AddEmployeePopup extends StatefulWidget {
  const AddEmployeePopup({super.key});

  @override
  AddEmployeePopupState createState() => AddEmployeePopupState();
}

class AddEmployeePopupState extends State<AddEmployeePopup> {
  final _formKey = GlobalKey<FormState>();
  final List<String> access = [];
  final List<String> permission = [];
    Uint8List? webImage;
    Uint8List? cvFile;
    DateTime? DoB;
    String _gender='Male';

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _positionController = TextEditingController();
  final _addressController = TextEditingController();
  final _locationController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
    final _salaryController = TextEditingController();
    final _branchController= TextEditingController();

  final Map<String, bool> Access = {
    'Medicine': false,
    'Sales': false,
    'All': false,
  };

  final Map<String, bool> Permission = {
    'Add': false,
    'Edit': false,
    'Delete': false,
  };

  void _onAccessCheckedChange(String option, bool isChecked) {
    setState(() {
      Access[option] = isChecked;
      if (isChecked) {
        access.add(option);
      } else {
        access.remove(option);
      }
    });
  }

  void _onPermissionCheckedChange(String option, bool isChecked) {
    setState(() {
      Permission[option] = isChecked;
      if (isChecked) {
        permission.add(option);
      } else {
        permission.remove(option);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _positionController.dispose();
    _addressController.dispose();
    _locationController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _branchController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setDialogState) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'First Name'),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(labelText: 'Last Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a last name';
                        }
                        return null;
                      },
                    ),
                     TextFormField(
                      controller: _branchController,
                      decoration: const InputDecoration(labelText: 'Branch'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a role';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _positionController,
                      decoration: const InputDecoration(labelText: 'Position'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a role';
                        }
                        return null;
                      },
                    ),
                     TextFormField(
                      controller: _salaryController,
                      decoration: const InputDecoration(labelText: 'Salary'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Salary';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(labelText: 'Address'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(labelText: 'Location'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a location';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: 'Phone'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        return null;
                      },
                    ),
                       TextFormField(
                      controller: _passwordController,
                      obscureText:true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Password';
                        }
                        return null;
                      },
                    ),
                    Text(
                      'Gender',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            setDialogState(() {
                              _gender = value!;
                            });
                          },
                        ),
                        const Text('Male'),
                        Radio<String>(
                          value: 'Female',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            setDialogState(() {
                              _gender = value!;
                            });
                          },
                        ),
                        const Text('Female'),
                      ],
                    ),   
                    Divider(),
                    Text('Access', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Column(
                      children: Access.keys.map((String key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: Access[key],
                          onChanged: (bool? value) {
                            setDialogState(() {
                              Access[key] = value!;
                              if (value) {
                                access.add(key);
                              } else {
                                access.remove(key);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                    Divider(),
                    Text('Permission', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Column(
                      children: Permission.keys.map((String key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: Permission[key],
                          onChanged: (bool? value) {
                            setDialogState(() {
                              Permission[key] = value!;
                              if (value) {
                                permission.add(key);
                              } else {
                                permission.remove(key);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                        Divider(),
                    Row(
                     children: [
                       ElevatedButton(
                                    onPressed: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2101),
                                      );
                                      if (pickedDate != null) {
                                        setDialogState(() {
                                          DoB = pickedDate;
                                        });
                                      }
                                    },
                                    child: const Text('Select Date of Birth'),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    DoB != null
                                        ? 'Date Birth: ${DoB.toString().split(' ')[0]}'
                                        : 'No date selected',
                                  ),
                                ],
                              ),
                    Divider(),
                       Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final ImageProvider = Provider.of<imageProvider>(context, listen: false);
                    await ImageProvider.getImage();
                    webImage = ImageProvider.image;
                  },
                  child: const Text('Select Image'),
                ),
              ],
            ), 
              SizedBox(height:30),
                       Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final provider = Provider.of<cvProvider>(context, listen: false);
                    await provider.getFile();
                    cvFile = provider.file;
                  },
                  child: const Text('Select CV'),
                ),
              ],
            ), 

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Discard'),
                        ),
                        ElevatedButton(
                          onPressed: ()async {
                            if (_formKey.currentState!.validate()) {
                              // Implement your save logic here
                               
                              final provider= Provider.of<registrationProvider>(context,listen:false);
                             await provider.registerUser(
                              FirstName: _nameController.text,
                               LastName: _lastNameController.text,
                              role: _positionController.text,
                               branch:_branchController.text,
                              password:_passwordController.text,
                                email: _emailController.text,
                                access: access,
                                permission: permission,
                                bytes:webImage,

                              );
                              final empProvider =Provider.of<EmployeeProvider>(context,listen:false);
                              // For example, save the employee information along with the access and permission lists
                              await empProvider.addEmployee(
                                Status: '', 
                                location:_locationController.text,
                                DoB: DoB,
                                 Gender: _gender,
                                  Address: _addressController.text, 
                                  Phone: _phoneController.text,
                                   Salary: int.parse(_salaryController.text),
                                    user:provider.user!, 
                                    file: cvFile,  

                              );
                              // Do something with employeeData
                              
                              
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
