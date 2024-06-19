import 'package:clean_a/shared/constants/dataS.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';

class SupplierLists extends StatefulWidget {
  const SupplierLists({super.key});

  @override
  SupplierListsState createState() => SupplierListsState();
}

class SupplierListsState extends State<SupplierLists> {
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    final data = [
      DataS(
        supplierId: '01',
        name: 'Johannes Dereje',
        phone: 'abel',
        status: 'Gulele',
        address: 'AbelaTechB@gmail.com',
      ),
      DataS(
        supplierId: '01',
        name: 'Johannes Dereje',
        phone: 'abel',
        status: 'Gulele',
        address: 'AbelaTechB@gmail.com',
      ),
      DataS(
        supplierId: '01',
        name: 'Sitra Dereje',
        phone: 'abel',
        status: 'Gulele',
        address: 'AbelaTechB@gmail.com',
      ),
      DataS(
        supplierId: '01',
        name: 'Chalah Dereje',
        phone: 'abel',
        status: 'Gulele',
        address: 'AbelaTechB@gmail.com',
      ),
      DataS(
        supplierId: '01',
        name: 'Yonne dereje',
        phone: 'abel',
        status: 'Gulele',
        address: 'AbelaTechB@gmail.com',
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
                          child: buildContent(data, context),
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

  Widget buildContent(List<DataS> data, BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        double padding = isTablet ? 46.0 : 16.0;

        return Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Supplier Lists',
                style: TextStyle(fontSize: isTablet ? 23 : 20),
              ),
              const SizedBox(height: 10),
              Text(
                'Here are your list of suppliers ',
                style: TextStyle(fontSize: isTablet ? 13 : 10),
              ),
              SizedBox(height: isTablet ? 40 : 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
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
                      '+  Add User',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    _buildHeaderRow(isTablet),
                    Column(
                      children: data
                          .map((item) => _buildDataRow(item, isTablet))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderRow(bool isTablet) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildHeaderCell('Supplier_Id', isTablet),
            _buildHeaderCell('Name', isTablet),
            _buildHeaderCell('Phone', isTablet),
            _buildHeaderCell('Status', isTablet),
            _buildHeaderCell('Address', isTablet),
            _buildHeaderCell('Actions', isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(DataS data, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildDataCell(data.supplierId, isTablet),
            _buildDataCell(data.name, isTablet),
            _buildDataCell(data.phone, isTablet),
            _buildDataCell(data.status, isTablet),
            _buildDataCell(data.address, isTablet),
            _buildDataCell('', isAction: true, isTablet),
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
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet, {bool isAction = false}) {
    return Container(
      width: isTablet ? 150 : 120,
      child: isAction
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.message,
                  color: Colors.black,
                  size: isTablet ? 17 : 15,
                ),
                SizedBox(width: isTablet ? 17 : 10),
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: isTablet ? 17 : 15,
                ),
                SizedBox(width: isTablet ? 17 : 10),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: isTablet ? 17 : 15,
                ),
              ],
            )
          : Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: isTablet ? 16 : 14,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
