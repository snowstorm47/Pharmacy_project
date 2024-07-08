
import 'package:clean_a/Cashier/pages/cashierPage.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/Manager/Presentation/pages/managerPage.dart';
import 'package:clean_a/Pharmacist/presentation/pages/pharmacist_page.dart';
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
          return const SideMenuPageSuper();
        case 'pharmacist':
           return const PharmacistView();
        case 'cashier':
           return const CashierView();
        case 'manager':
           return const ManagerView();
         default:
          return const MySignInPage();
       }
     }
     else{
      return const MySignInPage();
     }
  }
}