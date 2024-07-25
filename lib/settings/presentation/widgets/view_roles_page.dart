import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/employee/provider/employee_provider.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// Import your file paths for EmployeeProvider, etc.

class ViewRolesPage extends StatefulWidget {
  const ViewRolesPage({super.key});

  @override
  State<ViewRolesPage> createState() => _ViewRolesPageState();
}

class _ViewRolesPageState extends State<ViewRolesPage> {
  bool showSideMenu = false;
  bool isLoading = true;
  List<bool> checkboxValues = List<bool>.generate(7, (index) => false);

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
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(16.0),
                          children: [
                            const Text(
                              'View Roles',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Edit, Update and Remove roles',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search...',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // Add filter functionality here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    icon: const Icon(Icons.filter_list, color: Colors.white),
                                    label: const Text('Filter By', style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                                child: DataTable(
                                  columnSpacing: 20.0,
                                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                                  dividerThickness: 0,
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text('No', style: TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Employee Name', style: TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Role', style: TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Permitted Action', style: TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('System Access', style: TextStyle(color: Colors.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Actions', style: TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    employees!.length,
                                    (index) => DataRow(
                                      color: MaterialStateColor.resolveWith((states) {
                                        return index % 2 == 0 ? Colors.grey[200]! : Colors.white;
                                      }),
                                      cells: <DataCell>[
                                        DataCell(
                                          Checkbox(
                                            value: checkboxValues[index],
                                            onChanged: (value) {
                                              setState(() {
                                                checkboxValues[index] = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        DataCell(Text(employees[index].FirstName)),
                                        DataCell(Text(employees[index].LastName)),
                                        DataCell(
                                          SingleChildScrollView(
                                           scrollDirection:Axis.vertical,     
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: employees[index].permission.map((action) => Text(action)).toList(),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          SingleChildScrollView(
                                            scrollDirection:Axis.vertical, 
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: employees[index].access.map((access) => Text(access)).toList(),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  // Handle edit action
                                                  
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () {
                                                  // Handle delete action
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to previous page
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFF1EFEF),
                                  ),
                                  child: const Text(
                                    'prev',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to page 1
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFF1EFEF),
                                  ),
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to page 2
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFF1EFEF),
                                  ),
                                  child: const Text(
                                    '2',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to page 3
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFF1EFEF),
                                  ),
                                  child: const Text(
                                    '3',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to next page
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFF1EFEF),
                                  ),
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                color: const Color(0xFFF1EFEF),
                                child: const Text(
                                  'Page 1/22',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
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
