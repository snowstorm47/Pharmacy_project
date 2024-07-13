import 'package:clean_a/branch_M/data/models/branch_list_data.dart';
import 'package:clean_a/branch_M/domain/models/branchprovider.dart';
//import 'package:clean_a/branches/model/providerB.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:clean_a/branches/data/branch_data.data.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';

class BranchListPage extends StatefulWidget {
  const BranchListPage({super.key});

  @override
  BranchListDetailState createState() => BranchListDetailState();
}

class BranchListDetailState extends State<BranchListPage> {
  bool isSideMenuOpen = false;

  void toggleSideMenu() {
    setState(() {
      isSideMenuOpen = !isSideMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = 3;

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
                      onClose: toggleSideMenu,
                    ),
                  ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderPage(
                        onMenuPressed: toggleSideMenu,
                        isSideMenuOpen: isSideMenuOpen,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          top: 20,
                        ),
                        child: Text(
                          'Branch List Detail',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins.regular',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Consumer<BranchProvider>(
                              builder: (context, branchProvider, child) {
                                return _buildBranchDetailTable(
                                  branchProvider.branches,
                                  totalPages,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (!ResponsiveD.isDesktop(context) && isSideMenuOpen)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: SideMenu(
                  onClose: toggleSideMenu,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBranchDetailTable(List<BranchLD> data, int totalPages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              child: const Text(
                'Filter By',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(236, 27, 228, 4)),
              onPressed: () {},
              child: const Text(
                'Sort By',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              _buildHeaderRow(),
              const SizedBox(height: 10.0),
              ...data.map((item) => _buildDataRow(item)).toList(),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    backgroundColor: const Color.fromARGB(236, 27, 228, 4)),
                onPressed: () {
                  addBranch(context);
                },
                child: const Text(
                  'Add Branch',
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(width: 20.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    backgroundColor: Colors.red),
                onPressed: () {
                  deleteBranch(context);
                },
                child: const Text(
                  'Delete Branch',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
              onPressed: () {}, // No functionality needed
              child: const Text(
                'Prev',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(width: 1.0),
            for (int i = 1; i <= totalPages; i++)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                onPressed: null, // No functionality needed
                child: Text('$i'),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
              onPressed: () {}, // No functionality needed
              child: const Text(
                'Next',
              ),
            ),
          ],
        ),
      ],
    );
  }

  void addBranch(BuildContext context) {
    final _branchIdController = TextEditingController();
    final _branchNameController = TextEditingController();
    final _branchManagerController = TextEditingController();
    final _addressController = TextEditingController();
    final _emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(20),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Branch',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _branchIdController,
                              label: 'Branch ID',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _branchNameController,
                              label: 'Branch Name',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _branchManagerController,
                              label: 'Branch Manager',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _addressController,
                              label: 'Address',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _emailController,
                              label: 'Email',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final newBranch = BranchLD(
                              branchId: _branchIdController.text,
                              name: _branchNameController.text,
                              branchManager: _branchManagerController.text,
                              address: _addressController.text,
                              email: _emailController.text,
                            );
                            Provider.of<BranchProvider>(context,
                                    listen: false)
                                .addBranch(newBranch);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller, required String label}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          _buildHeaderCell('Branch ID'),
          _buildHeaderCell('Branch Name'),
          _buildHeaderCell('Branch Manager'),
          _buildHeaderCell('Address'),
          _buildHeaderCell('Email'),
          _buildHeaderCell('Actions'),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 150.0,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildDataRow(BranchLD item) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          _buildDataCell(item.branchId),
          _buildDataCell(item.name),
          _buildDataCell(item.branchManager),
          _buildDataCell(item.address),
          _buildDataCell(item.email),
          _buildActionButtons(item),
        ],
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 150.0,
      child: Text(text),
    );
  }

  Widget _buildActionButtons(BranchLD item) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 150.0,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              editBranch(context, item);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              Provider.of<BranchProvider>(context, listen: false)
                  .deleteBranch(item.branchId);
            },
          ),
        ],
      ),
    );
  }

  void editBranch(BuildContext context, BranchLD branch) {
    final _branchIdController = TextEditingController(text: branch.branchId);
    final _branchNameController = TextEditingController(text: branch.name);
    final _branchManagerController =
        TextEditingController(text: branch.branchManager);
    final _addressController = TextEditingController(text: branch.address);
    final _emailController = TextEditingController(text: branch.email);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(20),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Edit Branch',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _branchIdController,
                              label: 'Branch ID',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _branchNameController,
                              label: 'Branch Name',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _branchManagerController,
                              label: 'Branch Manager',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _addressController,
                              label: 'Address',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _emailController,
                              label: 'Email',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final editedBranch = BranchLD(
                              branchId: _branchIdController.text,
                              name: _branchNameController.text,
                              branchManager: _branchManagerController.text,
                              address: _addressController.text,
                              email: _emailController.text,
                            );
                            Provider.of<BranchProvider>(context,
                                    listen: false)
                                .updateBranch(branch.branchId, editedBranch);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  void deleteBranch(BuildContext context) {
    final _branchIdController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.all(20),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Delete Branch',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: _branchIdController,
                      label: 'Branch ID',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<BranchProvider>(context,
                                    listen: false)
                                .deleteBranch(_branchIdController.text);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
