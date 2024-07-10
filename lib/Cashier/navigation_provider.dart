import 'package:clean_a/Cashier/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:clean_a/Cashier/finance/presentation/widgets/income.dart';
import 'package:clean_a/Cashier/report/presentation/widgets/generated_purchase_reports.dart';
import 'package:clean_a/Cashier/report/presentation/widgets/generated_sales_reports.dart';
import 'package:clean_a/Cashier/report/presentation/widgets/report_purchase.dart';
import 'package:clean_a/Cashier/sales/presentation/widgets/sales.dart';
import 'package:clean_a/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:flutter/material.dart';
   
                    

                
class CashierProvider extends ChangeNotifier {
  Widget _currentScreen = const DashboardPageCashier();

  Widget get currentScreen => _currentScreen;

  void navigateTo(String route) {
    switch (route) {
      case '/dashboard':
        _currentScreen = const DashboardPageCashier();
        break;
      // case '/financeCashier/invoice_details':
      //   _currentScreen = const AddAuthorizedUser();
      
        //  case '/financeCashier/dashboard':
        // _currentScreen = const DashBoardScreenFinance();
        // break;
      case '/reportsCashier/generated_purchase':
        _currentScreen = const GeneratedPurchaseReportsCashier();
        break;
        //medicine
case '/reportsCashier/purchase':
        _currentScreen =const ReportPGenerateCashier();
        break;
        //sales
case '/reportsCashier/generated_sales':
        _currentScreen = const GeneratedSReportsCashier();
        break;
case  '/reportsCashier/sales':
    _currentScreen = const SalesCashier();
    break;
case'/salesCashier/page':
       _currentScreen = const SalesCashier();
       break;
  case '/financeCashier/income': 
  _currentScreen= const IncomePageCashier();
  break;

      default:
        _currentScreen = const DashboardPageCashier(); // Default to dashboard if route not found
        break;
    }
    notifyListeners();
  }
}
