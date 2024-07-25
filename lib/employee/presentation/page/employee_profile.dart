import 'package:clean_a/employee/domain/entities/employee.dart';
import 'package:clean_a/employee/presentation/Componet/EmployeeProfile/add_employee_popup.dart';
import 'package:clean_a/employee/presentation/Componet/EmployeeProfile/delete_employee_popup.dart';
import 'package:clean_a/employee/presentation/Componet/EmployeeProfile/edit_employee_popup.dart';
import 'package:clean_a/employee/provider/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/employee/presentation/Componet/EmployeeProfile/employee_profile_table.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:provider/provider.dart';

class EmployeeProfilePage extends StatefulWidget {
  const EmployeeProfilePage({super.key});

  @override
  EmployeeProfilePageState createState() => EmployeeProfilePageState();
}

class EmployeeProfilePageState extends State<EmployeeProfilePage> {
  bool showSideMenu = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchEmployees();
  }

  Future<void> _fetchEmployees() async {
    final employeeProvider = Provider.of<EmployeeProvider>(context, listen: false);
    await employeeProvider.getEmployees();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmployeeProvider>(context);
    final employees = provider.employee;

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
                                showDialog(
                                  context: context,
                                  builder: (context) => const AddEmployeePopup(),
                                );
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
                      isLoading
                          ? Center(child: CircularProgressIndicator())
                          : employees!.isEmpty
                              ? Center(child: Text("Add Employee to see"))
                              : Expanded(
                                  child: ResponsiveD(
                                    mobile: SingleChildScrollView(
                                      child: EmployeeProfileTable(
                                        employees: employees,
                                        onEditEmployee: (index) async {
                                          final editedEmployee = await showDialog<Employee>(
                                            context: context,
                                            builder: (context) => EditEmployeePopup(employee: employees[index]),
                                          );

                                          if (editedEmployee != null) {
                                            provider.editEmployee(employees[index].uid, updatedData:editedEmployee.toMap());
                                          }
                                        },
                                        onDeleteEmployee: (index) async {
                                          final shouldDelete = await showDialog<bool>(
                                            context: context,
                                            builder: (context) => DeleteEmployeePopup(
                                              lastName: employees[index].LastName,
                                              employeeName: employees[index].FirstName ?? '',
                                              uid: employees[index].uid,
                                            ),
                                          );

                                          if (shouldDelete == true) {
                                            provider.removeEmployee(employees[index].uid);
                                          }
                                        },
                                      ),
                                    ),
                                    tablet: SingleChildScrollView(
                                      child: EmployeeProfileTable(
                                        employees: employees,
                                        onEditEmployee: (index) async {
                                          final editedEmployee = await showDialog<Employee>(
                                            context: context,
                                            builder: (context) => EditEmployeePopup(employee: employees[index]),
                                          );

                                          if (editedEmployee != null) {
                                            provider.editEmployee(employees[index].uid, updatedData:editedEmployee.toMap());
                                          }
                                        },
                                        onDeleteEmployee: (index) async {
                                          final shouldDelete = await showDialog<bool>(
                                            context: context,
                                            builder: (context) => DeleteEmployeePopup(
                                              lastName: employees[index].LastName,
                                              employeeName: employees[index].FirstName ?? '',
                                              uid: employees[index].uid,
                                            ),
                                          );

                                          if (shouldDelete == true) {
                                            provider.removeEmployee(employees[index].uid);
                                          }
                                        },
                                      ),
                                    ),
                                    desktop: SingleChildScrollView(
                                      child: EmployeeProfileTable(
                                        employees: employees,
                                        onEditEmployee: (index) async {
                                          final editedEmployee = await showDialog<Employee>(
                                            context: context,
                                            builder: (context) => EditEmployeePopup(employee: employees[index]),
                                          );

                                          if (editedEmployee != null) {
                                            provider.editEmployee(employees[index].uid, updatedData:editedEmployee.toMap());
                                          }
                                        },
                                        onDeleteEmployee: (index) async {
                                          final shouldDelete = await showDialog<bool>(
                                            context: context,
                                            builder: (context) => DeleteEmployeePopup(
                                              lastName: employees[index].LastName,
                                              employeeName: employees[index].FirstName ?? '',
                                              uid: employees[index].uid,
                                            ),
                                          );

                                          if (shouldDelete == true) {
                                            provider.removeEmployee(employees[index].uid);
                                          }
                                        },
                                      ),
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
