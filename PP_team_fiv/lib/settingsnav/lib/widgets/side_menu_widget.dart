import 'package:flutter/material.dart';
import '../data/side_menu_data.dart';
import 'package:settingsnav/const/constant.dart';

class Sidemenuwidget extends StatefulWidget {
  const Sidemenuwidget({super.key});

  @override
  State<Sidemenuwidget> createState() => _SidemenuwidgetState();
}

class _SidemenuwidgetState extends State<Sidemenuwidget> {
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      child: ListView.builder(
        itemCount: data.menu.length,
          itemBuilder: (context, index) => buildMenuEntry(data, index),
      ),
    );
  }
  Widget buildMenuEntry(SideMenuData data, int index){
    return Row(
      children: [
        Icon(
            data.menu[index].icon,
          color: Colors.blue,
        ),
        Text(
            data.menu[index].title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );

  }
}
