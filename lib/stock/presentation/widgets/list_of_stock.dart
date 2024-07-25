import 'package:clean_a/branch_M/Provider/branchProvides.dart';
import 'package:clean_a/branch_M/domain/entities/branch.dart';
import 'package:clean_a/medicine/domain/entities/batch.dart';
import 'package:clean_a/medicine/domain/entities/medicine.dart';
import 'package:clean_a/medicine/providers/medicine_provider.dart';
import 'package:clean_a/navigationprov.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:clean_a/stock/presentation/widgets/popup/add_medicine_popup.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:provider/provider.dart';

import 'popup/delete_medicine_popup.dart';
// Import the new add medicine page

class ListOfStockPage extends StatefulWidget {
  const ListOfStockPage({super.key});

  @override
  ListOfStockPageState createState() => ListOfStockPageState();
}

class ListOfStockPageState extends State<ListOfStockPage> {
  bool showSideMenu = false;
  bool isLoading = true;
    List<Medicine> med = [];
  List<Batch> batch = [];
   @override
  void initState() {
    super.initState();
    // Fetch data from provider
    Future.microtask(() async {
      final brprovider = Provider.of<BranchProvider>(context, listen: false);
      final provider = Provider.of<MedicineProvider>(context, listen: false);
      await provider.getMedicines();
      await provider.getColor();
      await brprovider.getBranches();
      setState(() {
        isLoading = false;
         med = provider.medicines ?? []; // Initialize `med`
        batch = provider.batches ?? []; // Initialize `batch`
      });
    });
  }

  List<bool> checkboxValues = List<bool>.generate(10, (index) => false);
     
Batch? getBatch(Medicine? data, List<Batch>? batch) {
      if (data != null && batch != null) {
        for (final item in batch) {
          if (item.medName == data.medicineName) {
            return item;
      }
    }}
    }

  Text _getStatusTextStyle(Color? status) {
    switch (status) {
      case Colors.green:
        return Text("Safe", style: const TextStyle(color: Colors.green));
      case Colors.yellow:
        return Text("Pending", style: const TextStyle(color: Colors.yellow));
      case Colors.red:
        return Text("Expired", style: const TextStyle(color: Colors.red));
      default:
        return Text("No information", style: const TextStyle(color: Colors.grey));
    }
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
              selectedMedicineNames.add(med[i].medicineName);
              final bat = getBatch(med[i],batch); // Find the Batch for each selected medicine
              if (bat != null) {
                selectedBranchNames.add(bat.branchName); // Assuming Batch has a branchName property
              } else {
                // Handle case where Batch is null if necessary
                selectedBranchNames.add('Unknown'); // Or some default value
              }
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
              await provider.deleteMedicine(
                medicineName: selectedMedicineNames[i],
                branchName: selectedBranchNames[i],
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

  void _navigateToAddMedicinePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddMedicinePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
   
    final provider = Provider.of<MedicineProvider>(context, listen: false);
    final branchProvider = Provider.of<BranchProvider>(context, listen: false);
    final branches = branchProvider.branches ?? [];
    final med = provider.medicines ?? [];
    final batch = provider.batches ?? [];
    final medColors = provider.medColor ?? [];
    
    List<String>? getMedbyBranch(List<Branch>? branches) {
      if (branches == null) {
        return null;
      }

      List<String> branchNames = [];
      for (final branch in branches) {
        branchNames.add(branch.BranchName);
      }
      return branchNames;
    }

    DateTime? getExpiry(Medicine? data, List<Batch>? batch) {
      if (data != null && batch != null) {
        for (final item in batch) {
          if (item.medName == data.medicineName) {
            return item.expiryDate;
          }
        }
      }
      return null;
    }

    String? getLocation(Medicine? data, List<Batch>? batch) {
      if (data != null && batch != null) {
        for (final item in batch) {
          if (item.medName == data.medicineName) {
            return item.location;
          }
        }
      }
      return null;
    }
    Batch? getBatch(Medicine? data, List<Batch>? batch) {
      if (data != null && batch != null) {
        for (final item in batch) {
          if (item.medName == data.medicineName) {
            return item;
      }
    }}
    }

    Color? getColor(Medicine data, List<MedColor> medColors) {
      for (final item in medColors) {
        if (item.medicineName == data.medicineName) {
          return item.color;
        }
      }
      return null;
    }
    
    List<String> branchNames = getMedbyBranch(branches) ?? [];
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
                              'List of Stock',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'List of Medicine in Stock',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 30),
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
                                Expanded(
                                  child: SizedBox(
                                    width: 120, // Adjust the width as needed
                                    height: 35, // Adjust the height as needed
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Adjust the roundness
                                        ),
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          items: branchNames.map((String item) {
                                            return DropdownMenuItem<String>(
                    
                                              value: item,
                                              child: Center(
                                                child: Text(
                                                  item,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(color: Colors.black),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            // Implement dropdown change logic
                                          },
                                          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                          underline: const SizedBox(),
                                          style: const TextStyle(color: Colors.white),
                                          value: branchNames.isNotEmpty ? branchNames.first : null,
                                          
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            // Replace the rows property in DataTable with a ListView.builder
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: 20.0,
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.blue),
                                dividerThickness: 0, // Remove the dividers
                                columns: const <DataColumn>[
                                  DataColumn(label: SizedBox(width: 20)),
                                  DataColumn(label: SizedBox(width: 20)),
                                  // DataColumn(
                                  //   label: Text('Index',
                                  //       style: TextStyle(color: Colors.white)),
                                  // ),
                                  DataColumn(
                                    label: Text('Medicine Name',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Generic Name',
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
                                    label: Text('Location Code',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Expiry Date',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Status',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Padding(
                                      padding: EdgeInsets.only(right: 14.0),
                                      child: Icon(Icons.more_vert,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  med.length, // Change this to the number of rows you have
                                  (index) {
                                    // Example status values
                                    // List<String> statuses = [
                                    //   'Completed',
                                    //   'Pending',
                                    //   'Cancelled',
                                    //   'Completed',
                                    //   'Pending',
                                    //   'Cancelled',
                                    //   'Completed'
                                    // ];
                                    // String status = statuses[index];
                                     final status = getColor(med[index],medColors);
                                    return DataRow(
                                      color: MaterialStateColor.resolveWith(
                                          (states) {
                                        // Alternating colors
                                        return index % 2 == 0
                                            ? Colors.white10
                                            : Colors.white70;
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
                                        DataCell(Text(med[index].medicineName)),
                                        DataCell(Text(med[index].genericName)),
                                        DataCell(Text(med[index].catagory)),
                                        DataCell(Text(med[index].weight)),
                                        DataCell(Text(getLocation(med[index], batch) ?? 'Unknown')),
                                        DataCell(Text(getExpiry(med[index], batch)?.toIso8601String() ?? 'Unknown')),
                                        DataCell(
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:status,
                                                   
                                                        
                                                radius:
                                                    4.0, // Adjust the radius as needed
                                              ),
                                              const SizedBox(width: 4),
                                              _getStatusTextStyle(status),
                                              // Text(
                                              //   status,
                                              //   style:
                                              //       _getStatusTextStyle(status),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        DataCell(
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 14.0),
                                            child: IconButton(
                                              icon: const Icon(Icons.more_vert),
                                              onPressed: () {
                                                // Handle "More" button press
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            // Row for buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: _navigateToAddMedicinePage,
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
                                      onPressed: _showDeletePopup,
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
                                    Provider.of<NavigationProvider>(context,listen:false).navigateTo('/medicine/details');
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
