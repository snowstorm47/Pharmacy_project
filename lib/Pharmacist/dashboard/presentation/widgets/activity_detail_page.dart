// import 'package:flutter/material.dart';
// import '../../data/quick_info_data.dart';
// import 'package:clean_a/shared/utility/responsiveDrawer.dart';
// import 'custom_card_widget.dart';

// class ActivityDetailsCard extends StatelessWidget {
//   const ActivityDetailsCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final healthDetails = HealthDetails();

//     int crossAxisCount;
//     double crossAxisSpacing;
//     double mainAxisSpacing;
//     double mainAxisExtent;

//     if (ResponsiveD.isDesktop(context)) {
//       crossAxisCount = 4;
//       crossAxisSpacing = 15.0;
//       mainAxisSpacing = 15.0;
//       mainAxisExtent = 200.0;
//     } else if (ResponsiveD.isTablet(context)) {
//       crossAxisCount = 3;
//       crossAxisSpacing = 12.0;
//       mainAxisSpacing = 12.0;
//       mainAxisExtent = 180.0;
//     } else {
//       crossAxisCount = 2;
//       crossAxisSpacing = 10.0;
//       mainAxisSpacing = 10.0;
//       mainAxisExtent = 160.0;
//     }

//     return GridView.builder(
//       itemCount: healthDetails.healthData.length,
//       shrinkWrap: true,
//       physics: const ScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: crossAxisCount,
//         crossAxisSpacing: crossAxisSpacing,
//         mainAxisSpacing: mainAxisSpacing,
//         mainAxisExtent: mainAxisExtent,
//       ),
//       itemBuilder: (context, index) => CustomCard(
//         color: Colors.white,
//         padding: const EdgeInsets.all(10.0),
//         title: '',
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               healthDetails.healthData[index].title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 18.0,
//                 color: Color(0xFF0B054C),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundColor: healthDetails.healthData[index].color,
//                   radius: 20.0,
//                   child: SizedBox(
//                     width: 30.0,
//                     height: 30.0,
//                     child: healthDetails.healthData[index].icon,
//                   ),
//                 ),
//                 const SizedBox(width: 10.0),
//                 Text(
//                   healthDetails.healthData[index].value,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20.0,
//                     color: Color(0xFF0B054C),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10.0),
//             GestureDetector(
//               onTap: () {
//                 // Add your action here
//                 print('Show Details clicked for index $index');
//               },
//               child: const Text(
//                 "Show Details",
//                 style: TextStyle(
//                   fontSize: 13.0,
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
