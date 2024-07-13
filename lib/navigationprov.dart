import 'package:clean_a/Drawer/data.dart';
import 'package:clean_a/branch_M/presentation/pages/branch_list_page.dart';
import 'package:clean_a/branch_M/presentation/pages/branch_stock_page.dart';
import 'package:clean_a/branch_M/presentation/widgets/branch_list_widget.dart';
import 'package:clean_a/customer/Presentation/pages/add_authorized_user.dart';
import 'package:clean_a/customer/Presentation/pages/authorized_user_list.dart';
import 'package:clean_a/medicine/presentation/pages/medicine_detail.dart';
import 'package:clean_a/return/presentation/widgets/disposed_list.dart';
import 'package:clean_a/sales/presentation/widgets/sales.dart';
import 'package:clean_a/sales/presentation/widgets/screen/success_screen.dart';
import 'package:clean_a/supplier/presentation/widgets/supplier_list.dart';
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
        _currentScreen =  AddAuthorizedUser();
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
case '/suppliers/suppliers_List':
        _currentScreen = SupplierList();
        break;
case '/return/disposed_List':
        _currentScreen = DisposedListDetail();
        break;
case '/branch/branch_List':
        _currentScreen = BranchListPage();
        break;

case '/branch/branch_Stock':
        _currentScreen = BranchStockPage();
        break;
      default:
        _currentScreen = const DashboardPage(); // Default to dashboard if route not found
        break;
    }
    notifyListeners();
  }
}
