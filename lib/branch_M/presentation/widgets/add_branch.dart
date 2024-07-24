import 'package:clean_a/branch_M/Provider/branchProvides.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:provider/provider.dart';


class AddBranch extends StatefulWidget {
  const AddBranch({super.key});

  @override
  State<AddBranch> createState() => _AddBranchState();
}

class _AddBranchState extends State<AddBranch> {
  bool showSideMenu = false;

  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController branchManagerController = TextEditingController();
  final TextEditingController storeCapacityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController openHoursController = TextEditingController();
  final TextEditingController totalEmployeesController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    branchNameController.dispose();
    branchManagerController.dispose();
    storeCapacityController.dispose();
    addressController.dispose();
    openHoursController.dispose();
    totalEmployeesController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

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
                          showSideMenu = false;
                        });
                      },
                    ),
                  ),
                Expanded(
                  flex: 4,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HeaderPage(
                          onMenuPressed: () {
                            setState(() {
                              showSideMenu = !showSideMenu;
                            });
                          },
                          isSideMenuOpen: showSideMenu,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SingleChildScrollView(
                              child: isMobile
                                  ? buildMobileLayout()
                                  : buildDesktopLayout(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (!ResponsiveD.isDesktop(context) && showSideMenu)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: SideMenu(
                  onClose: () {
                    setState(() {
                      showSideMenu = false;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add Branch',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'Add branch Details',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(236, 27, 228, 4),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Save data
                  final branchProvider = Provider.of<BranchProvider>(context,listen: false);
                  await branchProvider.addBranch(BranchEmail: emailController.text, Address: addressController.text, phoneNo:phoneNumberController.text, totalEmployees: int.parse(totalEmployeesController.text), storeCapacity: int.parse(storeCapacityController.text), BranchManager:branchManagerController.text , Description: descriptionController.text, openHours: openHoursController.text, BranchName: branchNameController.text);
                }

              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 212, 94, 86),
              ),
              onPressed: () {},
              child: const Text(
                'Discard',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        buildTextFieldsColumn(),
        const SizedBox(height: 20),
        buildDescriptionAndButton(),
        const SizedBox(height: 30),
        SizedBox(
          width: 170,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(235, 198, 232, 194),
            ),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'import file',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.import_export),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add Branch',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        const SizedBox(height: 17),
        const Text(
          'Add Branch Details',
          style: TextStyle(fontFamily: 'Poppins.regular', fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(235, 198, 232, 194),
              ),
              onPressed: () {},
              child: const Row(
                children:  [
                  Text(
                    'import file',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.import_export),
                ],
              ),
            ),
            const SizedBox(width: 400),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(236, 27, 228, 4),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Save data
                  final branchProvider = Provider.of<BranchProvider>(context,listen: false);
                  await branchProvider.addBranch(BranchEmail: emailController.text, Address: addressController.text, phoneNo:phoneNumberController.text, totalEmployees: int.parse(totalEmployeesController.text), storeCapacity: int.parse(storeCapacityController.text), BranchManager:branchManagerController.text , Description: descriptionController.text, openHours: openHoursController.text, BranchName: branchNameController.text);
                }
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 212, 94, 86),
              ),
              onPressed: () {},
              child: const Text(
                'Discard',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 17),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Column
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: branchNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Branch Name',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: branchManagerController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Branch Manager',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: storeCapacityController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Store Capacity',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20), // Space between columns

            // Second Column
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Branch Address',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: openHoursController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Open hours',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: totalEmployeesController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Total employees',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the total employees';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20

), // Space between columns

            // Third Column
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: phoneNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        buildDescriptionAndButton(),
      ],
    );
  }

  Widget buildDescriptionAndButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        const SizedBox(height: 7),
        TextField(
          controller: descriptionController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          maxLines: 6,
        ),
      ],
    );
  }

  Widget buildTextFieldsColumn() {
    return Column(
      children: [
        TextField(
          controller: branchNameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Branch Name',
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: branchManagerController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Branch Manager',
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: storeCapacityController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Store Capacity',
          ),
         keyboardType: TextInputType.number,
        validator: (value) {
           if (value == null || value.isEmpty) {
              return 'Please enter the Storage Capacity';
                        }
             if (int.tryParse(value) == null) {
          return 'Please enter a valid number';
                  }
             return null;
                },
        ),
        const SizedBox(height: 20),
        TextField(
          controller: addressController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Branch Address',
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: openHoursController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Open hours',
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: totalEmployeesController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Total employees',
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the total employees';
            }
            if (int.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: phoneNumberController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone number',
          ),
        ),
      ],
    );
  }
}
