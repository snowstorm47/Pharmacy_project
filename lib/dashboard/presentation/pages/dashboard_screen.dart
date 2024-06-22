 import 'package:clean_a/dashboard/presentation/widgets/activity_detail_page.dart';
import 'package:clean_a/shared/utility/responsive.dart';
import 'package:flutter/material.dart';

 

 class DashBoardScreen extends StatelessWidget {
   const DashBoardScreen({super.key});

   @override
   Widget build(BuildContext context) {
final responsive = Responsive(context); // Create an instance of Responsive class
    final isDesktop = responsive.isDesktop; //

     return Scaffold(
       appBar: AppBar(),
       drawer: !isDesktop
           ? Expanded(flex: 2, child: Container(color: Colors.grey))
           : null,
      body: SafeArea(
        child: Row(
          children: <Widget>[
             if (isDesktop)
              Expanded(
                flex: 2,
                child: Container(color: Colors.grey),
               ),
             Expanded(
                 flex: 10,
                 child: Container(
                   color: Colors.white,
                   child: const ActivityDetailsCard(),
                 )),
           ],
         ),
       ),
     );
   }
 }
