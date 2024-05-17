import 'package:flutter/material.dart';

class AddRoleScreen extends StatelessWidget {
  const AddRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Text(
                "Add Role",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 30.0),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Text(
                "Add Role and Permisions For Employees",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 15.0),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 60.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Role Name',
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontFamily: 'Poppins',
            //             fontSize: 15.0),
            //       ),
            //       SizedBox(
            //         height: 20.0,
            //       ),
            //       TextField(
            //         maxLines: 1,
            //         decoration: InputDecoration(
            //           hintText: 'Role Name',
            //           border: OutlineInputBorder(),
            //         ),
            //       ),
            //       /*Permited action*/
            //       Text(
            //         'Permited Action',
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontFamily: 'Poppins',
            //             fontSize: 15.0),
            //       ),
            //       SizedBox(
            //         height: 20.0,
            //       ),
            //       TextField(
            //         maxLines: 1,
            //         decoration: InputDecoration(
            //           hintText: 'Permited Action',
            //           border: OutlineInputBorder(),
            //         ),
            //       ),
            //
            //       /*Assigned Staff*/
            //       Text(
            //         'Assigned Staff',
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontFamily: 'Poppins',
            //             fontSize: 15.0),
            //       ),
            //       SizedBox(
            //         height: 20.0,
            //       ),
            //       TextField(
            //         maxLines: 1,
            //         decoration: InputDecoration(
            //           hintText: 'Assigned Staff',
            //           border: OutlineInputBorder(),
            //         ),
            //       ),
            //
            //       /*System Access*/
            //       Text(
            //         'System Access',
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontFamily: 'Poppins',
            //             fontSize: 15.0),
            //       ),
            //       SizedBox(
            //         height: 20.0,
            //       ),
            //       TextField(
            //         maxLines: 1,
            //         decoration: InputDecoration(
            //           hintText: 'System Access',
            //           border: OutlineInputBorder(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 1.0,
                // Responsive.isMobile(context) ? 2 : 4,
                // crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
              ),
              itemBuilder: (context, index) => Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Role Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Role Name',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    /*Permited action*/
                    Text(
                      'Permited Action',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Permited Action',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    /*Assigned Staff*/
                    Text(
                      'Assigned Staff',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Assigned Staff',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    /*System Access*/
                    Text(
                      'System Access',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'System Access',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
