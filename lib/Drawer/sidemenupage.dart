import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:clean_a/Drawer/data.dart';
=======

>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideMenuPageSuper extends StatefulWidget {
  const SideMenuPageSuper({super.key});

  @override
  State<SideMenuPageSuper> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPageSuper> {
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.white, // Ensure the Scaffold background is white
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar background color
=======
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
        title: const Text("Pharmacy Hub"),
        centerTitle: true,
        leading: !ResponsiveD.isDesktop(context)
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  setState(() {
<<<<<<< HEAD
                    showSideMenu = !showSideMenu; // Toggle showSideMenu value
=======
                    showSideMenu = !showSideMenu;
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                  });
                },
              )
            : null,
      ),
      body: SafeArea(
        child: ResponsiveD.isDesktop(context)
            ? Drawer(
<<<<<<< HEAD
                backgroundColor:
                    Colors.white, // Set Drawer background color to white
=======
                backgroundColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                width: 250,
                child: SideMenu(onClose: () {}),
              )
            : showSideMenu
                ? Drawer(
<<<<<<< HEAD
                    backgroundColor:
                        Colors.white, // Set Drawer background color to white
=======
                    backgroundColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    width: 200,
<<<<<<< HEAD
                    child: SideMenu(onClose: () {}),
                  )
                : Container(), // Show an empty container if showSideMenu is false
=======
                    child: SideMenu(onClose: () {
                      setState(() {
                        showSideMenu = false;
                      });
                    }),
                  )
                : Container(),
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.onClose,
  });

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
<<<<<<< HEAD
        color: Colors.white, // Set background color to white
=======
        color: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Stack(
        children: [
          Drawer(
<<<<<<< HEAD
            backgroundColor:
                Colors.white, // Set Drawer background color to white
=======
            backgroundColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 100,
<<<<<<< HEAD
                      color: Colors
                          .white, // Ensure the Container background is white
=======
                      color: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/download.jpg",
                                  height: 36,
                                ),
                                const Text("Pharmacy Hub")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    DrawerListTile(
                      title: 'Dashboard',
                      falIcon: FontAwesomeIcons.dashcube,
                      press: () {
<<<<<<< HEAD
                        onClose(); // Close the sidebar
                      },
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                        Navigator.pushReplacementNamed(context, '/dashboard');
                        onClose();
                      },
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Customer',
                      falIcon: FontAwesomeIcons.user,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: CustomerData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                      press: () {},
                      dropdownItems: const [
                        {
                          'title': 'Authorized User',
                          'route': '/customer/authorized_user'
                        },
                        {
                          'title': 'Add User',
                          'route': '/customer/add_authorized_user'
                        },
                        {
                          'title': 'Add authorized company',
                          'route': '/customer/add_authorized_company'
                        },
                      ],
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Medicine',
                      falIcon: FontAwesomeIcons.pills,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: MedicineData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                      press: () {},
                      dropdownItems: const [
                        {
                          'title': 'Medicine List',
                          'route': '/medicine/details'
                        },
                        // {'title': 'Add Medicine', 'route': '/medicine/add'},
                      ],
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Sales',
                      falIcon: FontAwesomeIcons.chartLine,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: SalesData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Sales Report', 'route': '/sales'},
                        {'title': 'New Sale', 'route': '/sales/page'},
                      ],
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Stock',
                      falIcon: FontAwesomeIcons.fileMedical,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: StockData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Stock List', 'route': '/stock/list'},
                        {'title': 'out Stock', 'route': '/stock/out_of_stock'},
                        {
                          'title': 'expired medicine',
                          'route': '/stock/expired'
                        },
                        {'title': 'Add Stock', 'route': '/stock/add'},
                      ],
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Reports',
                      falIcon: FontAwesomeIcons.noteSticky,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: ReportData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                      press: () {},
                      dropdownItems: const [
                        {
                          'title': ' generated Report purchase',
                          'route': '/reports/generated_purchase'
                        },
                        {
                          'title': ' Report purchase',
                          'route': '/reports/purchase'
                        },
                        {
                          'title': ' generated Report sales',
                          'route': '/reports/generated_sales'
                        },
                        {'title': ' Report sales', 'route': '/reports/sales'},
                      ],
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Supplier',
                      falIcon: FontAwesomeIcons.car,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: SupplierData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Supplier List', 'route': '/supplier/list'},
                        {'title': 'Add Supplier', 'route': '/supplier/add'},
                      ],
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Branches',
                      falIcon: FontAwesomeIcons.codeBranch,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: BranchData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Branch List', 'route': '/branch/list'},
                        {'title': 'Add Branch', 'route': '/branch/add'},
                        {'title': 'Branch stock', 'route': '/branch/stock'},
                        {
                          'title': 'Branch refill',
                          'route': '/branch/refill_request'
                        },
                      ],
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Return',
                      falIcon: FontAwesomeIcons.rotateLeft,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: ReturnData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Return List', 'route': '/return/list'},
                        {'title': 'New Return', 'route': '/return/new'},
                      ],
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Employee',
                      falIcon: FontAwesomeIcons.person,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: EmployeeData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                      press: () {},
                      dropdownItems: const [
                        {
                          'title': 'Employee profile',
                          'route': '/employee/profile'
                        },
                        {
                          'title': 'Attendance Employee',
                          'route': '/employee/attendance'
                        },
                      ],
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Finance',
                      falIcon: FontAwesomeIcons.dollarSign,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: FinanceData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
=======
                      press: () {},
                      dropdownItems: const [
                        {
                          'title': 'Finance expense',
                          'route': '/finance/expense'
                        },
                        {'title': 'finance income', 'route': '/finance/income'},
                        {
                          'title': 'Invoice Detail',
                          'route': '/finance/invoice_details'
                        },
                        {
                          'title': 'Invoice Detail2',
                          'route': '/finance/dashboard'
                        },
                      ],
                      tileColor: Colors.white,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    ),
                    DrawerListTile(
                      title: 'Setting',
                      falIcon: FontAwesomeIcons.gears,
<<<<<<< HEAD
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    // Add more menu items as needed
=======
                      press: () {},
                      dropdownItems: const [
                        {
                          'title': 'password requests',
                          'route': '/settings/password_requests'
                        },
                        {
                          'title': 'report complaints',
                          'route': '/settings/report_complaints'
                        },
                        {
                          'title': 'view_roles',
                          'route': '/settings/view_roles'
                        },
                      ],
                      tileColor: Colors.white,
                    ),
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                  ],
                ),
              ],
            ),
          ),
<<<<<<< HEAD
          if (!ResponsiveD.isDesktop(
              context)) // Show close icon only on mobile and tablet
=======
          if (!ResponsiveD.isDesktop(context))
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClose,
              ),
            ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.falIcon,
    required this.press,
    this.dropdownItems,
<<<<<<< HEAD
    this.tileColor = Colors
        .transparent, // Default to transparent to avoid affecting other parts
=======
    this.tileColor = Colors.transparent,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
  });

  final String title;
  final IconData falIcon;
  final VoidCallback press;
<<<<<<< HEAD
  final List<String>? dropdownItems;
  final Color tileColor; // New parameter for tile color
=======
  final List<Map<String, String>>? dropdownItems;
  final Color tileColor;
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61

  @override
  DrawerListTileState createState() => DrawerListTileState();
}

class DrawerListTileState extends State<DrawerListTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
<<<<<<< HEAD
          color: widget.tileColor, // Apply the tile color
=======
          color: widget.tileColor,
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: ListTile(
              onTap: widget.dropdownItems == null
                  ? widget.press
                  : () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
              horizontalTitleGap: 20,
              leading: FaIcon(
                widget.falIcon,
                color: Colors.grey[500],
                size: 20,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(color: Colors.black87),
                  ),
                  if (widget.dropdownItems != null)
                    Icon(
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.grey[500],
                    ),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded && widget.dropdownItems != null)
          Column(
            children: widget.dropdownItems!.map((item) {
              return Container(
<<<<<<< HEAD
                color:
                    widget.tileColor, // Apply the tile color to dropdown items
                child: Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: ListTile(
                    title: Text(item),
                    onTap: () {
                      // Handle sub-item tap
                      print('Selected: $item');
=======
                color: widget.tileColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: ListTile(
                    title: Text(item['title']!),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, item['route']!);
                      widget.press(); // Close the dropdown
>>>>>>> 3f0d682fb2dc559f6a6fa385bca116121b48dc61
                    },
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
