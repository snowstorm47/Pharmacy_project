import 'package:flutter/material.dart';

var myDefaultBackground = Colors.white;

var myAppBar = AppBar(
  backgroundColor: Colors.white,
  title: Container(
    width: double.infinity,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    ),
  ),
);

var myDrawer = Drawer(
  backgroundColor: Colors.white,
  child: SingleChildScrollView(
    child: Column(
      children: const [
        DrawerHeader(
          child: Row(
            children: [
              Icon(Icons.medication_liquid),
              Text(
                "Pharmacy Hub",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF0B054C),
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.dashboard,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "D a s h b o a r d",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.people,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "C u s t o m e r",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.medication_liquid,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "M e d i c i n e",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.shopping_cart,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "S a l e s",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.storage,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "S t o c k",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.newspaper,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "R e p o r t s",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.store,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "S u p p l i e r",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.account_tree,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "B r a n c h e s",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.recycling,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "R e t u r n",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.work,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "E m p l o y e e",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.money,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "F i n a n c e",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Color(0xFF0B054C),
          ),
          title: Text(
            "S e t t i n g s",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B054C),
            ),
          ),
        ),
      ],
    ),
  ),
);
