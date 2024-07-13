import 'package:clean_a/medicine/model/providerM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_a/medicine/data/medicine_data.data.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
//import 'package:clean_a/medicine/provider/medicine_provider.dart';

class MedicineDetail extends StatefulWidget {
  const MedicineDetail({super.key});

  @override
  MedicineDetailState createState() => MedicineDetailState();
}

class MedicineDetailState extends State<MedicineDetail> {
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
                          'Medicine Detail',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins.regular',
                          ),
                        ),
                      ),
                      // Content
  //TABLEDATA                
                   Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Consumer<MedicineProvider>(
                              builder: (context, medicineProvider, child) {
                                return _buildMedicineDetailTable(
                                  medicineProvider.medicines,
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

  Widget _buildMedicineDetailTable(List<DataMD> data, int totalPages) {
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
                  addMedicine(context);
                },
                child: const Text(
                  'Add Medicine',
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(width: 20.0),
           
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    backgroundColor: Colors.red),
                onPressed: () {
                  deleteMedicine(context);
                },
                child: const Text(
                  'Delete Medicine',
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

  void addMedicine(BuildContext context) {
    final _medicineNameController = TextEditingController();
    final _medicineIdController = TextEditingController();
    final _genericNameController = TextEditingController();
    final _categoryController = TextEditingController();
    final _weightController = TextEditingController();
    final _expiryDateController = TextEditingController();
    bool _isTaxable = false;
    bool _isPrescribed = false;

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
                      'Add Medicine',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _medicineNameController,
                              label: 'Medicine Name',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _medicineIdController,
                              label: 'ID',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _genericNameController,
                              label: 'Generic Name',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _categoryController,
                              label: 'Category',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _weightController,
                              label: 'Weight',
                            ),
                            const SizedBox(height: 10),
                            _buildTextField(
                              controller: _expiryDateController,
                              label: 'Expiry Date',
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text('Taxable'),
                                Checkbox(
                                  value: _isTaxable,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isTaxable = value ?? false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Prescribed'),
                                Checkbox(
                                  value: _isPrescribed,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isPrescribed = value ?? false;
                                    });
                                  },
                                ),
                              ],
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
                            final newMedicine = DataMD(
                              id: _medicineIdController.text,
                              medicineName:
                                  _medicineNameController.text,
                              genericName:
                                  _genericNameController.text,
                              category: _categoryController.text,
                              weight: _weightController.text,
                              expiryDate: _expiryDateController.text,
                              isTaxable: _isTaxable,
                              isPrescribed: _isPrescribed,
                            );
                            Provider.of<MedicineProvider>(context,
                                    listen: false)
                                .addMedicine(newMedicine);
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
        
        children:  [
         
          _buildHeaderCell('Medicine_ID'),
          _buildHeaderCell('Medicine_Name'),
          _buildHeaderCell('Generic Name'),
          _buildHeaderCell('Category'),
          _buildHeaderCell('Weight'),
          _buildHeaderCell('Expiry Date'),
          _buildHeaderCell('Taxable'),
          _buildHeaderCell('Prescribed'),
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
        style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
      ),
    );
  }

  Widget _buildDataRow(DataMD medicine) {
    return Row(
      children: [
        _buildDataCell(medicine.id),
        _buildDataCell(medicine.medicineName),
        _buildDataCell(medicine.genericName),
        _buildDataCell(medicine.category),
        _buildDataCell(medicine.weight),
        _buildDataCell(medicine.expiryDate),
        _buildDataCell(medicine.isTaxable ? 'Yes' : 'No'),
        _buildDataCell(medicine.isPrescribed ? 'Yes' : 'No'),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: 150.0,
          child: Row(
            children: [
              IconButton(
  icon: const Icon(Icons.edit),
  onPressed: () {
    updateMedicine(context, medicine);
  },
),

              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteDialog(context, medicine);
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

  void deleteDialog(BuildContext context, DataMD medicine) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Medicine'),
          content:
              const Text('Are you sure you want to delete this medicine?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<MedicineProvider>(context, listen: false)
                    .deleteMedicine(medicine );
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
void updateMedicine(BuildContext context, DataMD medicine) {
  final _medicineNameController = TextEditingController(text: medicine.medicineName);
  final _genericNameController = TextEditingController(text: medicine.genericName);
  final _categoryController = TextEditingController(text: medicine.category);
  final _weightController = TextEditingController(text: medicine.weight);
  final _expiryDateController = TextEditingController(text: medicine.expiryDate);
  bool _isTaxable = medicine.isTaxable;
  bool _isPrescribed = medicine.isPrescribed;

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
                    'Update Medicine',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildTextField(
                            controller: _medicineNameController,
                            label: 'Medicine Name',
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            controller: _genericNameController,
                            label: 'Generic Name',
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            controller: _categoryController,
                            label: 'Category',
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            controller: _weightController,
                            label: 'Weight',
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            controller: _expiryDateController,
                            label: 'Expiry Date',
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text('Taxable'),
                              Checkbox(
                                value: _isTaxable,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isTaxable = value ?? false;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Prescribed'),
                              Checkbox(
                                value: _isPrescribed,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isPrescribed = value ?? false;
                                  });
                                },
                              ),
                            ],
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
                          final updatedMedicine = DataMD(
                            id: medicine.id,
                            medicineName: _medicineNameController.text,
                            genericName: _genericNameController.text,
                            category: _categoryController.text,
                            weight: _weightController.text,
                            expiryDate: _expiryDateController.text,
                            isTaxable: _isTaxable,
                            isPrescribed: _isPrescribed,
                          );
                          Provider.of<MedicineProvider>(context, listen: false)
                              .updateMedicine(updatedMedicine);
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






  void deleteMedicine(BuildContext context) {
    final _medicineIdController = TextEditingController();

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
                  'Delete Medicine',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _medicineIdController,
                  label: 'Medicine ID',
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
                        final id = _medicineIdController.text;
                        final provider = Provider.of<MedicineProvider>(context,
                            listen: false);
                        final medicineToDelete = provider.medicines
                            .firstWhere(
                                (medicine) => medicine.id == id,
                                orElse: () => DataMD(
                                    id: '',
                                    medicineName: '',
                                    genericName: '',
                                    category: '',
                                    weight: '',
                                    expiryDate: '',
                                    isTaxable: false,
                                    isPrescribed: false));
                        if (medicineToDelete.id.isNotEmpty) {
                          provider.deleteMedicine(medicineToDelete );
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
}
