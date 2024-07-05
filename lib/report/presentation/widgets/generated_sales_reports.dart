import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:clean_a/shared/constants/dataR.dart';

class GeneratedSReports extends StatefulWidget {
  const GeneratedSReports({super.key});

  @override
  GeneratedSReportsState createState() => GeneratedSReportsState();
}

class GeneratedSReportsState extends State<GeneratedSReports> {
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    final data = [
      DataR(
        no: '1',
        medicineName: 'Medicine A',
        date: '2023-01-01',
        price: '100',
        quantity: '10',
        status: 'Available',
      ),
      DataR(
        no: '2',
        medicineName: 'Medicine B',
        date: '2023-02-01',
        price: '200',
        quantity: '20',
        status: 'Out of Stock',
      ),
      DataR(
        no: '3',
        medicineName: 'Medicine C',
        date: '2023-03-01',
        price: '300',
        quantity: '30',
        status: 'Available',
      ),
      DataR(
        no: '4',
        medicineName: 'Medicine D',
        date: '2023-04-01',
        price: '400',
        quantity: '40',
        status: 'Out of Stock',
      ),
      DataR(
        no: '5',
        medicineName: 'Medicine E',
        date: '2023-05-01',
        price: '500',
        quantity: '50',
        status: 'Available',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: ListView(
                          padding: const EdgeInsets.all(16.0),
                          children: [
                            const Text(
                              'Generated Sales Reports',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'List of Sales Reports',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
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
                                          horizontal: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // Add export functionality here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    icon: const Icon(Icons.file_download,
                                        color: Colors.white),
                                    label: const Text('Export',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: 20.0,
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.blue),
                                dividerThickness: 0,
                                columns: const <DataColumn>[
                                  DataColumn(label: SizedBox(width: 20)),
                                  DataColumn(
                                    label: Text('Medicine Name',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Date',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Price',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Quantity',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  DataColumn(
                                    label: Text('Status',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  data.length,
                                  (index) => DataRow(
                                    color: MaterialStateColor.resolveWith(
                                        (states) {
                                      return index % 2 == 0
                                          ? Colors.grey[200]!
                                          : Colors.white;
                                    }),
                                    cells: <DataCell>[
                                      DataCell(Text(data[index].no)),
                                      DataCell(Text(data[index].medicineName)),
                                      DataCell(Text(data[index].date)),
                                      DataCell(Text(data[index].price)),
                                      DataCell(Text(data[index].quantity)),
                                      DataCell(Text(data[index].status)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
}
