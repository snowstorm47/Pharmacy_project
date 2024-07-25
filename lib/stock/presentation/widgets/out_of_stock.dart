import 'package:clean_a/branch_M/Provider/branchProvides.dart';
import 'package:clean_a/medicine/domain/entities/batch.dart';
import 'package:clean_a/medicine/domain/entities/medicine.dart';
import 'package:clean_a/medicine/providers/medicine_provider.dart';
import 'package:clean_a/stock/presentation/widgets/popup/delete_medicine_popup.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:provider/provider.dart';

class OutOfStockItemsPage extends StatefulWidget {
  const OutOfStockItemsPage({super.key});

  @override
  OutOfStockItemsPageState createState() => OutOfStockItemsPageState();
}

class OutOfStockItemsPageState extends State<OutOfStockItemsPage> {
  bool showSideMenu = false;
  List<bool> checkboxValues = List<bool>.generate(10, (index) => false);
   bool isLoading = true;
   List<Batch> med =[];
   @override
  void initState() {
    super.initState();
    // Fetch data from provider
    Future.microtask(() async {
      final brprovider = Provider.of<BranchProvider>(context, listen: false);
      final provider = Provider.of<MedicineProvider>(context, listen: false);
      await provider.getOutofStock();
      await provider.getColor();
      await brprovider.getBranches();
      setState(() {
        isLoading = false;
          setState(() {
        isLoading = false;
         med = provider.outofStock ?? []; // Initialize `med`
      // Initialize `batch`
      });
      });
    });
  }
  

 void _showDeletePopup() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DeleteMedicinePopup(
        onDeleteConfirmed: () async {
          final provider = Provider.of<MedicineProvider>(context, listen: false);
          
          // Collect selected items
          List<String> selectedMedicineNames = [];
          List<String> selectedBranchNames = []; // Use String if branchName is a String

          for (int i = 0; i < checkboxValues.length; i++) {
            if (checkboxValues[i]) {
              selectedMedicineNames.add(med[i].medName);
              selectedBranchNames.add(med[i].branchName);
            }
          }

          // Ensure both lists have the same length
          if (selectedMedicineNames.length != selectedBranchNames.length) {
            // Handle mismatched lists
            Navigator.of(context).pop();
            return;
          }

          try {
            // Delete medicines based on the collected names and branches
            for (int i = 0; i < selectedMedicineNames.length; i++) {
              await provider.deleteMedicine(medicineName: selectedMedicineNames[i], branchName: selectedBranchNames[i]
                
              );
            }

            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Medicines successfully deleted.'),
                backgroundColor: Colors.green,
              ),
            );
          } catch (e) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to delete medicines: ${e.toString()}'),
                backgroundColor: Colors.red,
              ),
            );
          }

          // Refresh the table or data
          setState(() {
            // Your refresh logic here
          });

        },
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<MedicineProvider>(context,listen: false);
    final med = provider.outofStock ?? [];
    final data = provider.medicines ?? [];
    String? getCatagory(List<Medicine>? data, Batch? batch) {
      if (data != null && batch != null) {
        for (final item in data) {
          if (batch.medName == item.medicineName) {
            return item.catagory;
          }
        }
      }
      return null;
    }
        String? getWeight(List<Medicine>? data, Batch? batch) {
      if (data != null && batch != null) {
        for (final item in data) {
          if (batch.medName == item.medicineName) {
            return item.weight;
          }
        }
      }
      return null;
    }
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
                      onClose: () {
                        setState(() {
                          showSideMenu = false;
                        });
                      },
                    ),
                  ),
                // Main content
                Expanded(
                  flex: 4, // Adjust flex ratio as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      HeaderPage(
                        onMenuPressed: () {
                          setState(() {
                            showSideMenu = !showSideMenu;
                          });
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      // Content
                      Expanded(
                        child: isLoading
                          ? Center(child: CircularProgressIndicator())
                          : 
                        ListView(
                          padding: const EdgeInsets.all(16.0),
                          children: [
                            const Text(
                              'Out of Stock Items',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'List of Out of Stock Items',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                // Search placeholder
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search...',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 16.0),
                                      ),
                                    ),
                                  ),
                                ),
                                // Filter by button
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // Add filter functionality here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Adjust the radius as needed
                                      ),
                                    ),
                                    icon: const Icon(Icons.filter_list,
                                        color: Colors.white),
                                    label: const Text('Filter By',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Branch button
                              ],
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: 20.0,
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.blue),
                                dividerThickness: 0, // Remove the dividers
                                columns: const <DataColumn>[
                                  DataColumn(label: SizedBox(width: 20)),
                                  DataColumn(
                                    label: Text('Index',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Medicine Name',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Category',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Weight',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Expiry Date',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Purchased Price',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Selling Price',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Quantity',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Branch',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Actions',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  med.length, // Change this to the number of rows you have
                                  (index) => DataRow(
                                    color: MaterialStateColor.resolveWith(
                                        (states) {
                                      // Alternating colors
                                      return index % 2 == 0
                                          ? Colors.grey[200]!
                                          : Colors.white;
                                    }),
                                    cells: <DataCell>[
                                      DataCell(
                                        Checkbox(
                                          value: checkboxValues[index],
                                          onChanged: (value) {
                                            setState(() {
                                              checkboxValues[index] = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      DataCell(Text('$index')),
                                      DataCell(Text(med[index].medName)),
                                      DataCell(Text(getCatagory(data,med[index]).toString())),
                                      DataCell(Text(getWeight(data, med[index]).toString())),
                                      DataCell(Text(med[index].location)),
                                      DataCell(Text(med[index].suppliersPrice.toString())),
                                      DataCell(Text(med[index].sellingPrice.toString())),
                                      DataCell(Text(med[index].stock.toString())),
                                      DataCell(Text(med[index].branchName)),
                                      DataCell(
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                // Handle edit action
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete),
                                              onPressed: () {
                                                // Handle delete action
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle add medicine to stock
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Adjust the radius as needed
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                      child: const Text(
                                        'Add Medicine to Stock',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle delete from stock
                                         _showDeletePopup;
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Adjust the radius as needed
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                      child: const Text(
                                        'Delete from Stock',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle navigate to medicine detail page
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Adjust the radius as needed
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                  child: const Text('To Medicine Detail Page',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Sidebar (for mobile and tablet)
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
}
