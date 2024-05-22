import 'package:clean_a/Drawer/data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/utility/responsiveDrawer.dart';

class SideMenuPage extends StatefulWidget {
  const SideMenuPage({Key? key}) : super(key: key);

  @override
  State<SideMenuPage> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            ? const Drawer(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                width: 250,
                child: SideMenu(),
              )
            : showSideMenu
                ? const Drawer(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    width: 200,
                    child: SideMenu(),
                  )
                : Container(), // Show an empty container if showSideMenu is false
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/download.jpg",
                      height: 36,
                    ),
                    const Text("Pharmacy Hub")
                  ],
                ),
              ),
            ),
            DrawerListTile(
              title: 'Dashboard',
              falIcon: FontAwesomeIcons.dashcube,
              press: () {},
            ),
            DrawerListTile(
              title: 'Customer',
              falIcon: FontAwesomeIcons.user,
              press: () {},
              dropdownItems: CustomerData.items,
            ),
            DrawerListTile(
              title: 'Medicine',
              falIcon: FontAwesomeIcons.pills,
              press: () {},
            ),
            DrawerListTile(
              title: 'Sales',
              falIcon: FontAwesomeIcons.chartLine,
              press: () {},
            ),
            DrawerListTile(
              title: 'Stock',
              falIcon: FontAwesomeIcons.box,
              press: () {},
            ),
            DrawerListTile(
              title: 'Report',
              falIcon: FontAwesomeIcons.fileMedical,
              press: () {},
            ),
            DrawerListTile(
              title: 'Supplier',
              falIcon: FontAwesomeIcons.truckFast,
              press: () {},
              dropdownItems: SupplierData.items,
            ),
            DrawerListTile(
              title: 'Branch',
              falIcon: FontAwesomeIcons.building,
              press: () {},
              dropdownItems: BranchData.items,
            ),
            DrawerListTile(
              title: 'Return',
              falIcon: FontAwesomeIcons.undoAlt,
              press: () {},
            ),
            DrawerListTile(
              title: 'Finance',
              falIcon: FontAwesomeIcons.dollarSign,
              press: () {},
            ),
            DrawerListTile(
              title: 'Setting',
              falIcon: FontAwesomeIcons.cogs,
              press: () {},
            ),
          ],
        ),
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
  });

  final String title;
  final IconData falIcon;
  final VoidCallback press;
  final List<String>? dropdownItems;

  @override
  _DrawerListTileState createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
                  style: TextStyle(color: Colors.black87),
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
        if (isExpanded && widget.dropdownItems != null)
          Column(
            children: widget.dropdownItems!.map((item) {
              return Padding(
                padding: const EdgeInsets.only(left: 70),
                child: ListTile(
                  title: Text(item),
                  onTap: () {
                    // Handle sub-item tap
                    print('Selected: $item');
                  },
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
