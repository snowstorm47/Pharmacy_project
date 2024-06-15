import 'package:flutter/material.dart';

import 'AddNewCorporateCustomer.dart';

class DashBoardScreenCustomer extends StatelessWidget {
  const DashBoardScreenCustomer({super.key});

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
              child: AddNewCorporateCustomer(),
            ),
          ],
        ),
      ),
    );
  }
}
