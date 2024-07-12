import 'package:clean_a/Cashier/navigation_provider.dart';
import 'package:clean_a/Pharmacist/navigation_provider.dart';
import 'package:clean_a/customer/model/providerC.dart';
import 'package:clean_a/dummy/register.dart';
import 'package:clean_a/medicine/presentation/widgets/add_medicine.dart';
import 'package:clean_a/shared/services/providers/authProvider.dart';
import 'package:clean_a/shared/services/providers/registrationProvider.dart';
import 'package:clean_a/sign_in/reset_password_otp.dart';
import 'package:clean_a/sign_in/sign_in_page.dart';
import 'package:clean_a/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_a/navigationprov.dart'; // Adjust the path as per your project structure
import 'package:clean_a/dashboard/presentation/pages/dashboard_screen.dart'; // Adjust the path as per your project structure
import 'package:clean_a/Drawer/sidemenupage.dart'; // Adjust the path as per your project structure
import 'package:clean_a/medicine/model/providerM.dart'; // Adjust the path as per your project structure
//import 'package:clean_a/medicine/presentation/add_med_screen.dart'; // Adjust the path as per your project structure
//import 'package:clean_a/medicine/presentation/medicine_detail_screen.dart'; // Adjust the path as per your project structure
import 'package:firebase_core/firebase_core.dart';
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(   
    apiKey: "AIzaSyCvx38ISXmxYet79jWcDr3vobNqLzpF7tk",
    authDomain: "pharmacyproj-b7ad8.firebaseapp.com",
    projectId: "pharmacyproj-b7ad8",
    storageBucket: "pharmacyproj-b7ad8.appspot.com",
    messagingSenderId: "142915038111",
    appId: "1:142915038111:web:93d5506d1097e77dc96baa",
    measurementId: "G-1GVVPRC6MV")
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(create:(_)=>NavigationProvider()),
         ChangeNotifierProvider<CashierProvider>(create:(_)=>CashierProvider()),
          ChangeNotifierProvider<PharmacistProvider>(create:(_)=>PharmacistProvider()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<MedicineProvider>(create: (_) => MedicineProvider()),
        ChangeNotifierProvider<Authprovider>(create:(_) => Authprovider()), 
        ChangeNotifierProvider<imageProvider>(create:(_)=> imageProvider()),
        ChangeNotifierProvider<registrationProvider>(create:(_)=>registrationProvider())// Added MedicineProvider
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
      initialRoute:'/',
      routes:{   
        // '/register':(context)=> const RegisterView(),
        '/signin':(context) => const MySignInPage(),
        '/resetPassword':(context) => const ResetPasswordOtp(),
         '/home':(context)=> const Wrapper(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     home:  const MySignInPage(),
    //  const RegisterView()     
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

class CashierScreen extends StatelessWidget {
  const CashierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Consumer<CashierProvider>(
        builder: (context, cashierProvider, child) {
          return cashierProvider.currentScreen;
        },
      ),
     // drawer: SideMenu(onClose: () {  },),
      
    );
  }
}

class PharmacistScreen extends StatelessWidget {
  const PharmacistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Consumer<PharmacistProvider>(
        builder: (context, pharmacistProvider, child) {
          return pharmacistProvider.currentScreen;
        },
      ),
     // drawer: SideMenu(onClose: () {  },),
      
    );
  }
}