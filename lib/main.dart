import 'package:clean_a/customer/model/providerC.dart';
import 'package:clean_a/medicine/presentation/widgets/add_medicine.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_a/navigationprov.dart'; // Adjust the path as per your project structure
import 'package:clean_a/dashboard/presentation/pages/dashboard_screen.dart'; // Adjust the path as per your project structure
import 'package:clean_a/Drawer/sidemenupage.dart'; // Adjust the path as per your project structure
import 'package:clean_a/medicine/model/providerM.dart'; // Adjust the path as per your project structure
//import 'package:clean_a/medicine/presentation/add_med_screen.dart'; // Adjust the path as per your project structure
//import 'package:clean_a/medicine/presentation/medicine_detail_screen.dart'; // Adjust the path as per your project structure

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        // Add more providers as needed
        ChangeNotifierProvider(create: (_) => MedicineProvider()), // Added MedicineProvider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Consumer<NavigationProvider>(
        builder: (context, navigationProvider, child) {
          return navigationProvider.currentScreen;
        },
      ),
     // drawer: SideMenu(onClose: () {  },),
      
    );
  }
}
