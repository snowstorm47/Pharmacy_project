import 'package:clean_a/dashboard/presentation/widgets/ActivityDetailCard.dart';
import 'package:clean_a/dashboard/presentation/widgets/piechart_widget.dart';
import 'package:flutter/material.dart';

import 'package:clean_a/dashboard/presentation/widgets/barchart_widget.dart';
import 'package:clean_a/dashboard/presentation/pages/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';

// Import your new chart widget
// Import the ActivityDetailsCard widget

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
                      onClose: () {},
                    ),
                  ),
                // Main content
                Expanded(
                  flex: 4, // Adjust flex ratio as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      const Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              Text(
                                'Dashboard',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 16),
                              // Integrate the ActivityDetailsCard widget instead of CardsPlaceholder
                              ActivityDetailsCard(),
                              SizedBox(height: 16),
                              // Responsive layout for graph and pie chart placeholders
                              ResponsiveLayout(),
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

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key});

  @override
  Widget build(BuildContext context) {
    final sampleData = MonthlyDataChart.createSampleData();
    final pieChartData = {
      'Branch A': 34.0,
      'Branch B': 32.0,
      'Branch C': 26.0,
      'Branch D': 28.0,
      'Branch E': 30.0,
    };

    if (ResponsiveD.isDesktop(context)) {
      return Row(
        children: [
          Expanded(child: MonthlyDataChart(seriesList: sampleData)),
          const SizedBox(width: 16),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Pie_chart(dataMap: pieChartData),
          )),
        ],
      );
    } else {
      return Column(
        children: [
          MonthlyDataChart(seriesList: sampleData),
          const SizedBox(height: 16),
          Pie_chart(dataMap: pieChartData),
        ],
      );
    }
  }
}
