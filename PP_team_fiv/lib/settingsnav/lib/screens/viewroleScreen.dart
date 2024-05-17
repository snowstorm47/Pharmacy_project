import 'package:flutter/material.dart';
import 'package:settingsnav/widgets/side_menu_widget.dart';
import '../const/constant.dart';
import 'package:flutter/src/material/colors.dart';

class ViewRoleScreen extends StatelessWidget {
  const ViewRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                child: Sidemenuwidget(),
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
            color: Color(0xFF7193E9),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Employee Name',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Role',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Permitted Actions',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                        child: Text(
                          'System Access',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
