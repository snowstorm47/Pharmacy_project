import 'package:flutter/material.dart';

import '../widgets/ActivityDetailCard.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

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
                child: Container(
                  child: ActivityDetailsCard(),
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
