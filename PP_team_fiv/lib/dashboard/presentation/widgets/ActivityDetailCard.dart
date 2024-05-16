import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../data/quick_info_data.dart';
import 'custom_card_widget.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final healthDetails = HealthDetails();
    return GridView.builder(
      itemCount: healthDetails.healthData.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 1.0,
        // Responsive.isMobile(context) ? 2 : 4,
        // crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
      ),
      itemBuilder: (context, index) => CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              healthDetails.healthData[index].title,
              style: TextStyle(
                // fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Color(0xFF0B054C),
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                CircleAvatar(
                  backgroundColor: healthDetails.healthData[index].color,
                  radius: 30.0,
                  child: SizedBox(
                    child: healthDetails.healthData[index].icon,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 24),
                  child: Text(
                    healthDetails.healthData[index].value,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 38.0,
                      color: Color(0xFF0B054C),
                    ),
                  ),
                ),
              ],
            ),
            Link(
              uri: Uri.parse('www.youtube.com'),
              builder: (context, followLink) => Text(
                "Show Details",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
