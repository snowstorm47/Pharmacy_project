import 'package:clean_a/employee/presentation/Componet/EmployeeProfile/add_employee_popup.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/employee/presentation/Componet/EmployeeProfile/employee_profile_table.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';

class EmployeeProfilePage extends StatefulWidget {
  const EmployeeProfilePage({super.key});

  @override
  _EmployeeProfilePageState createState() => _EmployeeProfilePageState();
}

class _EmployeeProfilePageState extends State<EmployeeProfilePage> {
  bool showSideMenu = false;

  final List<Map<String, String>> employees = [
    {
      'name': 'John Doe',
      'position': 'Pharmacist',
      'address': '123 Main St',
      'location': 'City, Country',
      'phone': '+1234567890',
      'email': 'john@example.com',
    },
    {
      'name': 'Alice Smith',
      'position': 'Assistant Pharmacist',
      'address': '456 Elm St',
      'location': 'Town, Country',
      'phone': '+0987654321',
      'email': 'alice@example.com',
    },
    {
      'name': 'Bob Johnson',
      'position': 'Technician',
      'address': '789 Pine St',
      'location': 'Village, Country',
      'phone': '+1122334455',
      'email': 'bob@example.com',
    },
    // Add more employees here
  ];

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderPage(
                        onMenuPressed: () {
                          setState(() {
                            showSideMenu = !showSideMenu;
                          });
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Employee Profiles',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                // Handle add employee action
                                showDialog<Map<String, String>>(
                                  context: context,
                                  builder: (context) =>
                                      const AddEmployeePopup(),
                                ).then((newEmployee) {
                                  if (newEmployee != null) {
                                    setState(() {
                                      employees.add(newEmployee);
                                    });
                                  }
                                });
                              },
                              child: const Text(
                                'Add Employee',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Responsive layout for employee profiles
                      Expanded(
                        child: ResponsiveD(
                          mobile: SingleChildScrollView(
                            child: EmployeeProfileTable(employees: employees),
                          ),
                          tablet: SingleChildScrollView(
                            child: EmployeeProfileTable(employees: employees),
                          ),
                          desktop: SingleChildScrollView(
                            child: EmployeeProfileTable(employees: employees),
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
