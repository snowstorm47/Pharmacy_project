import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:clean_a/return/domain/entities/disposed.dart';
import 'package:clean_a/return/provider/return_provider.dart';


class DisposedList extends StatefulWidget {
  const DisposedList({Key? key}) : super(key: key);

  @override
  State<DisposedList> createState() => _DisposedListState();
}

class _DisposedListState extends State<DisposedList> {
  bool showSideMenu = false;

  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController batchIdController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<int> selectedIndexes = [];
  @override
  void initState(){
    super.initState();
    Future.microtask(() {
      Provider.of<ReturnProvider>(context, listen: false).getDisposed();
    });
  }

  @override
  void dispose() {
    medicineNameController.dispose();
    reasonController.dispose();
    batchIdController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReturnProvider>(
      builder: (context, value, child) {
        List<Disposed>? disposedList = value.disposedList;

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
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(16.0),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  bool isTablet = constraints.maxWidth > 600;
                                  double padding =
                                      isTablet ? 46.0 : 16.0;

                                  return Padding(
                                    padding: EdgeInsets.all(padding),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            'Disposed Items',
                                            style: TextStyle(
                                                fontSize:
                                                    isTablet ? 23 : 20),
                                          ),
                                          SizedBox(
                                              height: isTablet ? 40 : 20),
                                          SingleChildScrollView(
                                            scrollDirection:
                                                Axis.horizontal,
                                            child: Row(
                                              children: [
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                    ),
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            236, 27, 228, 4),
                                                  ),
                                                  onPressed: () {
                                                    _showAddItemDialog(
                                                        context);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.add,
                                                          color: Colors.white,
                                                          size:
                                                              isTablet ? 17 : 15),
                                                      SizedBox(
                                                          width:
                                                              isTablet ? 17 : 10),
                                                      const Text(
                                                          'Add Items',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        isTablet ? 40 : 20),
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                    ),
                                                    backgroundColor:
                                                        const Color.fromRGBO(
                                                            33, 150, 243, 1),
                                                  ),
                                                  onPressed: () {},
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                          Icons
                                                              .format_line_spacing_sharp,
                                                          color: Colors.black,
                                                          size:
                                                              isTablet ? 17 : 15),
                                                      SizedBox(
                                                          width:
                                                              isTablet ? 17 : 10),
                                                      const Text(
                                                          'Selected By',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        isTablet ? 40 : 20),
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                    ),
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 230, 79, 68),
                                                  ),
                                                  onPressed: selectedIndexes.isEmpty ? null : _deleteSelectedItems,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.delete,
                                                          color: Colors.white,
                                                          size:
                                                              isTablet ? 17 : 15),
                                                      SizedBox(
                                                          width:
                                                              isTablet ? 17 : 10),
                                                      const Text(
                                                          'Delete Items',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              height: isTablet ? 40 : 20),
                                          SingleChildScrollView(
                                            scrollDirection:
                                                Axis.horizontal,
                                            child: Column(
                                              children: [
                                                _buildHeaderRow(
                                                    isTablet, disposedList),
                                                const SizedBox(height: 10),
                                                disposedList == null
                                                    ? SizedBox()
                                                    : Column(
                                                        children:disposedList
                                                            .asMap()
                                                            .entries
                                                            .map((entry) =>
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              10),
                                                                  child:
                                                                      _buildDataRow(
                                                                          entry.value,
                                                                          isTablet, entry.key),
                                                                ))
                                                            .toList(),
                                                    ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
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
      },
    );
  }

  Widget _buildHeaderRow(bool isTablet, List<Disposed>? disposedList) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 20, // Adjust width for checkbox
              child: Center(
                child: Text(''),
              ),
            ),
            _buildHeaderCell('Batch', isTablet),
            _buildHeaderCell('Product Name', isTablet),
            _buildHeaderCell('Date', isTablet),
            _buildHeaderCell('Price', isTablet),
            _buildHeaderCell('Category', isTablet),
            _buildHeaderCell('Expiry Date', isTablet),
            _buildHeaderCell('Actions', isTablet), // Add an actions column header
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(Disposed data, bool isTablet, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            SizedBox(
              width: 20, // Adjust width for checkbox
              child: Checkbox(
                value: selectedIndexes.contains(index),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedIndexes.add(index);
                    } else {
                      selectedIndexes.remove(index);
                    }
                  });
                },
              ),
            ),
            _buildDataCell(data.batchId, isTablet),
            _buildDataCell(data.medicineName, isTablet),
            _buildDataCell(data.dateAdded.toString(), isTablet),
            _buildDataCell(data.sellingPrice, isTablet),
            _buildDataCell(data.catagory, isTablet),
            _buildDataCell(data.expiryDate.toString(), isTablet),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                final returnProvider = Provider.of<ReturnProvider>(context, listen: false);
                await returnProvider.removeDisposed(data.batchId);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, bool isTablet) {
    return SizedBox(
      width: isTablet ? 150 : 120,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet) {
    return SizedBox(
      width: isTablet ? 150 : 120,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  void _deleteSelectedItems() {
    final returnProvider = Provider.of<ReturnProvider>(context, listen: false);
    for (int index in selectedIndexes) {
      returnProvider.removeDisposed(returnProvider.disposedList![index].batchId);
    }
    setState(() {
      selectedIndexes.clear();
    });
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Are you Sure?',
            style: TextStyle(fontSize: 23),
          ),
          content: const Text('The data will be completely erased'),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 230, 79, 68))),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 26, 188, 156))),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Accept', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: medicineNameController,
                    decoration: const InputDecoration(labelText: 'Medicine Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: reasonController,
                    decoration: const InputDecoration(labelText: 'Reason'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: batchIdController,
                    decoration: const InputDecoration(labelText: 'Batch ID'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Save the data and close the dialog
                        // Example: saveData();
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
