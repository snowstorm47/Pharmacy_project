import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PharmacyHub(),
      ),
    );
  }
}

class PharmacyHub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Sidebar(),
        Expanded(
          child: MainContent(),
        ),
      ],
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.blue[900],
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SidebarTile(icon: FontAwesomeIcons.tachometerAlt, title: 'Dashboard'),
                SidebarTile(icon: FontAwesomeIcons.users, title: 'Customer'),
                SidebarTile(icon: FontAwesomeIcons.pills, title: 'Medicine'),
                SidebarTile(icon: FontAwesomeIcons.chartLine, title: 'Sales'),
                SidebarTile(icon: FontAwesomeIcons.boxes, title: 'Stock'),
                SidebarTile(icon: FontAwesomeIcons.fileAlt, title: 'Reports'),
                SidebarTile(icon: FontAwesomeIcons.truck, title: 'Supplier'),
                SidebarTile(icon: FontAwesomeIcons.building, title: 'Branches'),
                SidebarTile(icon: FontAwesomeIcons.undo, title: 'Return'),
                SidebarTile(icon: FontAwesomeIcons.user, title: 'Employee'),
                SidebarTile(icon: FontAwesomeIcons.moneyBill, title: 'Finance'),
              ],
            ),
          ),
          Container(
            color: Colors.blue[700],
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(FontAwesomeIcons.cog, color: Colors.white),
                  title: Text('Settings', style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextButton(onPressed: () {}, child: Text('Add role', style: TextStyle(color: Colors.white))),
                      TextButton(onPressed: () {}, child: Text('View Role', style: TextStyle(color: Colors.white))),
                      TextButton(onPressed: () {}, child: Text('Password Reset', style: TextStyle(color: Colors.white))),
                      TextButton(onPressed: () {}, child: Text('Report Complaints', style: TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarTile extends StatelessWidget {
  final IconData icon;
  final String title;

  SidebarTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {},
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('View Roles', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Edit, Update and Remove Roles', style: TextStyle(color: Colors