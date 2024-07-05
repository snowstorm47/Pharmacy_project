import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Pharmacy Hub"),
        centerTitle: true,
        leading: !ResponsiveD.isDesktop(context)
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    showSideMenu = !showSideMenu;
                  });
                },
              )
            : null,
      ),
      body: SafeArea(
        child: ResponsiveD.isDesktop(context)
            ? Drawer(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                width: 250,
                child: SideMenu(onClose: () {}),
              )
            : showSideMenu
                ? Drawer(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    width: 200,
                    child: SideMenu(onClose: () {
                      setState(() {
                        showSideMenu = false;
                      });
                    }),
                  )
                : Container(),
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
        color: Colors.white,
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
            backgroundColor: Colors.white,
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
                      color: Colors.white,
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
                        Navigator.pushReplacementNamed(context, '/dashboard');
                        onClose();
                      },
                      tileColor: Colors.white,
                    ),
                    DrawerListTile(
                      title: 'Customer',
                      falIcon: FontAwesomeIcons.user,
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
                    ),
                    DrawerListTile(
                      title: 'Medicine',
                      falIcon: FontAwesomeIcons.pills,
                      press: () {},
                      dropdownItems: const [
                        {
                          'title': 'Medicine List',
                          'route': '/medicine/details'
                        },
                        // {'title': 'Add Medicine', 'route': '/medicine/add'},
                      ],
                      tileColor: Colors.white,
                    ),
                    DrawerListTile(
                      title: 'Sales',
                      falIcon: FontAwesomeIcons.chartLine,
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Sales Report', 'route': '/sales'},
                        {'title': 'New Sale', 'route': '/sales/page'},
                      ],
                      tileColor: Colors.white,
                    ),
                    DrawerListTile(
                      title: 'Stock',
                      falIcon: FontAwesomeIcons.fileMedical,
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
                    ),
                    DrawerListTile(
                      title: 'Reports',
                      falIcon: FontAwesomeIcons.noteSticky,
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
                    ),
                    DrawerListTile(
                      title: 'Supplier',
                      falIcon: FontAwesomeIcons.car,
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Supplier List', 'route': '/supplier/list'},
                        {'title': 'Add Supplier', 'route': '/supplier/add'},
                      ],
                      tileColor: Colors.white,
                    ),
                    DrawerListTile(
                      title: 'Branches',
                      falIcon: FontAwesomeIcons.codeBranch,
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
                    ),
                    DrawerListTile(
                      title: 'Return',
                      falIcon: FontAwesomeIcons.rotateLeft,
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Return List', 'route': '/return/list'},
                        {'title': 'New Return', 'route': '/return/new'},
                      ],
                      tileColor: Colors.white,
                    ),
                    DrawerListTile(
                      title: 'Employee',
                      falIcon: FontAwesomeIcons.person,
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
                    ),
                    DrawerListTile(
                      title: 'Finance',
                      falIcon: FontAwesomeIcons.dollarSign,
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
                    ),
                    DrawerListTile(
                      title: 'Setting',
                      falIcon: FontAwesomeIcons.gears,
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
                  ],
                ),
              ],
            ),
          ),
          if (!ResponsiveD.isDesktop(context))
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
    this.tileColor = Colors.transparent,
  });

  final String title;
  final IconData falIcon;
  final VoidCallback press;
  final List<Map<String, String>>? dropdownItems;
  final Color tileColor;

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
          color: widget.tileColor,
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
                color: widget.tileColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: ListTile(
                    title: Text(item['title']!),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, item['route']!);
                      widget.press(); // Close the dropdown
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
