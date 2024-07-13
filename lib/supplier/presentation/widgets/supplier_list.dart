import 'package:clean_a/shared/constants/dataS.dart';
import 'package:clean_a/supplier/domain/models/splyrprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:clean_a/supplier/model/providerS.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';

class SupplierList extends StatefulWidget {
  const SupplierList({Key? key}) : super(key: key);

  @override
  _SupplierListState createState() => _SupplierListState();
}

class _SupplierListState extends State<SupplierList> {
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
            // Main content area
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar (only for desktop)
                if (ResponsiveD.isDesktop(context))
                  Expanded(
                    child: SideMenu(
                      onClose: toggleSideMenu,
                    ),
                  ),
                // Main content
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      HeaderPage(
                        onMenuPressed: toggleSideMenu,
                        isSideMenuOpen: isSideMenuOpen,
                      ),
                      // Static Title
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          top: 20,
                        ),
                        child: Text(
                          'Supplier List',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins.regular',
                          ),
                        ),
                      ),
                      // Content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Consumer<SupplierProvider>(
                              builder: (context, supplierProvider, child) {
                                return _buildSupplierListTable(
                                  supplierProvider.suppliers,
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
            // Sidebar (for mobile and tablet)
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

  Widget _buildSupplierListTable(List<DataS> data, int totalPages) {
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
                addSupplier(context);
              },
              child: const Text(
                'Add Supplier',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.red),
              onPressed: () {
                deleteSupplier(context);
              },
              child: const Text(
                'Delete Supplier',
                style: TextStyle(color: Colors.white),
              ),
            ),
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

  Widget _buildHeaderRow() {
    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          _buildHeaderCell('Supplier ID'),
          _buildHeaderCell('Name'),
          _buildHeaderCell('Phone'),
          _buildHeaderCell('Status'),
          _buildHeaderCell('Address'),
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

  Widget _buildDataRow(DataS supplier) {
    return Row(
      children: [
        _buildDataCell(supplier.supplierId),
        _buildDataCell(supplier.name),
        _buildDataCell(supplier.phone),
        _buildDataCell(supplier.status),
        _buildDataCell(supplier.address),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: 150.0,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit,size: 17,),
                onPressed: () {
                  updateSupplier(context, supplier);
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete,size: 17,color: Colors.red,),
                onPressed: () {
                  deleteSupplierDialog(context, supplier);
                },
              ),
              IconButton(
                icon: const Icon(Icons.message,size: 17,),
                onPressed: () {
                sendMessageDialog(context, supplier);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
  void sendMessageDialog(BuildContext context, DataS supplier) {
  final _messageController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Send Message',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _messageController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
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
                      final message = _messageController.text;
                      // Replace with Firebase integration code to send message
                      // to the backend.
                      print('Sending message to Firebase: $message');
                      // Example: Firebase code to send message
                      // firebaseMessaging.sendMessage(message);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Send'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}


  Widget _buildDataCell(String text) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 150.0,
      child: Text(text),
    );
  }

  


void deleteSupplier(BuildContext context) {
  final _supplierIdController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.33,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delete Supplier',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _supplierIdController,
                label: 'Supplier ID',
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
                      final id = _supplierIdController.text;
                      final provider = Provider.of<SupplierProvider>(context,
                          listen: false);
                      final supplierToDelete = provider.suppliers
                          .firstWhere(
                              (supplier) => supplier.supplierId == id,
                              orElse: () => DataS(
                                  supplierId: '',
                                  name: '',
                                  phone: '',
                                  status: '',
                                  address: ''));
                      if (supplierToDelete.supplierId.isNotEmpty) {
                        provider.deleteSupplier(supplierToDelete);
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

  void addSupplier(BuildContext context) {
    final _supplierIdController = TextEditingController();
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();
    final _statusController = TextEditingController();
    final _addressController = TextEditingController();

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
                      'Add Supplier',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _supplierIdController,
                              label: 'Supplier ID',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _nameController,
                              label: 'Name',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _phoneController,
                              label: 'Phone',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _statusController,
                              label: 'Status',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _addressController,
                              label: 'Address',
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
                            final newSupplier = DataS(
                              supplierId: _supplierIdController.text,
                              name: _nameController.text,
                              phone: _phoneController.text,
                              status: _statusController.text,
                              address: _addressController.text,
                            );
                            Provider.of<SupplierProvider>(context,
                                    listen: false)
                                .addSupplier(newSupplier);
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

  void updateSupplier(BuildContext context, DataS supplier) {
    final _supplierIdController = TextEditingController(text: supplier.supplierId);
    final _nameController = TextEditingController(text: supplier.name);
    final _phoneController = TextEditingController(text: supplier.phone);
    final _statusController = TextEditingController(text: supplier.status);
    final _addressController = TextEditingController(text: supplier.address);

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
                      'Edit Supplier',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _supplierIdController,
                              label: 'Supplier ID',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _nameController,
                              label: 'Name',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _phoneController,
                              label: 'Phone',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _statusController,
                              label: 'Status',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _addressController,
                              label: 'Address',
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
                            final updatedSupplier = DataS(
                              supplierId: _supplierIdController.text,
                              name: _nameController.text,
                              phone: _phoneController.text,
                              status: _statusController.text,
                              address: _addressController.text,
                            );
                            Provider.of<SupplierProvider>(context,
                                    listen: false)
                                .updateSupplier(updatedSupplier);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Update'),
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

  void deleteSupplierDialog(BuildContext context, DataS supplier) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Supplier'),
          content: const Text('Are you sure you want to delete this supplier?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<SupplierProvider>(context, listen: false)
                    .deleteSupplier(supplier);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
