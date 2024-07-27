
import 'package:clean_a/branch_M/presentation/pages/branch_list_page.dart';
import 'package:clean_a/branch_M/presentation/pages/refill_request_page.dart';
import 'package:clean_a/branch_M/presentation/widgets/add_branch.dart';
import 'package:clean_a/customer/Presentation/pages/add_authorized_user.dart';
import 'package:clean_a/customer/Presentation/pages/authorized_user_list.dart';
import 'package:clean_a/employee/presentation/page/attendance_pages.dart';
import 'package:clean_a/employee/presentation/page/salary_list_page.dart';
import 'package:clean_a/medicine/presentation/pages/medicine_detail.dart';

import 'package:clean_a/sales/presentation/widgets/sales_page.dart';
import 'package:clean_a/supplier%20copy/presentation/widgets/supplier_list.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/dashboard/presentation/pages/dashboard_screen.dart';

import 'package:clean_a/customer/Presentation/pages/add_authorized_company.dart';

import 'branch_M/presentation/pages/branch_stock_page.dart';
import 'employee/presentation/page/employee_profile.dart';
import 'finance/presentation/widgets/expense.dart';
import 'finance/presentation/widgets/income.dart';
import 'report/presentation/widgets/generated_purchase_reports.dart';
import 'report/presentation/widgets/generated_sales_reports.dart';
import 'report/presentation/widgets/report_generate.dart';
import 'report/presentation/widgets/report_purchase.dart';
import 'return/presentation/widgets/add_disposed.dart';
import 'return/presentation/widgets/delete_disposedItem.dart';
import 'return/presentation/widgets/disposed_list.dart';
import 'settings/presentation/widgets/password_request.dart';
import 'settings/presentation/widgets/report_complaint.dart';
import 'settings/presentation/widgets/view_roles_page.dart';
import 'stock/presentation/widgets/expired_medicines.dart';
import 'stock/presentation/widgets/list_of_stock.dart';
import 'stock/presentation/widgets/out_of_stock.dart';
import 'stock/presentation/widgets/stock_detail.dart';
//import 'supplier/presentation/widgets/add_supplier.dart';
//import 'supplier/presentation/widgets/supplier_list.dart';
 
        

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
         case '/customer/authorized_user':
        _currentScreen =  AuthorizedUser();
        break;
      case '/customer/add_authorized_company':
        _currentScreen = const AddAuthorizedCompany();
        break;
        //medicine
case '/medicine/details':
        _currentScreen =  MedicineDetail();
        break;
        //sales
case '/sales':
        _currentScreen =const Sales();
        break;
case '/sales/page' :
    _currentScreen = const Sales();
    break;
case '/branch/stock':
       _currentScreen =const BranchStockPage();
       break;
case   '/branch/refill_request': 
    _currentScreen=const RefillRequestPage();
    break;
  case '/branch/add': 
  _currentScreen= AddBranch();
    break;
    case    '/branch/list': 
    _currentScreen= const BranchListPage();
    break;

  case   '/employee/profile':
  _currentScreen= const EmployeeProfilePage();
  break;
  case  '/employee/attendance': 
  _currentScreen= const AttendancePage();
  break;
  case '/employee/salary': 
  _currentScreen=const SalaryListPage();
  break;
  // case '/finance/invoice_details':
  // _currentScreen =const 
  case  '/finance/expense': 
  _currentScreen= const ExpensePage();
  break;
  case  '/finance/income': 
  _currentScreen= const IncomePage();
  break;
  case '/reports/generated_purchase': 
      _currentScreen= const GeneratedPurchaseReports();
      break;
  case '/reports/purchase': 
  _currentScreen=const ReportPGenerate();
  break;
  case '/reports/generated_sales': 
  _currentScreen= const GeneratedSReports(fromDate: '', toDate: '',);
  break;
  case '/reports/sales': 
  _currentScreen=const ReportGenerate();
  break;
  case  '/return/new': 
  _currentScreen=const AddDisposed();
  break;
  // case '/return/delete_disposed_item': 
  // _currentScreen= const DeleteDisposedItem();
  // break;
  case '/return/list': 
  _currentScreen =const DisposedList();
  break;
  case '/settings/password_requests': 
           _currentScreen = const PasswordRequestsPage();
   break;
   case '/settings/report_complaints': 
            _currentScreen= const ReportComplaintsPage();
            break;
  case  '/settings/view_roles':
  _currentScreen=const ViewRolesPage();
  break;
  case   '/stock/expired': 
  _currentScreen= const ExpiredMedicinesPage();
  break;
  case '/stock/list': 
  _currentScreen= const ListOfStockPage();
  break;
  case '/stock/out_of_stock': 
    _currentScreen=const OutOfStockItemsPage();
    break;
case '/stock/details': 
_currentScreen= const StockDetailPage();
break;
case   '/supplier/add':
//_currentScreen= const AddSupplier();
break;
case '/supplier/list': 
_currentScreen=const SupplierLists();
break;
      default:
        _currentScreen = const DashboardPage(); // Default to dashboard if route not found
        break;
    }
    notifyListeners();
  }
}
