import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import '../widgets/refill_request_widgets.dart'; // Import the widget file

class RefillRequestPage extends StatefulWidget {
  const RefillRequestPage({super.key});

  @override
  RefillRequestPageState createState() => RefillRequestPageState();
}

class RefillRequestPageState extends State<RefillRequestPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF3F6F0),
      drawer: SideMenu(
        onClose: () {
          setState(() {
            showSideMenu = false;
          });
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
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
                          if (!ResponsiveD.isDesktop(context)) {
                            _scaffoldKey.currentState?.openDrawer();
                          }
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: RefillRequestContent(),
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
