import 'package:flutter/material.dart';

import 'ActivityDetailCard.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        // const SizedBox(height: 18),
        const ActivityDetailsCard(),
      ],
    );
  }
}
