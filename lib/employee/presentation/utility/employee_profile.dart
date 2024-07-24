// import 'package:flutter/material.dart';
// import 'package:clean_a/dashboard/presentation/pages/sidemenupage.dart';
// import 'package:clean_a/dashboard/presentation/pages/header.dart';
// import 'package:clean_a/shared/utility/responsiveDrawer.dart';

// class EmployeeProfilePage extends StatefulWidget {
//   const EmployeeProfilePage({super.key});

//   @override
//   EmployeeProfilePageState createState() => EmployeeProfilePageState();
// }

// class EmployeeProfilePageState extends State<EmployeeProfilePage> {
//   bool showSideMenu = false;

//   final List<Map<String, String>> employees = [
//     {
//       'name': 'John Doe',
//       'position': 'Pharmacist',
//       'address': '123 Main St',
//       'location': 'City, Country',
//       'phone': '+1234567890',
//       'email': 'john@example.com',
//       'avatar': 'assets/phas.jpg',
//     },
//     {
//       'name': 'Alice Smith',
//       'position': 'Assistant Pharmacist',
//       'address': '456 Elm St',
//       'location': 'Town, Country',
//       'phone': '+0987654321',
//       'email': 'alice@example.com',
//       'avatar': 'assets/phas.jpg',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF3F6F0),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Sidebar (only for desktop)
//                 if (ResponsiveD.isDesktop(context))
//                   Expanded(
//                     child: SideMenu(
//                       onClose: () {
//                         setState(() {
//                           showSideMenu = false;
//                         });
//                       },
//                     ),
//                   ),
//                 // Main content
//                 Expanded(
//                   flex: 4,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       HeaderPage(
//                         onMenuPressed: () {
//                           setState(() {
//                             showSideMenu = !showSideMenu;
//                           });
//                         },
//                         isSideMenuOpen: showSideMenu,
//                       ),
//                       const SizedBox(height: 20),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: Text(
//                           'Employee Profiles',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // Responsive layout for employee profiles
//                       Expanded(
//                         child: ResponsiveD(
//                           mobile: _buildMobileEmployeeProfiles(),
//                           tablet: _buildTabletEmployeeProfiles(),
//                           desktop: _buildDesktopEmployeeProfiles(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // Sidebar (for mobile and tablet)
//             if (!ResponsiveD.isDesktop(context) && showSideMenu)
//               Positioned(
//                 left: 0,
//                 top: 0,
//                 bottom: 0,
//                 child: SideMenu(
//                   onClose: () {
//                     setState(() {
//                       showSideMenu = false;
//                     });
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMobileEmployeeProfiles() {
//     return ListView(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 80,
//       ),
//       children: employees.map((employee) {
//         return _buildEmployeeProfile(employee);
//       }).toList(),
//     );
//   }

//   Widget _buildTabletEmployeeProfiles() {
//     return GridView.count(
//       padding: const EdgeInsets.symmetric(horizontal: 50),
//       crossAxisCount: 2,
//       childAspectRatio: 3 / 2,
//       children: employees.map((employee) {
//         return _buildEmployeeProfile(employee);
//       }).toList(),
//     );
//   }

//   Widget _buildDesktopEmployeeProfiles() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.symmetric(horizontal: 32),
//       child: GridView.count(
//         crossAxisCount: 3,
//         childAspectRatio: 4 / 4,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         children: employees.map((employee) {
//           return _buildEmployeeProfile(employee);
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildEmployeeProfile(Map<String, String> employee) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage:
//                         AssetImage(employee['avatar'] ?? 'assets/phas.jpg'),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     employee['name'] ?? '',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     employee['position'] ?? '',
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     employee['address'] ?? '',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     employee['location'] ?? '',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     employee['phone'] ?? '',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     employee['email'] ?? '',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Positioned(
//               top: 8,
//               right: 8,
//               child: Icon(Icons.more_vert),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
