import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/branch_M/presentation/pages/branch_list_page.dart';
import 'package:clean_a/branch_M/presentation/pages/branch_stock_page.dart';
import 'package:clean_a/branch_M/presentation/pages/refill_request_page.dart';
import 'package:clean_a/branch_M/presentation/widgets/add_branch.dart';

//import 'package:clean_a/branch_M/presentation/widgets/branch_stock_widet.dart';
import 'package:clean_a/customer/Presentation/add_autho_user.dart';
import 'package:clean_a/customer/Presentation/auto_user_list.dart';
import 'package:clean_a/customer/Presentation/pages/add_autorized_company.dart';
import 'package:clean_a/employee/presentation/page/EmployeeProfilePage.dart';
import 'package:clean_a/employee/presentation/page/attendance_pages.dart';
import 'package:clean_a/employee/presentation/page/salary_list_page.dart';
//import 'package:clean_a/finance/presentation/pages/dashboard_screen.dart';
import 'package:clean_a/finance/presentation/pages/invoice_details.dart';
import 'package:clean_a/finance/presentation/widgets/expense.dart';
import 'package:clean_a/finance/presentation/widgets/income.dart';

import 'package:clean_a/medicine/presentation/pages/medicinedetail.dart';

//import 'package:clean_a/medicine/presentation/widgets/meddetail.dart';
import 'package:clean_a/report/presentation/widgets/generated_p_eports.dart';
import 'package:clean_a/report/presentation/widgets/generated_sales_reports.dart';
import 'package:clean_a/report/presentation/widgets/reportPurchase.dart';
import 'package:clean_a/report/presentation/widgets/reportgenerate.dart';
import 'package:clean_a/return/presentation/widgets/addDisposed.dart';
import 'package:clean_a/return/presentation/widgets/deleteDisposedItem.dart';
import 'package:clean_a/return/presentation/widgets/disposedlist.dart';
import 'package:clean_a/sales/presentation/widgets/sales.dart';
//import 'package:clean_a/sales/presentation/widgets/sales_page.dart';
import 'package:clean_a/settings/presentation/widgets/passwordrequest.dart';
import 'package:clean_a/settings/presentation/widgets/reportcomplaint.dart';
import 'package:clean_a/settings/presentation/widgets/viewrolespage.dart';
import 'package:clean_a/stock/presentation/widgets/expired_medicines.dart';
import 'package:clean_a/stock/presentation/widgets/list_of_stock.dart';
import 'package:clean_a/stock/presentation/widgets/out_of_stock.dart';
import 'package:clean_a/stock/presentation/widgets/stock_detail.dart';
import 'package:clean_a/supplier/presentation/widgets/add_supplier.dart';
import 'package:clean_a/supplier/presentation/widgets/supplier_list.dart';
// Make sure this import path is correct

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy Demo',
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const SideMenuPageSuper(), // Set this as the home screen
        // ##### Branch Routes #####
        '/branch/stock': (context) => const BranchStockPage(),
        '/branch/refill_request': (context) => const RefillRequestPage(),
        '/branch/add': (context) => const AddBranch(),
        '/branch/list': (context) => const BranchListPage(),
        // '/branch/stock_widget': (context) => BranchStockWidget(),

        // ##### Customer Routes #####
        '/customer/add_authorized_company': (context) =>
            const AddAuthorizedCompany(),
        '/customer/authorized_user': (context) => const AuthorizedUser(),
        '/customer/add_authorized_user': (context) => const AddAuthorizedUser(),

        // ##### Employee Routes #####
        '/employee/profile': (context) => const EmployeeProfilePage(),
        '/employee/attendance': (context) => const AttendancePage(),
        '/employee/salary': (context) => const SalaryListPage(),

        // ##### Finance Routes #####
        // '/finance/dashboard': (context) => DashBoardScreenFinance(),
        '/finance/invoice_details': (context) => InvoiceDetails(),
        '/finance/expense': (context) => const ExpensePage(),
        '/finance/income': (context) => const IncomePage(),

        // ##### Medicine Routes #####
        //'/medicine/add': (context) => AddMed(),
        '/medicine/details': (context) => const MedicineDetail(),
        //'/medicine/delete': (context) => DeleteMed(),

        // ##### Report Routes #####
        '/reports/generated_purchase': (context) =>
            const GeneratedPurchaseReports(),
        '/reports/purchase': (context) => const ReportPGenerate(),
        '/reports/generated_sales': (context) => const GeneratedSReports(),
        '/reports/sales': (context) => const ReportGenerate(),
        // ##### Return Routes #####
        '/return/add_disposed': (context) => const AddDisposed(),
        '/return/delete_disposed_item': (context) => const DeleteDisposedItem(),
        '/return/disposed_list': (context) => const DisposedList(),

        // ##### Sales Routes #####
        '/sales': (context) => const Sales(),
        '/sales/page': (context) => const Sales(),

        // ##### Settings Routes #####
        '/settings/password_requests': (context) =>
            const PasswordRequestsPage(),
        '/settings/report_complaints': (context) =>
            const ReportComplaintsPage(),
        '/settings/view_roles': (context) => const ViewRolesPage(),

        // ##### Stock Routes #####
        '/stock/expired': (context) => const ExpiredMedicinesPage(),
        '/stock/list': (context) => const ListOfStockPage(),
        '/stock/out_of_stock': (context) => const OutOfStockItemsPage(),
        '/stock/details': (context) => const StockDetailPage(),

        // ##### Supplier Routes #####
        '/supplier/add': (context) => const AddSupplier(),
        '/supplier/list': (context) => const SupplierLists(),
      },
    );
  }
}
