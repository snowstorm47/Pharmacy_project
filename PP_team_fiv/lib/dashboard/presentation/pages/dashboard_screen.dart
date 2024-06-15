import 'package:flutter/material.dart';

import '../../responsive/responsive.dart';
import '../widgets/ActivityDetailCard.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context, context);

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
