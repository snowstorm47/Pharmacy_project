import 'package:flutter/material.dart';
import '../../data/quick_info_data.dart';
import '../../responsive/responsive.dart';
import 'custom_card_widget.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({Key? key});

  @override
  Widget build(BuildContext context) {
    final healthDetails = HealthDetails();
    return GridView.builder(
      itemCount: healthDetails.healthData.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context, context) ? 2 : 4,
        crossAxisSpacing: Responsive.isMobile(context, context) ? 12.0 : 15.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent:
            200.0, // Adjust this value to set the height of each card
      ),
      itemBuilder: (context, index) => CustomCard(
        color: Colors.white,
        padding: EdgeInsets.all(10.0), // Set background color to white
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              healthDetails.healthData[index].title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize:
                    18.0, // Adjusted font size to fit within the card height
                color: Color(0xFF0B054C),
              ),
            ),
            SizedBox(height: 10.0), // Add some space between title and icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: healthDetails.healthData[index].color,
                  radius: 20.0, // Adjusted radius to fit within the card height
                  child: SizedBox(
                    child: healthDetails.healthData[index].icon,
                    width: 30.0, // Adjusted size to fit within the card height
                    height: 30.0,
                  ),
                ),
                SizedBox(width: 10.0), // Add space between icon and value
                Text(
                  healthDetails.healthData[index].value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize:
                        20.0, // Adjusted font size to fit within the card height
                    color: Color(0xFF0B054C),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0), // Add some space between icon and button
            GestureDetector(
              onTap: () {
                // Add your action here
                print('Show Details clicked for index $index');
              },
              child: const Text(
                "Show Details",
                style: TextStyle(
                  fontSize:
                      13.0, // Adjusted font size to fit within the card height
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
