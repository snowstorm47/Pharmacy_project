import 'package:clean_a/employee/presentation/utility/Finger_print.dart';
import 'package:clean_a/employee/presentation/Componet/attendance/attendance_form.dart';
import 'package:clean_a/employee/presentation/Componet/attendance/attendance_table.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  AttendancePageState createState() => AttendancePageState();
}

class AttendancePageState extends State<AttendancePage> {
  bool showSideMenu = false;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _signInController = TextEditingController();
  final TextEditingController _signOutController = TextEditingController();

  void _showFingerprintDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const FingerprintDialog();
      },
    );
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Row with Attendance Text and Fingerprint Icon
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Attendance',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 20),
                                    child: GestureDetector(
                                      onTap: _showFingerprintDialog,
                                      child: const Icon(Icons.fingerprint,
                                          size: 30),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Text fields layout
                              if (ResponsiveD.isMobile(context))
                                AttendanceForm(
                                  dateController: _dateController,
                                  signInController: _signInController,
                                  signOutController: _signOutController,
                                  onTapSignIn: () {
                                    _selectTime(context, _signInController);
                                  },
                                  onTapSignOut: () {
                                    _selectTime(context, _signOutController);
                                  },
                                )
                              else
                                AttendanceForm(
                                  dateController: _dateController,
                                  signInController: _signInController,
                                  signOutController: _signOutController,
                                  onTapSignIn: () {
                                    _selectTime(context, _signInController);
                                  },
                                  onTapSignOut: () {
                                    _selectTime(context, _signOutController);
                                  },
                                ),
                              const SizedBox(height: 20),
                              // Save and Cancel buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle save functionality
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                    child: const Text('Save',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  const SizedBox(width: 30),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle cancel functionality
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Centered Table
                              AttendanceTable(),
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
