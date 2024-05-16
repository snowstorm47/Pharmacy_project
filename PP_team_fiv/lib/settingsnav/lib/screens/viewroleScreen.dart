import 'package:flutter/material.dart';
import 'package:settingsnav/widgets/side_menu_widget.dart';

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
              flex: 7,
              child: Container(color: Colors.blue),
            ),
            Expanded(
              flex: 3,
              child: Container(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
