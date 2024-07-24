

import 'package:clean_a/main.dart';
import 'package:clean_a/shared/services/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sign_in/sign_in_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<Authprovider>(context,listen:false).user;
     if(user!=null){
       switch(user.role!.toLowerCase()){
        case 'admin':
             return const HomeScreen();
        case 'pharmacist':
           return const PharmacistScreen();
        case 'cashier':
           return const CashierScreen();
         default:
          return const MySignInPage();
       }
     }
     else{
      return const MySignInPage();
     }
  }
}