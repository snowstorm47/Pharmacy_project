import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/data.dart';
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
      backgroundColor: Colors.white, // Ensure the Scaffold background is white
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar background color
        title: const Text("Pharmacy Hub"),
        centerTitle: true,
        leading: !ResponsiveD.isDesktop(context)
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    showSideMenu = !showSideMenu; // Toggle showSideMenu value
                  });
                },
              )
            : null,
      ),
      body: SafeArea(
        child: ResponsiveD.isDesktop(context)
            ? Drawer(
                backgroundColor:
                    Colors.white, // Set Drawer background color to white
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                width: 250,
                child: SideMenu(onClose: () {}),
              )
            : showSideMenu
                ? Drawer(
                    backgroundColor:
                        Colors.white, // Set Drawer background color to white
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    width: 200,
                    child: SideMenu(onClose: () {}),
                  )
                : Container(), // Show an empty container if showSideMenu is false
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
        color: Colors.white, // Set background color to white
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
            backgroundColor:
                Colors.white, // Set Drawer background color to white
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
                      color: Colors
                          .white, // Ensure the Container background is white
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
                        onClose(); // Close the sidebar
                      },
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Customer',
                      falIcon: FontAwesomeIcons.user,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: CustomerData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Medicine',
                      falIcon: FontAwesomeIcons.pills,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: MedicineData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Sales',
                      falIcon: FontAwesomeIcons.chartLine,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: SalesData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Stock',
                      falIcon: FontAwesomeIcons.fileMedical,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: StockData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Reports',
                      falIcon: FontAwesomeIcons.noteSticky,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: ReportData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Supplier',
                      falIcon: FontAwesomeIcons.car,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: SupplierData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Branches',
                      falIcon: FontAwesomeIcons.codeBranch,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: BranchData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Return',
                      falIcon: FontAwesomeIcons.rotateLeft,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: ReturnData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Employee',
                      falIcon: FontAwesomeIcons.person,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: EmployeeData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Finance',
                      falIcon: FontAwesomeIcons.dollarSign,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      dropdownItems: FinanceData.items,
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    DrawerListTile(
                      title: 'Setting',
                      falIcon: FontAwesomeIcons.gears,
                      press: () {
                        onClose(); // Close the sidebar
                      },
                      tileColor: Colors
                          .white, // Set ListTile background color to white
                    ),
                    // Add more menu items as needed
                  ],
                ),
              ],
            ),
          ),
          if (!ResponsiveD.isDesktop(
              context)) // Show close icon only on mobile and tablet
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
    this.tileColor = Colors
        .transparent, // Default to transparent to avoid affecting other parts
  });

  final String title;
  final IconData falIcon;
  final VoidCallback press;
  final List<String>? dropdownItems;
  final Color tileColor; // New parameter for tile color

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
          color: widget.tileColor, // Apply the tile color
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
                color:
                    widget.tileColor, // Apply the tile color to dropdown items
                child: Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: ListTile(
                    title: Text(item),
                    onTap: () {
                      // Handle sub-item tap
                      print('Selected: $item');
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
