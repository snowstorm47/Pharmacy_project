import 'package:clean_a/medicine/domain/entities/batch.dart';
import 'package:clean_a/medicine/providers/medicine_provider.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';


import 'package:provider/provider.dart';

import '../../domain/entities/medicine.dart';

class MedicineDetail extends StatefulWidget {
  const MedicineDetail({super.key});

  @override
  MedicineDetailState createState() => MedicineDetailState();
}

class MedicineDetailState extends State<MedicineDetail> {
  bool isSideMenuOpen = false;
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController genericNameController = TextEditingController();
  final TextEditingController suppliersPriceController = TextEditingController();
  final TextEditingController sellingPriceController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController taxableController = TextEditingController();
  final TextEditingController prescriptionBasedController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController dateAddedController = TextEditingController();
  
  bool isPrescriptionBased = false;
  bool isTaxable = false;
  bool isPrescriptionBasedUpdate = false;
  bool isTaxableUpdate = false;
  
  DateTime? expiryDate;
  DateTime? expiryDateUpdate;
  
  @override
  void initState() {
    super.initState();
    // Fetch data from provider
    Future.microtask(() async{
      final provider = Provider.of<MedicineProvider>(context, listen: false);
      await provider.getMedicines();
    });
  }
  
  void toggleSideMenu() {
    setState(() {
      isSideMenuOpen = !isSideMenuOpen;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // Access provider data
    final provider = Provider.of<MedicineProvider>(context, listen: true);
    final med = provider.medicines ?? [];  // Ensure `med` is not null
    final batch = provider.batches ?? [];  // Ensure `batch` is not null
    int totalPages = 3;  // You might need to calculate this based on actual data
    
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: _buildMedicineDetailTable(med, batch, totalPages),
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
  
 Widget _buildMedicineDetailTable(List<Medicine>? data, List<Batch>? batch, int totalPages) {
  // Use an empty list if `data` or `batch` is null
  final safeData = data ?? [];
  final safeBatch = batch ?? [];

  // if (safeData.isEmpty) {
  //   return const Center(child: Text("No data available"));
  // }

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
             safeData.isEmpty ? const Center(child:Text("No Data is available")) :
            const SizedBox(height: 10.0),      
            ...safeData.map((item) {
              print(item);
              print(safeBatch);
              return _buildDataRow(item, safeBatch);
            }).toList(),
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
                  backgroundColor: Colors.blue),
              onPressed: () {
                updatemedicine(context);
              },
              child: const Text(
                'Update Medicine',
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(width: 20.0),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.red),
              onPressed: () {
                deleteDialog(context);
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
            onPressed: () {}, // Add functionality for pagination
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
              onPressed: () {}, // Add functionality for pagination
              child: Text('$i'),
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))),
            onPressed: () {}, // Add functionality for pagination
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
   final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController catagoryController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController genericNameController = TextEditingController();
  final TextEditingController suppliersPriceController = TextEditingController();
  final TextEditingController sellingPriceController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController taxableController = TextEditingController();
  final TextEditingController prescriptionBasedController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
 
  DateTime? expiryDate; 
  bool isPrescriptionBased = false;
  bool isTaxable = false;
  bool isPrescriptionBasedUpdate = false;
  bool isTaxableUpdate = false;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder:(contex,setDialogState){
            return Dialog(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add new medicine',
                      style: TextStyle(fontSize: 23),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'You can  add new medicine here',
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            TextField(
                              controller:medicineNameController,
                              decoration: const InputDecoration(
                                labelText: 'Medicine name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             TextField(
                              controller:branchNameController,
                              decoration: const InputDecoration(
                                labelText: 'Branch name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller:locationController,
                              decoration: const InputDecoration(
                                labelText: 'Location',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            
                             TextField(
                              controller:catagoryController,
                              decoration: const InputDecoration(
                                labelText: 'Catagory',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller:weightController,
                              decoration: const InputDecoration(
                                labelText: 'Weight',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             TextField(
                              controller:genericNameController,
                              decoration: const InputDecoration(
                                labelText: 'Generic name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             TextField(
                              controller:suppliersPriceController,
                              decoration: const InputDecoration(
                                labelText: 'Supplier price',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             TextField(
                              controller:sellingPriceController,
                              decoration: const InputDecoration(
                                labelText: 'Selling price',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      if (pickedDate != null) {
                                        setDialogState(() {
                                          expiryDate = pickedDate;
                                        });
                                      }
                                    },
                                    child: const Text('Select Expiry Date'),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    expiryDate != null
                                        ? 'Expiry Date: ${expiryDate.toString().split(' ')[0]}'
                                        : 'No date selected',
                                  ),
                                ],
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                             TextField(
                              controller:stockController,
                              decoration: const InputDecoration(
                                labelText: 'Stock',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                              Row(
                            children: [
                              Checkbox(
                                value: isPrescriptionBased,
                                onChanged: (bool? value) {
                                  setDialogState(() {
                                    isPrescriptionBased = value!;
                                  });
                                  print(value);
                                },
                                
                              ),
                              const Text('Prescription based'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: isTaxable,
                                onChanged: (bool? value) {
                                  setDialogState(() {
                                    isTaxable = value!;
                                  });
                                  print(value);
                                },
                              ),
                              const Text('Taxable'),
                            ],
                          ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller:detailsController,
                              maxLines: 4,
                              decoration: const InputDecoration(
                                labelText: 'Details',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            236, 27, 228, 4)),
                                    onPressed: () async{
                                          try{
                                           final medProvider = Provider.of<MedicineProvider>(context,listen:false);  
                                           await medProvider.addMedicine(
                                            medicineName: medicineNameController.text,
                                             branchName: branchNameController.text, 
                                             location: locationController.text, 
                                             catagory: catagoryController.text, 
                                             weight: weightController.text,
                                             genericName: genericNameController.text, 
                                             suppliersPrice: double.parse(suppliersPriceController.text), 
                                             sellingPrice: double.parse(sellingPriceController.text),
                                             expiryDate: expiryDate, 
                                             stock: int.parse(stockController.text), 
                                             taxable: isTaxable, 
                                             prescriptionBased: isPrescriptionBased, 
                                             details: detailsController.text, 
                                             dateAdded: DateTime.now(),
                                                      );
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Medicine ${medicineNameController.text}  saved successfully')));
                               Navigator.pop(context);
            
                                          } catch(e){
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving medicine: $e')));
                                              Navigator.pop(context);
                                           
                                          }             
                                    },
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Reset',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );}
          );
        });
  }

  void updatemedicine(BuildContext context) {
     final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController genericNameController = TextEditingController();
  final TextEditingController suppliersPriceController = TextEditingController();
  final TextEditingController sellingPriceController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController taxableController = TextEditingController();
  final TextEditingController prescriptionBasedController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController dateAddedController = TextEditingController();
  
 
  bool isPrescriptionBasedUpdate = false;
  bool isTaxableUpdate = false;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder:(context,setDialogState){
            return  Dialog(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Update medicine',
                      style: TextStyle(fontSize: 23),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'You can update the medicines here',
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                             TextField(
                              controller:medicineNameController,
                              decoration: const InputDecoration(
                                labelText: 'Medicine name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // const TextField(
                            //   decoration: InputDecoration(
                            //     labelText: 'Medicine ID',
                            //     border: OutlineInputBorder(),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller:categoryController,
                              decoration: const InputDecoration(
                                labelText: 'Category',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                           TextField(
                              controller:weightController,
                              decoration: const InputDecoration(
                                labelText: 'Weight',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller:genericNameController,
                              decoration: const InputDecoration(
                                labelText: 'Generic name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: suppliersPriceController,
                              decoration: const InputDecoration(
                                labelText: 'Supplier price',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             TextField(
                              controller: sellingPriceController,
                              decoration: const InputDecoration(
                                labelText: 'Selling price',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //   Row(
                            //     children: [
                            //       ElevatedButton(
                            //         onPressed: () async {
                            //           DateTime? pickedDate = await showDatePicker(
                            //             context: context,
                            //             initialDate: DateTime.now(),
                            //             firstDate: DateTime(2000),
                            //             lastDate: DateTime(2101),
                            //           );
                            //           if (pickedDate != null) {
                            //             setDialogState(() {
                            //                                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Medicine ${medicineNameController.text}  saved successfully')));  expiryDateUpdate= pickedDate;
                            //             });
                            //           }
                            //         },
                            //         child: const Text('Select Expiry Date'),
                            //       ),
                            //       const SizedBox(width: 10),
                            //       Text(
                            //         expiryDate != null
                            //             ? 'Expiry Date: ${expiryDateUpdate.toString().split(' ')[0]}'
                            //             : 'No date selected',
                            //       ),
                            //     ],
                            //   ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                              TextField(
                              controller: branchNameController,
                              decoration: const InputDecoration(
                                labelText: 'Branch Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             TextField(
                              controller: stockController,
                              decoration: const InputDecoration(
                                labelText: 'Stock',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                            children: [
                              Checkbox(
                                value: isPrescriptionBasedUpdate,
                                onChanged: (bool? value) {
                                  setDialogState(() {
                                    isPrescriptionBasedUpdate = value!;
                                  });
                                  print(isPrescriptionBasedUpdate);
                                },
                              ),
                              const Text('Prescription based'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: isTaxableUpdate,
                                onChanged: (bool? value) {
                                  setDialogState(() {
                                isTaxableUpdate = value!;
                                  });
                                  print(isTaxableUpdate);
                                },
                              ),
                              const Text('Taxable'),
                            ],
                          ),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextField(
                              maxLines: 4,
                              decoration: InputDecoration(
                                labelText: 'Details',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            236, 27, 228, 4)),
                                    onPressed: () async{
                                        try{
                                          final medProvider = Provider.of<MedicineProvider>(context,listen: false);
                                            final med = Medicine(
                                              branchName:branchNameController.text,
                                               medicineName:medicineNameController.text,
                                                catagory:categoryController.text,
                                                 weight: weightController.text,
                                                  details: detailsController.text,
                                                   genericName: genericNameController.text,
                                                    prescriptionBased: isPrescriptionBasedUpdate,
                                                     sellingPrice: double.parse(sellingPriceController.text),
                                                      suppliersPrice: double.parse(suppliersPriceController.text),
                                                       taxable: isTaxableUpdate,
                                               ); 
                                               await medProvider.editMedicine(med.medicineName,updatedData: med.toMap());
                                                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Medicine ${medicineNameController.text}  edited successfully')));
                                        }catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error editing medicine: $e')));
                                        }

                                    },
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () {},
                                    child: const Text(
                                      'Reset',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );}
          );
        });
  }

  void deleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('these data will be completly erased'),
          actions: [
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {},
              child: const Text(
                'Discard',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(236, 27, 228, 4)),
                onPressed: () async{
                 try{ final medProvider = Provider.of<MedicineProvider>(context,listen:false);
                  // await medProvider.deleteMedicine(medicineName:data.medicineName,branchName:data.branchName);
                  }catch(e){
                    print(e.toString());
                  }
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _buildHeaderCell('Medicine Name'),
            _buildHeaderCell('Generic Name'),
            _buildHeaderCell('Category'),
            _buildHeaderCell('Weight (mg)'),
            _buildHeaderCell('Expiry Date'),
            _buildHeaderCell('Taxable'),
            _buildHeaderCell('Prescription'),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(Medicine data,List<Batch> batch) {
    if(data!=null){
       DateTime? getExpiry(Medicine? data, List<Batch>?batch){
 if(data != null && batch!=null){
  for(final item in batch){
    if(item.medName == data.medicineName){
     return item.expiryDate;
    }
  } }
  return null;
  }
      
      return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
              Checkbox(
                value: false,
                 onChanged: (bool? value) {
                                                      // Add your checkbox functionality here
                },
                                                  ),
            _buildDataCell(data!.medicineName),
            _buildDataCell(data!.genericName),
            _buildDataCell(data!.catagory),
            _buildDataCell(data!.weight),
            _buildDataCell(getExpiry(data, batch)!.toIso8601String()),
            _buildDataCell('', taxable: data.taxable),
            _buildDataCell('', prescriptionBased: data!.prescriptionBased),
          ],
        ),
      ),
    );}
    else{
      return Container();
    }
  }

  Widget _buildHeaderCell(String text) {
    return SizedBox(
      width: 120,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text,
      {bool prescriptionBased=false, bool taxable = false}) {
    return SizedBox(
      width: 120,
      child: prescriptionBased || taxable
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prescriptionBased)
                  Checkbox(
                    value: prescriptionBased,
                    onChanged: (bool? value) {},
                  ),
                if (taxable)
                  Checkbox(
                    value: taxable,
                    onChanged: (bool? value) {},
                  ),
              ],
            )
          : Text(
              text,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
    );
  }

}