import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/sales/presentation/widgets/sales_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';

class PharmacySalesScreen extends StatefulWidget {
  @override
  _PharmacySalesScreenState createState() => _PharmacySalesScreenState();
}

class _PharmacySalesScreenState extends State<PharmacySalesScreen> {
  bool _showSideMenu = false;

  @override
  Widget build(BuildContext context) {
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
                          _showSideMenu = false;
                        });
                      },
                    ),
                  ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HeaderPage(
                        onMenuPressed: () {
                          setState(() {
                            _showSideMenu = !_showSideMenu;
                          });
                        },
                        isSideMenuOpen: _showSideMenu,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Add your existing widgets here
                              _buildDateTimeSection(),
                              _buildSearchBar(),
                              _buildCategoryTabs(),
                              _buildProductDisplay(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (!ResponsiveD.isDesktop(context) && _showSideMenu)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: SideMenu(
                  onClose: () {
                    setState(() {
                      _showSideMenu = false;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCartSummary(context);
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

  // Replace with your existing widgets or methods
  Widget _buildDateTimeSection() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: const Text(
        'Date and Time', // Replace with actual date and time string
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryTab('Medicine', true), // Active tab example
          _buildCategoryTab('Personal Care', false), // Inactive tab example
          _buildCategoryTab('Supplements', false), // Inactive tab example
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String category, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(category),
        backgroundColor: isActive ? Colors.blue : Colors.blue.withOpacity(0.3),
      ),
    );
  }

  Widget _buildProductDisplay() {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Product Name')),
        DataColumn(label: Text('Description')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Action')),
      ],
      rows: List.generate(
        10, // Replace with actual product count
        (index) => DataRow(
          cells: [
            DataCell(Text('Product ${index + 1}')),
            DataCell(Text('Description of Product ${index + 1}')),
            const DataCell(Text('\$10.00')), // Replace with actual price
            DataCell(IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Implement add to cart functionality
              },
            )),
          ],
        ),
      ),
    );
  }

  void _showCartSummary(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 3, // Replace with actual cart items count
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Product ${index + 1}'),
                      subtitle: const Text('Quantity: 2'),
                      trailing: const Text('\$20.00'),
                    );
                  },
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text('Total:'),
                trailing: Text('\$60.00'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showConfirmationDialog(context);
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Purchase'),
          content: const Text('Total: \$60.00'), // Replace with dynamic total
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _showSuccessScreen(context);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessScreen(BuildContext context) {
    Navigator.of(context).pop(); // Close confirmation dialog
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SuccessScreen(),
    ));
  }
}
