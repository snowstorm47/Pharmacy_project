import 'package:clean_a/Pharmacist/branch_M/presentation/pages/branch_list_page.dart';
import 'package:clean_a/Pharmacist/branch_M/presentation/pages/branch_stock_page.dart';
import 'package:clean_a/Pharmacist/branch_M/presentation/pages/refill_request_page.dart';
import 'package:clean_a/Pharmacist/customer/Presentation/authorized_user_list.dart';
import 'package:clean_a/Pharmacist/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:clean_a/Pharmacist/medicine/presentation/pages/medicine_detail.dart';
import 'package:clean_a/Pharmacist/return/presentation/widgets/add_disposed.dart';
import 'package:clean_a/Pharmacist/return/presentation/widgets/disposed_list.dart';
import 'package:clean_a/Pharmacist/sales/presentation/widgets/sales.dart';
import 'package:clean_a/Pharmacist/stock/presentation/widgets/expired_medicines.dart';
import 'package:clean_a/Pharmacist/stock/presentation/widgets/list_of_stock.dart';
import 'package:clean_a/Pharmacist/stock/presentation/widgets/out_of_stock.dart';
import 'package:clean_a/Pharmacist/stock/presentation/widgets/stock_detail.dart';
import 'package:flutter/material.dart';

import '../dashboard/presentation/pages/dashboard_screen.dart';
import 'return/presentation/widgets/delete_disposedItem.dart';

class PharmacistProvider extends ChangeNotifier {
  Widget _currentScreen = const DashboardPageP();

  Widget get currentScreen => _currentScreen;

  void navigateTo(String route) {
    switch (route) {
      case '/dashboard':
        _currentScreen = const DashboardPageP();
        break; 
         case '/customerP/authorized_user_list':
        _currentScreen = const AuthorizedUserP();
        break;
        //medicine
case '/medicine/medicine_list':
        _currentScreen =const MedicineDetailP();
        break;
        //sales
case '/salesP':
        _currentScreen =const SalesP();
        break;
case '/salesP/page' :
    _currentScreen = const SalesP();
    break;
case '/branchP/stock':
       _currentScreen =const  BranchStockPageP();
       break;
case   '/branchP/refill_request': 
  //  _currentScreen=const  RefillRequestPageP();
    break;
    case    '/branchP/list': 
    _currentScreen=const BranchListPageP();
    break;
  case  '/returnP/new': 
  _currentScreen=const AddDisposedP();
  break;
  case '/returnP/delete_disposed_item': 
  _currentScreen= const DeleteDisposedItemP();
  break;
  case '/returnP/list': 
  _currentScreen =const DisposedListP();
  break;
  case   '/stockP/expired': 
  _currentScreen= const ExpiredMedicinesPageP();
  break;
  case '/stockP/list': 
  _currentScreen=const ListOfStockPageP();
  break;
  case '/stockP/out_of_stock': 
    _currentScreen=const OutOfStockItemsPageP();
    break;
case '/stockP/details': 
_currentScreen=const StockDetailPageP();
break;
      default:
        _currentScreen = const DashboardPageP(); // Default to dashboard if route not found
        break;
    }
    notifyListeners();
  }
}