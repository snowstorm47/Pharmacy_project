import 'package:clean_a/navigationprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:clean_a/providers/navigation_provider.dart';
import 'package:clean_a/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                        Provider.of<NavigationProvider>(context, listen: false).navigateTo('/dashboard');
                      },
                      tileColor: Colors.white,
                    ),
                    DrawerListTile(
                      title: 'Customer',
                           falIcon: FontAwesomeIcons.user,
                      dropdownItems: [
                        {'title': 'Add Authorized User', 'route': '/customer/add_authorized_user'},
                        {'title': 'Authorizeduserslist', 'route': '/customer/authorized_user_list'},
                        {'title': 'AuthorizedCompany', 'route': '/customer/add_authorized_company'},
                      ],
                      press: () {},
                      tileColor: Colors.white,
                    ),
                     DrawerListTile(
                      title: 'Medicine',
                           falIcon: FontAwesomeIcons.pills,
                      dropdownItems: [
                        {'title': 'medicine_list', 'route': '/medicine/medicine_list'},
                      
                      ],
                      press: () {},
                      tileColor: Colors.white,
                    ),
 DrawerListTile(
                      title: 'Sales',
                           falIcon: FontAwesomeIcons.chartLine,
                      dropdownItems: [
                        {'title': 'Sales Report', 'route': '/sales/sales report'},
                      
                      ],
                      press: () {},
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
                      Provider.of<NavigationProvider>(context, listen: false).navigateTo(item['route']!);
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
