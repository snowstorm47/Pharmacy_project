import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:clean_a/shared/constants/disposedData.dart';
import 'package:flutter/widgets.dart';

class DisposedList extends StatefulWidget {
  const DisposedList({super.key});

  @override
  State<DisposedList> createState() => _DisposedListState();
}

class _DisposedListState extends State<DisposedList> {
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    final data = [
      DataDis(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Category: 'painkiller',
        Date: '2023-01-01',
        Price: '100 etb.',
        ExpiryDate: '12/12/23',
      ),
      DataDis(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Category: 'painkiller',
        Date: '2023-01-01',
        Price: '100 etb.',
        ExpiryDate: '12/12/23',
      ),
      DataDis(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Category: 'painkiller',
        Date: '2023-01-01',
        Price: '100 etb.',
        ExpiryDate: '12/12/23',
      ),
      DataDis(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Category: 'painkiller',
        Date: '2023-01-01',
        Price: '100 etb.',
        ExpiryDate: '12/12/23',
      ),
      DataDis(
        Batch: '1013/23',
        ProductName: 'Medicine A',
        Category: 'painkiller',
        Date: '2023-01-01',
        Price: '100 etb.',
        ExpiryDate: '12/12/23',
      ),
    ];

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
                              double padding = isTablet ? 46.0 : 16.0;

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
                                            fontSize: isTablet ? 23 : 20),
                                      ),
                                      SizedBox(height: isTablet ? 40 : 20),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        236, 27, 228, 4),
                                              ),
                                              onPressed: () {
                                                _showAddItemDialog(context);
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(Icons.add,
                                                      color: Colors.white,
                                                      size: isTablet ? 17 : 15),
                                                  SizedBox(
                                                      width:
                                                          isTablet ? 17 : 10),
                                                  const Text('Add Items',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: isTablet ? 40 : 20),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
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
                                                      size: isTablet ? 17 : 15),
                                                  SizedBox(
                                                      width:
                                                          isTablet ? 17 : 10),
                                                  const Text('Selected By',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: isTablet ? 40 : 20),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 230, 79, 68),
                                              ),
                                              onPressed: () {
                                                _showDeleteConfirmationDialog(
                                                    context);
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(Icons.delete,
                                                      color: Colors.white,
                                                      size: isTablet ? 17 : 15),
                                                  SizedBox(
                                                      width:
                                                          isTablet ? 17 : 10),
                                                  const Text('Delete Items',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: isTablet ? 40 : 20),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          children: [
                                            _buildHeaderRow(isTablet),
                                            const SizedBox(height: 10),
                                            ...data
                                                .map((item) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: _buildDataRow(
                                                          item, isTablet),
                                                    ))
                                                .toList(),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(236, 27, 228, 4),
              ),
              onPressed: () {
                // Add your delete logic here
                Navigator.of(context).pop();
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
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
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Add Disposed Items',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'You can add disposed items by filling the form below',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Batch',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Type',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Quantity in Price',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Reason',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Branch No',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Product Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Category',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Price',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Generic Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Amount',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Date',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 230, 79, 68),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Discard',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(236, 27, 228, 4),
                      ),
                      onPressed: () {
                        // Add your add item logic here
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
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

  Widget _buildHeaderRow(bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildHeaderCell('Batch', isTablet),
            _buildHeaderCell('Product Name', isTablet),
            _buildHeaderCell('Date', isTablet),
            _buildHeaderCell('Price', isTablet),
            _buildHeaderCell('Category', isTablet),
            _buildHeaderCell('Expiry Date', isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataDis data, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildDataCell(data.Batch, isTablet),
            _buildDataCell(data.ProductName, isTablet),
            _buildDataCell(data.Date, isTablet),
            _buildDataCell(data.Price, isTablet),
            _buildDataCell(data.Category, isTablet),
            _buildDataCell(data.ExpiryDate, isTablet),
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
}
