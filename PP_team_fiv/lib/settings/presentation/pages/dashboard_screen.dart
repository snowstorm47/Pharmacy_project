import 'package:flutter/material.dart';
import 'package:clean_a/settings/presentation/pages/AddRoleScreen.dart';

class DashBoardScreenn extends StatelessWidget {
  const DashBoardScreenn({super.key});

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
