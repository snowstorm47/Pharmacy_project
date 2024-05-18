import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viewrolespage/constants.dart';
import 'package:viewrolespage/util/my_tile.dart';
import 'package:viewrolespage/util/my_box.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Column(
        children: [
          // 4 boxes at the top
          AspectRatio(
            aspectRatio: 1,
            child: SizedBox(
              width: double.infinity,
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return MyBox();
                },
              ),
            ),
          ),

          // tiles below it
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Specify the number of tiles here
              itemBuilder: (context, index) {
                return const MyTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}