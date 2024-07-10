import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../navigation_provider.dart';

class SideMenuPharmacist extends StatelessWidget {
  const SideMenuPharmacist({
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
                                const Text("Pharmacy HuB")
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
                        Provider.of<PharmacistProvider>(context, listen: false).navigateTo('/dashboard');
                      },
                      tileColor: Colors.white,
                    ),
                    DrawerListTile(
                      title: 'Customer',
                           falIcon: FontAwesomeIcons.user,
                      dropdownItems:const[
                        {'title': 'Add Authorized User', 'route': '/customerP/add_authorized_user'},
                        {'title': 'Authorizeduserslist', 'route': '/customerP/authorized_user_list'},
                        {'title': 'AuthorizedCompany', 'route': '/customerP/add_authorized_company'},
                      ],
                      press: () {},
                      tileColor: Colors.white,
                    ),
                      DrawerListTile(
                      title: 'Medicine',
                      falIcon: FontAwesomeIcons.pills,
                      press: () {},
                      dropdownItems: const [
                        {
                          'title': 'Medicine List',
                          'route': '/medicineP/details'
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
                        {'title': 'Sales Report', 'route': '/salesP'},
                        {'title': 'New Sale', 'route': '/salesP/page'},
                      ],
                      tileColor: Colors.white,
                    ),
                    DrawerListTile(
                      title: 'Stock',
                      falIcon: FontAwesomeIcons.fileMedical,
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Stock List', 'route': '/stockP/list'},
                        {'title': 'out Stock', 'route': '/stockP/out_of_stock'},
                        {
                          'title': 'expired medicine',
                          'route': '/stockP/expired'
                        },
                        {'title': 'Add Stock', 'route': '/stockP/add'},
                      ],
                      tileColor: Colors.white,
                    ),
                  
                  
                    DrawerListTile(
                      title: 'Branches',
                      falIcon: FontAwesomeIcons.codeBranch,
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Branch List', 'route': '/branchP/list'},
                        {'title': 'Add Branch', 'route': '/branchP/add'},
                        {'title': 'Branch stock', 'route': '/branchP/stock'},
                        {
                          'title': 'Branch refill',
                          'route': '/branchP/refill_request'
                        },
                      ],
                      tileColor: Colors.white,
                    ),
                    DrawerListTile(
                      title: 'Return',
                      falIcon: FontAwesomeIcons.rotateLeft,
                      press: () {},
                      dropdownItems: const [
                        {'title': 'Return List', 'route': '/returnP/list'},
                        {'title': 'New Return', 'route': '/returnP/new'},
                      ],
                      tileColor: Colors.white,
                    ),
                 


                    // Add more DrawerListTile here for other pages
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
                      Provider.of<PharmacistProvider>(context, listen: false).navigateTo(item['route']!);
                      setState(() {
                        isExpanded = false; // Close the dropdown after navigation
                      });
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