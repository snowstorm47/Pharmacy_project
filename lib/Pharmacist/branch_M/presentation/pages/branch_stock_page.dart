import 'package:clean_a/branch_M/data/models/branch_stock_data.dart';
import 'package:clean_a/branch_M/presentation/widgets/branch_stock_widet.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';

import '../../../Drawer/sidemenupage.dart';

class BranchStockPageP extends StatefulWidget {
  const BranchStockPageP({super.key});

  @override
  BranchStockPageState createState() => BranchStockPageState();
}

class BranchStockPageState extends State<BranchStockPageP> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (ResponsiveD.isDesktop(context))
                  Expanded(
                    child: SideMenuPharmacist(
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
                          if (!ResponsiveD.isDesktop(context)) {
                            _scaffoldKey.currentState?.openDrawer();
                          }
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: BranchStockWidget(
                                data: BranchStockData.dummyData()),
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
                child: SideMenuPharmacist(
                  onClose: () {
                    setState(() {
                      showSideMenu = false;
                    });
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
