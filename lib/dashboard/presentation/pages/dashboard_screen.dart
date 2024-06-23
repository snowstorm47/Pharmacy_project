// ignore_for_file: avoid_print

import 'package:clean_a/dashboard/presentation/widgets/barchart_widget.dart';
import 'package:clean_a/dashboard/presentation/widgets/custom_card_widget.dart';
import 'package:clean_a/dashboard/presentation/widgets/piechart_widget.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F0),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeaderPage(
                        onMenuPressed: () {
                          setState(() {
                            showSideMenu = !showSideMenu;
                          });
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      if (ResponsiveD.isDesktop(context)) ...[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomCard(
                                              backgroundColor: Colors.blue,
                                              iconData: Icons.local_pharmacy,
                                              title: 'Total Medicine',
                                              number: '1500',
                                              onTap: () {
                                                // Handle onTap
                                                print('Total Medicine tapped');
                                              },
                                            ),
                                            CustomCard(
                                              backgroundColor: Colors.green,
                                              iconData: Icons.attach_money,
                                              title: 'Total Sale',
                                              number: '1200',
                                              onTap: () {
                                                // Handle onTap
                                                print('Total Sale tapped');
                                              },
                                            ),
                                            CustomCard(
                                              backgroundColor: Colors.red,
                                              iconData: Icons.warning,
                                              title: 'Expired Medicine',
                                              number: '200',
                                              onTap: () {
                                                // Handle onTap
                                                print(
                                                    'Expired Medicine tapped');
                                              },
                                            ),
                                            CustomCard(
                                              backgroundColor: Colors.orange,
                                              iconData: Icons.store,
                                              title: 'Out of Stock',
                                              number: '50',
                                              onTap: () {
                                                // Handle onTap
                                                print('Out of Stock tapped');
                                              },
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            MonthlyDataChart(
                                              seriesList: MonthlyDataChart
                                                  .createSampleData(),
                                            ),
                                            const Piechart(
                                              dataMap: {
                                                'Branch A': 40,
                                                'Branch B': 30,
                                                'Branch C': 20,
                                                'Branch D': 10,
                                              },
                                            ),
                                          ],
                                        ),
                                      ] else ...[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomCard(
                                              backgroundColor: Colors.blue,
                                              iconData: Icons.local_pharmacy,
                                              title: 'Total Medicine',
                                              number: '1500',
                                              onTap: () {
                                                // Handle onTap
                                                print('Total Medicine tapped');
                                              },
                                            ),
                                            CustomCard(
                                              backgroundColor: Colors.green,
                                              iconData: Icons.attach_money,
                                              title: 'Total Sale',
                                              number: '1200',
                                              onTap: () {
                                                // Handle onTap
                                                print('Total Sale tapped');
                                              },
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomCard(
                                              backgroundColor: Colors.red,
                                              iconData: Icons.warning,
                                              title: 'Expired Medicine',
                                              number: '200',
                                              onTap: () {
                                                // Handle onTap
                                                print(
                                                    'Expired Medicine tapped');
                                              },
                                            ),
                                            CustomCard(
                                              backgroundColor: Colors.orange,
                                              iconData: Icons.store,
                                              title: 'Out of Stock',
                                              number: '50',
                                              onTap: () {
                                                // Handle onTap
                                                print('Out of Stock tapped');
                                              },
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        MonthlyDataChart(
                                          seriesList: MonthlyDataChart
                                              .createSampleData(),
                                        ),
                                        const SizedBox(height: 20),
                                        const Piechart(
                                          dataMap: {
                                            'Branch A': 40,
                                            'Branch B': 30,
                                            'Branch C': 20,
                                            'Branch D': 10,
                                          },
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
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
