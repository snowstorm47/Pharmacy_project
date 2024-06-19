import 'package:clean_a/employee/presentation/Componet/salaryList/salary_list_table.dart';
import 'package:clean_a/employee/presentation/Componet/salaryList/salary_pop.dart';
import 'package:flutter/material.dart';

import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
// Import the SalaryListTable widget

class SalaryListPage extends StatefulWidget {
  const SalaryListPage({super.key});

  @override
  SalaryListPageState createState() => SalaryListPageState();
}

class SalaryListPageState extends State<SalaryListPage> {
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F0),
      body: SafeArea(
        child: Stack(
          children: [
            // Main content area
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar (only for desktop)
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
                // Main content
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Header
                      HeaderPage(
                        onMenuPressed: () {
                          setState(() {
                            showSideMenu = !showSideMenu;
                          });
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      // Content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Row with Salary List Text and Money Icon
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Salary List',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20.0,
                                      left: 20,
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(16.0),
                                            ),
                                          ),
                                          builder: (context) =>
                                              const SalaryPopup(),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              4.0), // Rounded corners
                                        ),
                                        backgroundColor: Colors
                                            .green, // Button background color
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              // Salary List Table
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: SalaryListTable(),
                                ), // Add the SalaryListTable widget here
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Sidebar (for mobile and tablet)
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
}
