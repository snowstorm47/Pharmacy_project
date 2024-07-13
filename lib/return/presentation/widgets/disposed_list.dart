import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/return/data/disposed_data.dart';
import 'package:clean_a/return/domain/models/retprovider.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:your_app/models/disposed_list_data.dart'; // Adjust import path as per your project structure
//import 'package:your_app/providers/disposed_list_provider.dart'; // Adjust import path as per your project structure
//import 'package:your_app/widgets/responsive_drawer.dart'; // Adjust import path as per your project structure
//import 'package:your_app/widgets/header_page.dart'; // Adjust import path as per your project structure
//import 'package:your_app/widgets/side_menu_page.dart'; // Adjust import path as per your project structure

class DisposedListDetail extends StatefulWidget {
  const DisposedListDetail({Key? key}) : super(key: key);

  @override
  _DisposedListDetailState createState() => _DisposedListDetailState();
}

class _DisposedListDetailState extends State<DisposedListDetail> {
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
                          'Disposed Items Detail',
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
                            child: Consumer<DisposedListProvider>(
                              builder: (context, provider, child) {
                                return _buildDisposedItemList(
                                  provider.disposedItems,
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

  Widget _buildDisposedItemList(List<DisposedListData> data, int totalPages) {
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
                addDisposedItem(context);
              },
              child: const Text(
                'Add Disposed Item',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 20.0),

           /* ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.red),
              onPressed: () {
                deleteDisposedItem(context);
              },
              child: const Text(
                'Delete Disposed Item',
                style: TextStyle(color: Colors.white),
              ),
            ),*/
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
          _buildHeaderCell('Batch'),
          _buildHeaderCell('Product Name'),
          _buildHeaderCell('Category'),
          _buildHeaderCell('Price'),
          _buildHeaderCell('Date'),
          _buildHeaderCell('Expiry Date'),
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

  Widget _buildDataRow(DisposedListData item) {
    return Row(
      children: [
        _buildDataCell(item.batch),
        _buildDataCell(item.productName),
        _buildDataCell(item.category),
        _buildDataCell(item.price),
        _buildDataCell(item.date),
        _buildDataCell(item.expiryDate),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: 150.0,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  updateDisposedItem(context, item);
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteDisposedItem(context, item);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDataCell(String text) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 150.0,
      child: Text(text),
    );
  }

  void addDisposedItem(BuildContext context) {
    final _batchController = TextEditingController();
    final _productNameController = TextEditingController();
    final _categoryController = TextEditingController();
    final _priceController = TextEditingController();
    final _dateController = TextEditingController();
    final _expiryDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Disposed Item',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _batchController,
                  label: 'Batch',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _productNameController,
                  label: 'Product Name',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _categoryController,
                  label: 'Category',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _priceController,
                  label: 'Price',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _dateController,
                  label: 'Date',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _expiryDateController,
                  label: 'Expiry Date',
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
                        final newItem = DisposedListData(
                          batch: _batchController.text,
                          productName: _productNameController.text,
                          category: _categoryController.text,
                          price: _priceController.text,
                          date: _dateController.text,
                          expiryDate: _expiryDateController.text,
                        );
                        Provider.of<DisposedListProvider>(context, listen: false)
                            .addDisposedItem(newItem);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save'),
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

  void updateDisposedItem(BuildContext context, DisposedListData item) {
    final _batchController = TextEditingController(text: item.batch);
    final _productNameController = TextEditingController(text: item.productName);
    final _categoryController = TextEditingController(text: item.category);
    final _priceController = TextEditingController(text: item.price);
    final _dateController = TextEditingController(text: item.date);
    final _expiryDateController = TextEditingController(text: item.expiryDate);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.6,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Update Disposed Item',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _batchController,
                  label: 'Batch',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _productNameController,
                  label: 'Product Name',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _categoryController,
                  label: 'Category',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _priceController,
                  label: 'Price',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _dateController,
                  label: 'Date',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _expiryDateController,
                  label: 'Expiry Date',
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
                        final updatedItem = DisposedListData(
                          batch: _batchController.text,
                          productName: _productNameController.text,
                          category: _categoryController.text,
                          price: _priceController.text,
                          date: _dateController.text,
                          expiryDate: _expiryDateController.text,
                        );
                        Provider.of<DisposedListProvider>(context, listen: false)
                            .updateDisposedItem(updatedItem);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Update'),
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

  void deleteDisposedItem(BuildContext context, DisposedListData item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<DisposedListProvider>(context, listen: false)
                    .deleteDisposedItem(item);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
