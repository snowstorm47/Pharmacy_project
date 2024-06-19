import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';

class AddAuthorizedUser extends StatefulWidget {
  const AddAuthorizedUser({super.key});

  @override
  State<AddAuthorizedUser> createState() => _AddAuthorizedUserState();
}

class _AddAuthorizedUserState extends State<AddAuthorizedUser> {
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          child: SingleChildScrollView(
                            child: isMobile
                                ? buildMobileLayout()
                                : buildDesktopLayout(),
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

  Widget buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add authorized User',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'You can add your new authorized user information here',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        const SizedBox(height: 20),
        buildTextFieldsColumn(),
        const SizedBox(height: 20),
        buildDescriptionAndButton(),
      ],
    );
  }

  Widget buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add authorized User',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'You can add your new authorized user information here',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        const SizedBox(height: 20),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Column
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Employee Name',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Role/position',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20), // Space between columns

            // Second Column
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'City',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Employee Id',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20), // Space between columns

            // Third Column
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Sub City',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Company Name',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        buildDescriptionAndButton(),
      ],
    );
  }

  Widget buildTextFieldsColumn() {
    return const Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Employee Name',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Address',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Role/position',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone number',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'City',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Employee Id',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Sub City',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Company Name',
          ),
        ),
      ],
    );
  }

  Widget buildDescriptionAndButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextField(
          maxLines: 5,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter additional description here...',
          ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: const Color.fromARGB(236, 27, 228, 4),
              minimumSize: const Size(130, 40),
            ),
            onPressed: () {
              // Add button action
            },
            child: const Text(
              'Add User',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
