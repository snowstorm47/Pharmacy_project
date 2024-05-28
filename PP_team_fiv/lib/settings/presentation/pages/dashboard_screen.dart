import 'package:clean_a/settings/presentation/pages/AddRoleScreen.dart';
import 'package:flutter/material.dart';

class DashBoardScreensettings extends StatelessWidget {
  const DashBoardScreensettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(color: Colors.grey),
            ),
            Expanded(
              flex: 10,
              child: AddRole(),
            ),
          ],
        ),
      ),
    );
  }
}
