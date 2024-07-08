import 'package:clean_a/Drawer/data.dart';
import 'package:clean_a/customer/Presentation/pages/add_authorized_user.dart';
import 'package:clean_a/customer/Presentation/pages/authorized_user_list.dart';
import 'package:clean_a/medicine/presentation/pages/medicine_detail.dart';
import 'package:clean_a/sales/presentation/widgets/sales.dart';
import 'package:clean_a/sales/presentation/widgets/screen/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/dashboard/presentation/pages/dashboard_screen.dart';

import 'package:clean_a/customer/Presentation/pages/add_authorized_company.dart';

class NavigationProvider extends ChangeNotifier {
  Widget _currentScreen = const DashboardPage();

  Widget get currentScreen => _currentScreen;

  void navigateTo(String route) {
    switch (route) {
      case '/dashboard':
        _currentScreen = const DashboardPage();
        break;
      case '/customer/add_authorized_user':
        _currentScreen = const AddAuthorizedUser();
        break;
         case '/customer/authorized_user_list':
        _currentScreen = const AuthorizedUser();
        break;
      case '/customer/add_authorized_company':
        _currentScreen = const AddAuthorizedCompany();
        break;
        //medicine
case '/medicine/medicine_list':
        _currentScreen = MedicineDetail();
        break;
        //sales
case '/sales/sales report':
        _currentScreen = Sales();
        break;

      default:
        _currentScreen = const DashboardPage(); // Default to dashboard if route not found
        break;
    }
    notifyListeners();
  }
}
