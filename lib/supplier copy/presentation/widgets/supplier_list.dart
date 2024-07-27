import 'package:clean_a/Cashier/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:clean_a/supplier%20copy/domain/entities/supplier.dart';
import 'package:clean_a/supplier%20copy/provider/supplier_provider.dart';
//import 'package:clean_a/supplier/domain/entities/supplier.dart';
//import 'package:clean_a/supplier/provider/supplier_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/*import 'supplier_provider.dart';
import 'supplier.dart';
import 'side_menu.dart';
import 'header_page.dart';
import 'responsiveDrawer.dart';
*/
class SupplierLists extends StatefulWidget {
  const SupplierLists({super.key});

  @override
  SupplierListsState createState() => SupplierListsState();
}

class SupplierListsState extends State<SupplierLists> {
  bool showSideMenu = false;

  Future<void> _showAddSupplierDialog(BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    final idController = TextEditingController();
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final emailController = TextEditingController();
    final suppliesController = TextEditingController();
    final paymentTermController = TextEditingController();
    final statusController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final addressController = TextEditingController();
    final subCityController = TextEditingController();
    final cityController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Supplier'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: idController,
                    decoration: InputDecoration(labelText: 'Supplierid'),
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: suppliesController,
                    decoration: InputDecoration(labelText: 'Supplies'),
                  ),
                  TextFormField(
                    controller: paymentTermController,
                    decoration: InputDecoration(labelText: 'Payment Term'),
                  ),
                  TextFormField(
                    controller: statusController,
                    decoration: InputDecoration(labelText: 'Status'),
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  TextFormField(
                    controller: subCityController,
                    decoration: InputDecoration(labelText: 'Sub City'),
                  ),
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(labelText: 'City'),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4)),
                  child: Text('Add Supplier',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<SupplierProvider>().addSupplier(
                     //  Supplierid:idController.text,
                        name: nameController.text,
                        description: descriptionController.text,
                        email: emailController.text,
                        supplies: suppliesController.text,
                        paymentTerm: paymentTermController.text,
                        status: statusController.text,
                        phoneNumber: phoneNumberController.text,
                        address: addressController.text,
                        subCity: subCityController.text,
                        city: cityController.text,
                      );
                      Navigator.of(context).pop();
                    }
                  },
                ),


              ],
            ),
          ],
        );
      },
    );
  }

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
                          showSideMenu = false;
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
                            showSideMenu = !showSideMenu;
                          });
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4)),
                              onPressed: () => _showAddSupplierDialog(context),
                              child: Text('Add Supplier',style: TextStyle(color: Colors.white),),
                            ),
                            SizedBox(width: 30,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              onPressed: (){}, child: Text('Filter By',style: TextStyle(color: Colors.white),))
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
                          child: Consumer<SupplierProvider>(
                            builder: (context, provider, child) {
                              return buildContent(provider.supplier ?? [], context);
                            },
                          ),
                        ),
                      ),
                    ],
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

  Widget buildContent(List<Supplier> supplier, BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      dataTableTheme: DataTableThemeData(
        headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue), // Set header row color
        headingTextStyle: TextStyle(color: Colors.white), // Set header text color
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Supplier Lists',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        DataTable(
          columns: const [
            DataColumn(label: Text('Supplier ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Phone')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Address')),
            DataColumn(label: Text('Actions')),
          ],
          rows: supplier.map((data) {
            return DataRow(
              cells: [
                DataCell(Text(data.supplierId ?? '')),
                DataCell(Text(data.name)),
                DataCell(Text(data.phoneNumber)),
                DataCell(Text(data.status)),
                DataCell(Text(data.address)),
                DataCell(
                  Row(
    children: [
      IconButton(
        icon: const Icon(Icons.edit,size: 14,),
        onPressed: () {
          _showUpdateSupplierDialog(context, data);
        },
      ),
      IconButton(
        icon: const Icon(Icons.delete,size: 14,),
        onPressed: () {
          _showDeleteConfirmationDialog(context, data.supplierId ?? '');
        },
      ),
        IconButton(
                        icon: const Icon(Icons.message,size: 14,),
                        onPressed: () {
                          _showSendMessageDialog(context, data.supplierId ?? '');
                        },
                      ),
    ],
  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    ),
  );
}

Future<void> _showSendMessageDialog(BuildContext context, String supplierId) async {
  final _formKey = GlobalKey<FormState>();
  final subjectController = TextEditingController();
  final bodyController = TextEditingController();

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Send Message'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: subjectController,
                  decoration: InputDecoration(labelText: 'Subject'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a subject';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: bodyController,
                  decoration: InputDecoration(labelText: 'Message Body'),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a message';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4)),
            child: Text('Send Message', style: TextStyle(color: Colors.white)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<SupplierProvider>().contact(
                  subjectController.text,
                  bodyController.text,
                  supplierId,
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}



Future<void> _showUpdateSupplierDialog(BuildContext context, Supplier supplier) async {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: supplier.name);
  final descriptionController = TextEditingController(text: supplier.description);
  final emailController = TextEditingController(text: supplier.email);
  final suppliesController = TextEditingController(text: supplier.supplies);
  final paymentTermController = TextEditingController(text: supplier.paymentTerm);
  final statusController = TextEditingController(text: supplier.status);
  final phoneNumberController = TextEditingController(text: supplier.phoneNumber);
  final addressController = TextEditingController(text: supplier.address);
  final subCityController = TextEditingController(text: supplier.subCity);
  final cityController = TextEditingController(text: supplier.city);

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Update Supplier'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: suppliesController,
                  decoration: InputDecoration(labelText: 'Supplies'),
                ),
                TextFormField(
                  controller: paymentTermController,
                  decoration: InputDecoration(labelText: 'Payment Term'),
                ),
                TextFormField(
                  controller: statusController,
                  decoration: InputDecoration(labelText: 'Status'),
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                TextFormField(
                  controller: subCityController,
                  decoration: InputDecoration(labelText: 'Sub City'),
                ),
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(labelText: 'City'),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4)),
            child: Text('Update Supplier',style: TextStyle(color: Colors.white)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<SupplierProvider>().editSupplier(
                  supplier.supplierId ?? '',
                  updatedData: {
                    'name': nameController.text,
                    'description': descriptionController.text,
                    'email': emailController.text,
                    'supplies': suppliesController.text,
                    'paymentTerm': paymentTermController.text,
                    'status': statusController.text,
                    'phoneNumber': phoneNumberController.text,
                    'address': addressController.text,
                    'subCity': subCityController.text,
                    'city': cityController.text,
                  },
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
Future<void> _showDeleteConfirmationDialog(BuildContext context, String supplierId) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm Deletion'),
        content: Text('Are you sure you want to delete this supplier?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4)),
            child: Text('Delete', style: TextStyle(color: Colors.white)),
            onPressed: () {
              context.read<SupplierProvider>().removeSuppliers(supplierId);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}