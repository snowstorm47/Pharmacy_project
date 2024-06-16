import 'package:clean_a/dashboard/presentation/pages/header.dart'; // Import HeaderPage
import 'package:clean_a/dashboard/presentation/pages/sidemenupage.dart';
import 'package:clean_a/settings/presentation/pages/AddRoleScreen.dart';
import 'package:flutter/material.dart';

class DashBoardScreensettings extends StatelessWidget {
  const DashBoardScreensettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          // Change Row to Column
          children: <Widget>[
            Expanded(flex: 2, child: SideMenuPageSuper()),
            // Expanded(
            //   flex: 2,
            //   child: SideMenuPageSuper(),
            // ),
            // Expanded(
            //   // Expand the remaining space
            //   flex: 1,
            //   child: Column(
            //     children: <Widget>[
            //       HeaderPage(
            //         // Integrate HeaderPage here
            //         onMenuPressed: () {
            //           // Handle menu press logic here (optional)
            //         },
            //         isSideMenuOpen: false, // Set isSideMenuOpen as needed
            //       ),
            //       Expanded(
            //         flex: 10,
            //         child: Invoice_details(),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              flex: 10,
              child: Column(
                children: <Widget>[
                  HeaderPage(
                    // Integrate HeaderPage here
                    onMenuPressed: () {
                      // Handle menu press logic here (optional)
                    },
                    isSideMenuOpen: false, // Set isSideMenuOpen as needed
                  ),
                  Expanded(
                    flex: 10,
                    child: AddRole(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
