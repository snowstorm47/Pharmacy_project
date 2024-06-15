import 'package:flutter/material.dart';

class SideMenuPagenew extends StatefulWidget {
  const SideMenuPagenew({super.key});

  @override
  State<SideMenuPagenew> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPagenew> {
  bool showSideMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar background color
        title:
            const Text("Pharmacy Hub", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            setState(() {
              showSideMenu = !showSideMenu; // Toggle showSideMenu value
            });
          },
        ),
      ),
      body: SafeArea(
        child: showSideMenu
            ? Drawer(
                backgroundColor:
                    Colors.white, // Set Drawer background color to white
                child: SideMenu(),
              )
            : Container(),
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white, // Set DrawerHeader background color to white
          ),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/download.jpg"),
              ),
              SizedBox(height: 10),
              Text("Pharmacy Hub"),
            ],
          ),
        ),
        ListTile(
          title: const Text('Dashboard'),
          leading: const Icon(Icons.dashboard, color: Colors.black),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Customer'),
          leading: const Icon(Icons.person, color: Colors.black),
          onTap: () {},
        ),
        // Add more ListTiles here as needed
      ],
    );
  }
}
